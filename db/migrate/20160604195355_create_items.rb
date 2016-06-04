class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.number :style
      t.float :price
      t.string :photo

      t.timestamps null: false
    end
  end
end
