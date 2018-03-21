class PlayersController < ApplicationController
  before_action :set_player, only: [:show]

  # GET /players/:id
  def show
    render json: @player
  end

  # GET /players/football
  def football_index
    @players = FootballPlayer.all
    render json: @players
  end

  # GET /players/basketball
  def basketball_index
    @players = BasketballPlayer.all
    render json: @players
  end

  # GET /players/baseball
  def baseball_index
    @players = BaseballPlayer.all
    render json: @players
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end
end
