class PlayersController < ApplicationController
  before_action :set_player, only: [:show]

  # GET /players/:id
  def show
    render json: @player
  end

  def football_index
    @players = FootballPlayer.all
    render json: @players
  end

  def basketball_index
    @players = BasketballPlayer.all
    render json: @players
  end

  def baseball_index
    @players = BaseballPlayer.all
    render json: @players
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end
end
