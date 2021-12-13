require 'rails_helper'

RSpec.describe Game, type: :model do

  describe "should have :game_state header" do
  it { should validate_presence_of(:game_state) }
  end
  
  describe "should have :current_player header" do
    it { should validate_presence_of(:current_player) }
  end
  
  describe "should have :board header" do
    it { should validate_presence_of(:board) }
  end
end
