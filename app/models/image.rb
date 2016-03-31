class Image < ActiveRecord::Base

  belongs_to :flat

  mount_uploader :photo, PhotoUploader

end
