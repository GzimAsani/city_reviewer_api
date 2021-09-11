class AddAverageToAirlines < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :average_score, :integer, default: 0 
  end
end
