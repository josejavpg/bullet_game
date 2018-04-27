class RankingController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @ranking = Ranking.all.order(points: :desc).limit(5)
    #@ranking.order(:points)
  end

  def game
  end

  def match
    self.create
  end

  def create
    nickname1 = params[:nickname_player1]
    nickname2 = params[:nickname_player2]
    @first_player = create_player(nickname1)
    @second_player = create_player(nickname2)
  end

  #this method check if that nickname played before and return his points. 
  def previous_game(nickname)
    @ranking = Ranking.all
    previous = @ranking.find_by(nickname: nickname)
    if previous.nil?
      0
    else
       previous.points
    end
  end

  #create
  def create_player(nickname)
    Ranking.new(nickname: nickname, points: 0)
  end

  #set points for players
  def end_game
    @first_player.points += Ranking.pointsCalculator(true)
    @second_player.points  += Ranking.pointsCalculator(false)
    record_player(first_player)
    record_player(second_player)
    redirect_to home
  end

  def record_player(player)
    aux = player.points # to secure the previous points in case the nickname exist
    if previous_game(player.nickname) > 0
     player = Ranking.all.find_by(nickname: player.nickname) #if the elmente exist, update while saving
    end
    player.points += previous_game(player.nickname) + aux
    player.save
  end

end
