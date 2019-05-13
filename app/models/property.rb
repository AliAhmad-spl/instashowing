class Property < ApplicationRecord
	belongs_to :user
	has_many :agents
	enum approval_type: [:Auto_approves, :Agent_approves, :Occupant_approves]
	mount_uploaders :pictures, PictureUploader
	serialize :pictures, JSON
	enum status: [:Live, :pending]
	extend FriendlyId
	friendly_id :generated_slug, use: :slugged
	def generated_slug
		@random_slug ||= persisted? ? friendly_id : ('a'..'z').to_a.shuffle[0,5].join + (1..9).to_a.shuffle[0,7].join
	end
end
