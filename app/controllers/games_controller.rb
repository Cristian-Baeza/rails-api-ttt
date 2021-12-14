# frozen_string_literal: true

# Comment necessary for Rubocop
class GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]

  def render_game_with_state_and_player(game)
    render json: game.as_json.merge(
      "game_state": "#{game.board.game_over? ? "GAME OVER" : "IN-PROGRESS"}",
      "current_player": "#{game.board.current_player}"
    )
  end


  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render_game_with_state_and_player(@game)
  end

  # POST /games
  def create
    Game.delete_all
    new_game = TicTacToeLogic::GameBoardData.new
    @game = Game.new({ "board": new_game })

    if @game.save
      render_game_with_state_and_player(@game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # POST '/submit_move/:move'
  def submit_move
    @game = Game.find(1)
    @game.board.play_move(params[:move].to_i)

    if @game.save
      render_game_with_state_and_player(@game)
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
