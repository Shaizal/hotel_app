class CreateRoomTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :room_types do |t|
      t.string :room_type
      t.text :description
      t.float :price
      t.integer :occupancy_limit
      t.string :image
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
