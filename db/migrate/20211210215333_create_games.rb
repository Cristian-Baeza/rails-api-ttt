# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :game_state
      t.string :current_player
      t.text :board

      t.timestamps
    end
  end
end
