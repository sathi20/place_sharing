class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address, null: false
      t.st_point :coordinates, geographic: true
      t.boolean :is_public, default: true, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
    add_index :locations, :coordinates, using: :gist
    add_index :locations, :user_id
  end
end

