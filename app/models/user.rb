class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many   :bookings
  belongs_to :shop
  belongs_to :company

  ROLES = %i[customer provider].freeze

  def full_name
    "#{first_name} #{last_name}"
  end

  def coworkers
    has_role?(:provider) ? company.users : shop.users
  end

  def has_role?(role_name)
    role.to_sym == role_name.to_sym
  end

  validates :role,       presence: true
  validates :shop_id,    presence: true, unless: ->(user){ user.company_id.present? }
  validates :company_id, presence: true, unless: ->(user){ user.shop_id.present?    }
end
