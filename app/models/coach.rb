class Coach < ApplicationRecord
  has_many :bookings
  has_many :coach_availabilities
end
