class Customer < ApplicationRecord
  has_many :bookings
  has_many :billings
  has_many :feedbacks
end
