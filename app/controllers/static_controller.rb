class StaticController < ApplicationController
  def cover
  	render layout: false
  end

  def home
  	render 'cover' unless signed_in?
  end
end
