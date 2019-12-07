class AddAverageTemperatureToBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :average_temperature, :float
  end
end
