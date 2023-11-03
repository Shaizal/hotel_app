class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.string :feature_name
      t.text :feature_desc
      t.string :icon

      t.timestamps
    end
  end
end
