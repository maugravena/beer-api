class Beer < ApplicationRecord
  validates :style, :min_temperature, :max_temperature, presence: true
end
