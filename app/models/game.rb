# frozen_string_literal: true

class Game < ApplicationRecord
  serialize :board, Array
  validates :board, presence: true
end

def render_game_with_state_and_player(game)
  game.as_json.merge(
    "game_state": "#{game.board.game_over? ? "GAME OVER" : "IN-PROGRESS"}",
    "current_player": "#{game.board.current_player}"
  )
end
