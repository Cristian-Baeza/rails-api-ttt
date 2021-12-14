# frozen_string_literal: true

class Game < ApplicationRecord
  serialize :board, Array
  validates :board, presence: true
end
