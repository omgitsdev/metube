class Video < ActiveRecord::Base
  validates :author, presence: true
  validates :url, presence: true
  belongs_to :author, class_name: "User"
end
