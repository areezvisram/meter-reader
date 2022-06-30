class AddMeterReadingToFourBeginnerMeters < ActiveRecord::Migration[6.0]
  def change
    add_column :four_beginner_meters, :reading, :integer
  end
end
