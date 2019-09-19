class RenameEndTimeToExpirationDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :end_tiem, :expiration_date
  end
end
