class Reservation < ApplicationRecord
	
	validate :start_must_be_before_end_date #sans le s
	validate :unique_reservation

	def start_must_be_before_end_date
  		return unless start_date and end_date
  		errors.add(:start_date, "must be before end date") unless start_date < end_date
	end

	def duration
    	return ((self.end_date - self.start_date).to_i/(60*60*24))
    end
    
    def is_started
  	  self.start_date < Time.now
  	end

  	def unique_reservation
  		if Listing.find(self.listing_id).overlaping_reservation?(self.start_date) == true
  			errors.add(:start_date, "the accomodation is taken already") 
  		end
  	end

	belongs_to :listing
	belongs_to :guest, class_name: "User" #au lieu de belongs_to :user
end
