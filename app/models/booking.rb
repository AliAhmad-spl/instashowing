class Booking < ApplicationRecord
  belongs_to :property
  validates :start_time, presence: true, uniqueness: true
end
