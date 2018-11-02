class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likable, :dependent => :destroy
  has_many :comments, as: :commentable
end
