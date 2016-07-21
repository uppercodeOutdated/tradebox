class User < ActiveRecord::Base
  belongs_to :shop
  belongs_to :company
end
