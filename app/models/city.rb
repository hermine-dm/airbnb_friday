class City < ApplicationRecord
	validates :name,
	  presence: true,
	  uniqueness: true #une ville n'a pas le meme nom en fr
	validates :zip_code,
	  presence: true,
	  format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" } 
#Aet Z debut fin, | veut dire "ou", a{3}exactly 3 of a, 
	has_many :listings
}
end
