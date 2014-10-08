class Playlist < ActiveRecord::Base
  has_many :videos, :through => :playlistVideos
  belongs_to :user
  has_many :playlistVideos
end
