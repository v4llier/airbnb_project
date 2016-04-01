class Review < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user

  validates :content, length: { minimum: 20 }
end
