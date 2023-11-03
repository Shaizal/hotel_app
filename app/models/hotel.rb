class Hotel < ApplicationRecord
has_many :rooms
has_many :bookings
has_many :room_types
end

