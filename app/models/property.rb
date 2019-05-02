class Property < ApplicationRecord
	belongs_to :user
	has_many :agents
	enum approval_type: [:Auto_approves, :Agent_approves, :Occupant_approves]
	mount_uploader :picture, PictureUploader
end
