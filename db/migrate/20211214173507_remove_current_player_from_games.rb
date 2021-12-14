class RemoveCurrentPlayerFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :currentPlayer, :string
  end
end
