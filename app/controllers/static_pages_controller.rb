class StaticPagesController < ApplicationController
  require 'flickraw'

  def home
    FlickRaw.api_key = ENV["FLICKRAW_API_KEY"]
    FlickRaw.shared_secret = ENV["FLICKRAW_SHARED_SECRET"]

    flickr = FlickRaw::Flickr.new

    unless params[:flickr_id].nil?
      @photos = flickr.people.getPhotos(user_id: params[:flickr_id])
      @urls = []
      @photos.each do |photo|
        @urls << "https://farm#{photo.farm}.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}.jpg"
      end
    end

  end

end
