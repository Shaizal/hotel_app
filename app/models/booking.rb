class Booking < ApplicationRecord
  belongs_to :hotel
  has_one :check_in_out
  has_one :billing
  has_one :feedback
  has_many :guests
  has_many :booking_rooms
  has_many :rooms, through: :booking_rooms

end
