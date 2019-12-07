class Beer < ApplicationRecord
  validates :style, :min_temperature, :max_temperature, presence: true
  before_save :calculate_avg

  def calculate_avg
    self.average_temperature = (self.min_temperature + self.max_temperature).to_f / 2
  end
end
