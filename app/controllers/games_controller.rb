# frozen_string_literal: true

# Comment necessary for Rubocop
class GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/:id
  def show
    render json: render_game_with_state_and_player(@game)
  end

  # POST /games
  def create
    @game = Game.new({ "board": TicTacToeLogic::GameBoardData.new })

    if @game.save
      render json: render_game_with_state_and_player(@game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # POST '/submit_move/:id/:move'
  def submit_move
    @game = Game.find(params[:id])
    @game.board.play_move(params[:move].to_i)

    if @game.save
      render json: render_game_with_state_and_player(@game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/:id
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
    params.require(:game).permit(board: [])
  end
end
