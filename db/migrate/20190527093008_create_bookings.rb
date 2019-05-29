class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :property, foreign_key: true
      t.string 	:email
      t.string 	:name
      t.integer :phone
      t.timestamps
    end
  end
end
