class StaticController < ApplicationController

  def cover
  	render layout: false
  end

  def home
  	@secret = ENV["pusher_app_id"]
  	render 'cover' unless signed_in?
  end
end
