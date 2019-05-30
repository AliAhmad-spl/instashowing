class Booking < ApplicationRecord
  belongs_to :property
  validates :start_time,uniqueness: true
  enum status: [:approved, :time_unavailable, :denied]
end
