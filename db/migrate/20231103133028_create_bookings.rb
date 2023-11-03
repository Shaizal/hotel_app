class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out
      t.integer :no_of_guests
      t.string :status
      t.string :cancellation_policy
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
