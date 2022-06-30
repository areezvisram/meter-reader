class CreateFourBeginnerMeters < ActiveRecord::Migration[6.0]
  def change
    create_table :four_beginner_meters do |t|
      t.integer :meter_id
      t.blob :meter_object

      t.timestamps
    end
  end
end
