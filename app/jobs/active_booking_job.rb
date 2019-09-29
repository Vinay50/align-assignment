class ActiveBookingJob < ApplicationJob
  #class InvalidSignatureCounts < RuntimeError; end
    require 'csv'
    queue_as :default

    def perform()
      Rails.logger.info "Starting ActiveBooking Job"
      generate_csv
      Rails.logger.info "Finished ActiveBooking Job"
    end

    private

    def generate_csv
      sleep 10
      file = CSV.generate do |csv|
        Booking.all.each do |_i|
          csv << %w[data1 data2 data3 data4 data5 data6 data7]
        end
      end
      file
    end

    def exception(petitions)
      InvalidSignatureCounts.new(error_message(petitions))
    end

    def error_message(petitions)
      I18n.t(
      :"invalid_signature_counts",
        scope:  :"petitions.errors",
        count:  petitions.size,
        ids:    petitions.map(&:id).inspect,
        id:     petitions.first.id.to_s
      )
    end
end
