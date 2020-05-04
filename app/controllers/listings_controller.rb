class ListingsController < ApplicationController
    # before a user can do anything inside this controller, they need to be logged in 
    before_action :authenticate_user!
    def index 
        # instance variable that can be accessed inside a view
        @listings = Listings.all
    end

    def new 
        # making a new instance of the Listing object (it is blank)
        # we use this within a Form 
        @listing = Listing.new
    end
end