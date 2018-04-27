class RankingController < ApplicationController
  def index
    @ranking = Ranking.all.order(points: :desc).limit(5)
    #@ranking.order(:points)
  end

  def game
    
  end

  def create
    @ranking = Ranking.new
    nickname1 = params[:nickname_player1]
    nickname2 = params[:nickname_player2]
    @first_player = Ranking.new(nickname: nickname1, points: 0).save #previous_game(nickname1)? previous_game(nickname1) : 
    @second_player = Ranking.new(nickname: nickname2, points: 0).save #previous_game(nickname2)? previous_game(nickname2) : 
  end

  def match
    self.create
  end

  def previous_game(nickname)
    @ranking = Ranking.all
    @ranking.where(nickname: nickname)
  end

end
