class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :videos, foreign_key: "author_id"
end
