class ListingsController < ApplicationController
    # before a user can do anything inside this controller, they need to be logged in 
    before_action :authenticate_user!
    def index 
        # instance variable that can be accessed inside a view
        @listings = Listings.all
    end

    # THIS IS JUST A GET REQUEST -RENDERING HTML FORM
    def new 
        # making a new instance of the Listing object (it is blank)
        # we use this within a Form 
        @listing = Listing.new
    end

    def show 
        @listing = Listing.find(params["id"])
    end

    def create 
        @listing = current_user.listings.create(listing_params)
        if @listing.errors.any?
            render "new"
        else 
            redirect_to listings_path 
        end

        # redirects back to where we are showing all of the listings
        redirect_to listings_path
    end

    # We ONLY want User who created the listing able to edit it
    # ALL THIS IS DOING IS RENDERING HTML FOR THE FORM - GET REQUEST
    # Instead of looking through all of the listings in the app for the id, we will
    # only look through the listings of the current user
    def edit 
        @listing = current_user.listings.find_by_id(params["id"])

        # if we have found a listing render the edit page, otherwise redirect back to main listings page
        if @listing 
            render("edit")
        else 
            redirect_to listings_path
        end
    end

    # UPDATES THE ACTUAL DATABASE (PUT AND PATCH REQUESTS)
    def update 
        @listing = current_user.listings.find_by_id(params["id"])
        
        if @listing
            @listing.update(listing_params)
            if @listing.errors.any?
                render "edit"
            else
                redirect_to listings_path
            end
        else 
            redirect_to listings_path
        end
    end


    # code inside object only can access this code
    private 

    # very important to utilize this
    def listing_params
        params.require(:listing).permit(:title, :price, :description, :picture)
    end

end