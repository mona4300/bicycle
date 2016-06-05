class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :style
      t.float :price
      t.string :photo

      t.timestamps null: false
    end
  end
end
