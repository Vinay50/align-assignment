class Booking < ApplicationRecord
  belongs_to :user
  self.per_page = 10

  validates :seat, presence: true
  validates :start_date, presence: true
  validates :expiration_date, presence: :true
  validate :start_date_cannot_be_in_the_past,:expiration_date_cannot_be_in_the_past,
  :expiration_date_cannot_be_less_than_start_date, :desk_alreay_taken

  # custom validation for booking desk

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, 'can not be in past') if start_date.present? && start_date < Date.today
  end

  def expiration_date_cannot_be_in_the_past
    errors.add(:expiration_date, 'can not be in past') if expiration_date.present? && expiration_date < Date.today
  end

  def expiration_date_cannot_be_less_than_start_date
    errors.add(:start_date, 'can not be less than expiration date') if start_date.present? && expiration_date.present? && expiration_date < start_date
  end

  def desk_alreay_taken
    bookings = Booking.where(seat: self.seat, start_date: self.start_date..self.expiration_date)
    errors.add(:seat, 'aleardy booked for given dates') if bookings.count > 0
  end
end

