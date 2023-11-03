class CreateBillings < ActiveRecord::Migration[7.0]
  def change
    create_table :billings do |t|
      t.string :payment_method
      t.float :amount
      t.string :transaction_id
      t.string :payment_status
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
