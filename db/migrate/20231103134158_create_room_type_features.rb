class CreateRoomTypeFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :room_type_features do |t|
      t.references :room_type, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
