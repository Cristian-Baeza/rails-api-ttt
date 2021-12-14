# frozen_string_literal: true

# Comment necessary for Rubocop
class GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    Game.delete_all
    new_game = TicTacToeLogic::GameBoardData.new
    @game = Game.new({ "game_state": "IN-PROGRESS", "current_player": new_game.current_player.to_s, "board": new_game })

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # POST '/submit_move/:move'
  def submit_move
    @game = Game.find(1)
    @game.board.play_move(params[:move].to_i)
    @game.current_player = @game.board.current_player
    @game.game_state = @game.board.game_over? ? "GAME OVER" : "IN-PROGRESS"

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:game_state, :current_player, board: [])
  end
end
