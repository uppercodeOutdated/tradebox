class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many   :bookings
  belongs_to :shop
  belongs_to :company

  ROLES = %i[customer provider]

  def full_name
    "#{first_name} #{last_name}"
  end

  validates :shop_id,    presence: true, unless: ->(user){ user.company_id.present? }
  validates :company_id, presence: true, unless: ->(user){ user.shop_id.present?    }
end
