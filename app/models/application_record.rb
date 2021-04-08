# frozen_string_literal: true

# ApplicationRecord Abstract Class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
