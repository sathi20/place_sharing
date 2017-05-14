class CreateSharedLocations < ActiveRecord::Migration
  def change
    create_table :shared_locations do |t|
      t.integer :location_id, null: false
      t.integer :friend_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
    add_index :shared_locations, [:location_id, :user_id, :friend_id], unique: true
  end
end
