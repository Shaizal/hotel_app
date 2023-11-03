class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_no
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
