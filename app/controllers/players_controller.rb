class PlayersController < ApplicationController
  before_action :set_player, only: [:show]

  # GET /players/:id
  def show
    render json: @player
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end
end
