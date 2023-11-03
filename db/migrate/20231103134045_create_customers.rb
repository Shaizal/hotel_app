class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :phone_no
      t.date :dob
      t.string :email

      t.timestamps
    end
  end
end
