# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process eager: true

  version :bright_face do
    cloudinary_transformation width: 200, height: 200, crop: :thumb, gravity: :face
  end

end
