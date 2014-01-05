class Adresse < ActiveRecord::Base
	geocoded_by :adresse
  validates_presence_of :strasse, :hausnummer, :plz, :stadt

def adresse
 [strasse, hausnummer, plz, stadt].compact.join(', ')
end
after_validation :geocode, :if => :strasse_changed?



belongs_to :user

end
