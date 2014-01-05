class Adresse < ActiveRecord::Base
	geocoded_by :adresse
  validates_presence_of :strasse, :hausnummer, :stadt

validates_numericality_of :plz, in: 1001..9999
#validates_numericality_of :plz, greater_than_or_equal_to: 1001, less_than_or_equal_to: 9999





def adresse
 [strasse, hausnummer, plz, stadt].compact.join(', ')
end
after_validation :geocode #, :if => :strasse_changed?



belongs_to :user

end
