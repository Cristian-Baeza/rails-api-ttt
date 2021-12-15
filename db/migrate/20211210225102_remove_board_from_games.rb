# frozen_string_literal: true

class RemoveBoardFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :board, :string
  end
end
