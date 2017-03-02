class CreateWindows < ActiveRecord::Migration[5.0]
  def change
    create_table :windows do |t|
      t.string :name
      t.string :title
      t.text :description
      t.integer :size
      t.string  :model
      t.integer  :price
      t.string :image

      t.timestamps
    end
  end
end
