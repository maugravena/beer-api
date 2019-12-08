class Beer < ApplicationRecord
  validates :style, :min_temperature, :max_temperature, presence: true
  before_save :calculate_avg

  def self.style_by_temperature(input)
    order(
      Arel.sql("abs(average_temperature - (#{input.to_i})) ASC"),
      Arel.sql('style ASC')
    ).limit(1)[0].style
  end

  def calculate_avg
    self.average_temperature = (self.min_temperature + self.max_temperature).to_f / 2
  end
end
