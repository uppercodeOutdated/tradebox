class Product < ActiveRecord::Base
  has_many   :bookings
  belongs_to :company
end
