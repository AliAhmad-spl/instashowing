class Agent < ApplicationRecord
	belongs_to :property
	mount_uploader :picture, PictureUploader
end
