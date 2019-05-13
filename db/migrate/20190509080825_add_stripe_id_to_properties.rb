class AddStripeIdToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :stripe_id, :string
  end
end
