class Video < ActiveRecord::Base
  validates :author, presence: true
  validates :url, presence: true
  belongs_to :author, class_name: "User"
  has_many :playlists, :through => :playlistVideos
  has_many :playlistVideos
end
