# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'should have :board header' do
    it { should validate_presence_of(:board) }
  end
end
