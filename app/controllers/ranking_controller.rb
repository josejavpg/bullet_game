class RankingController < ApplicationController
  def index
    @ranking = Ranking.all
  end

  def game
    
  end

  def create
    @ranking = Game.new
    first_player = Ranking.create(nickname: get_params[:nickname_player1], points: 0)
    second_player = Ranking.create(nickname: get_params[:nickname_player2], points: 0)
  end

  def match
  end

  private
    def get_params
      params.require(:game).permit(:nickname_player1, :nickname_player2)
    end
end
