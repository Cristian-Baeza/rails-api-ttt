class RemoveGameStateFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :gameState, :string
  end
end
