class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :bookings

  def active_for_authentication?
    super and self.active?
  end

  def activate_account!
    update_attribute :active, true
    binding.pry
  end

  def deactivate_account!
    update_attribute :active, false
    binding.pry
  end
end
