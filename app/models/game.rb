# frozen_string_literal: true

class Game < ApplicationRecord
  serialize :board, Array
  validates :game_state, presence: true
  validates :current_player, presence: true
  validates :board, presence: true
end
