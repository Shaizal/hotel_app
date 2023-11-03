class AddCustomerToBilling < ActiveRecord::Migration[7.0]
  def change
    add_reference :billings, :customer, null: false, foreign_key: true
  end
end
