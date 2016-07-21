class Company < ActiveRecord::Base
  has_many :products
  has_many :bookings
  has_many :users
end
