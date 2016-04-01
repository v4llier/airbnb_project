class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :unavailabilities
  has_many :bookings
  has_many :images
  has_many :reviews dependent: :destroy
  geocoded_by :built_address
  after_validation :geocode, if: :address_changed?


  def built_address
    self.address + ", " + self.city
  end

end
