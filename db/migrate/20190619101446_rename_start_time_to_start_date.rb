class RenameStartTimeToStartDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :start_time, :start_date
  end
end
