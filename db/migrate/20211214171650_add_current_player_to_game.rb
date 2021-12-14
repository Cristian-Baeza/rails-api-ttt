class AddCurrentPlayerToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :currentPlayer, :string
  end
end
