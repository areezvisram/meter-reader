class RemoveMeterIdFromFourBeginnerMeters < ActiveRecord::Migration[6.0]
  def change
    remove_column :four_beginner_meters, :meter_id
  end
end
