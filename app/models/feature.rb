class Feature < ApplicationRecord
has_many :room_type_features
has_many :features, through: :room_type_features
end
