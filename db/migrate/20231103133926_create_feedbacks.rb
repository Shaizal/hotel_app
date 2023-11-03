class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.text :comments
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
