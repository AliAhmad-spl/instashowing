class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string  :pictures
      t.integer :beds
      t.integer :baths
      t.integer :status ,default: 1
      t.string :address
      t.integer :approval_type , default: 0
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
