class ListingsController < ApplicationController
	
	def show
		# byebug
		@listing = Listing.find(params[:id])
		@reservation = @listing.reservations.new
	end

	def index
    	@listings = Listing.all
  end

  def search
      # byebug
      # @listings = Listing.search(params[:term], fields: ["name", "country"], mispellings: {below: 5})
      price_range = [{from: 0, to: params[:listing][:price]}]
      
      criteria = {country: params[:country], name: params[:name] }
      
      criteria.delete_if { |k, v| v == '' }
      
      @listings = Listing.search '*',
        where: criteria
        # facets: { price: {ranges: price_range} }
      
      if @listings.blank?
        redirect_to listings_path, flash:{danger: "no successful search result"}
      else
        render :index
      end
  end

end