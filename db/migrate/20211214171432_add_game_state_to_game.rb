class AddGameStateToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :gameState, :string
  end
end
