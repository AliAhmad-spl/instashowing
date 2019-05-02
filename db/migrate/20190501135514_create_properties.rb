class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :picture
      t.integer :beds
      t.integer :baths
      t.string :address
      t.integer :approval_type , default: 0
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
