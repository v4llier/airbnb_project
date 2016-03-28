class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :unavailabilities
  has_many :bookings
end
