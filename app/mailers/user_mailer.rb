class UserMailer < ApplicationMailer
	def booking(user)
		mail(:to => user, :subject => "Your booking has been confirmed!")	
	end
	def agent(user)
		mail(:to => user, :subject => "Someone scheduled the booking with you!")	
	end

end
