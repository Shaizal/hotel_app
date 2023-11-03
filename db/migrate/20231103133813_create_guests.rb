class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :age
      t.string :phone_no
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
