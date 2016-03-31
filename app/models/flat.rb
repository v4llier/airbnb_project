class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :unavailabilities
  has_many :bookings
  has_many :images


end
