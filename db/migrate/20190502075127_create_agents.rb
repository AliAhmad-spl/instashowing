class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string :picture
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :property_id
      t.timestamps
    end
  end
end
