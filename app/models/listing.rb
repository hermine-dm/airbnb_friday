class Listing < ApplicationRecord
	validates :available_beds,
	  presence: true,
	  numericality: { only_integer: true, greater_than_or_equal_to: 1}
	validates :price,
	  presence: true,
	  numericality: { only_integer: true, greater_than_or_equal_to: 0}
	validates :description,
	  presence: true,
	  length: { minimum: 140, too_short: "140 characters is the minimum allowed" }
	validates :welcome_message,
	  presence: true


	def overlaping_reservation?(datetime) #doit respecter le format 2019-10-28 13:17:42 pour tester par ex.
  # vérifie dans toutes les réservations du listing s'il y a une réservation qui tombe sur le datetime en entrée
  #Listing.find(7).overlaping_reservation?("2019-10-28 13:17:42 UTC")
		i = 0
		self.reservations.each do |reserv|
			if (reserv.start_date.to_date == datetime.to_date) || (reserv.start_date.to_date < datetime.to_date && reserv.end_date.to_date > datetime.to_date)
				 i +=1 
			end
		end
		if i > 0 then return true else return false end
	end

	belongs_to :admin, class_name: "User" #au lieu de belongs_to :user
	belongs_to :city
	has_many :reservations
end
