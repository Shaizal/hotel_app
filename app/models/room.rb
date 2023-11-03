class Room < ApplicationRecord
  belongs_to :hotel
  has_many :booking_rooms
  has_many :bookings, through: :booking_room
  has_many :room_availabilities
  has_many :room_types 
end
