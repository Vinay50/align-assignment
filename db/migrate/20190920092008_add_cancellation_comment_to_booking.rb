class AddCancellationCommentToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :cancellation_comment, :text
  end
end
