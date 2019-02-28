class Createbands < ActiveRecord::Migration[5.2]
  def change
    t.string :name, null:false
    t.timestamps
  end
  add_index :bands, unique: true
end
