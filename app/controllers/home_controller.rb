class HomeController < ApplicationController
    def home
    	@live = Property.first
    end
    def admin
        # render :layout => false
        # byebug
    end
end
