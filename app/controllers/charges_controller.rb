class ChargesController < ApplicationController
	def new
	end

	def create
	# Amount in cents
		@amount = 500
		customer = Stripe::Customer.create(
		:email => params[:stripeEmail],
		:source => params[:stripeToken]
		)
		charge = Stripe::Charge.create(
		:customer => customer.id,
		:amount => @amount,
		:description => 'Rails Stripe customer',
		:currency => 'usd'
		)
		Property.find(params[:property]).update(status:0)
		@live = Property.find(params[:property].to_i)
	  
	end
	def details
		@property = Property.friendly.find(params[:id])
	end
end
