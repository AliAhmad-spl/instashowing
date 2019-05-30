class Booking < ApplicationRecord
  belongs_to :property
  validates :start_time,uniqueness: true
end
