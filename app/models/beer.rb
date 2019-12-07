class Beer < ApplicationRecord
  validates :style, :min_temperature, :max_temperature, presence: true

  def style_by_temperature(temperature)
    'Dunkel'
  end
end
