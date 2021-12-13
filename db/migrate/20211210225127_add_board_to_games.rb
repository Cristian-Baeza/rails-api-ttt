# frozen_string_literal: true

class AddBoardToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :board, :text
  end
end
