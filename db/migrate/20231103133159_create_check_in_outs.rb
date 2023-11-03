class CreateCheckInOuts < ActiveRecord::Migration[7.0]
  def change
    create_table :check_in_outs do |t|
      t.datetime :checked_in_time
      t.datetime :checked_out_time
      t.string :stay_status
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
