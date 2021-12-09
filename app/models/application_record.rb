# frozen_string_literal: true

# rubocop requires a comment here
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
