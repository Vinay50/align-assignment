class AddCancellationReasonToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :cancellation_reason, :text
  end
end
