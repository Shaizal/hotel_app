class CreateRoomAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :room_availabilities do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :available
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
