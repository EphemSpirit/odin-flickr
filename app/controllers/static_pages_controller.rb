class StaticPagesController < ApplicationController
  require 'odin-flickr/config/initializers/flickr.rb'

  def home
    @flickr = FlickRaw::Flickr.new


  end
end
