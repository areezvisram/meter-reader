class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :score

      t.timestamps null: false
    end
  end
end
