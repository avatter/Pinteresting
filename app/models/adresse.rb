class Adresse < ActiveRecord::Base
	geocoded_by :adresse
  validates_presence_of :strasse, :hausnummer, :plz, :stadt

validates_numericality_of :plz, in: 1001..9999
validates_numericality_of :plz, greater_than_or_equal_to: 1001, less_than_or_equal_to: 9999
#validates_numericality_of :plz, :only_integer
#validates_numericality_of :plz, :greater_than => 1001
  #validates_numericality_of :plz :less_than_or_equal_to => 9999




def adresse
 [strasse, hausnummer, plz, stadt].compact.join(', ')
end
after_validation :geocode, :if => :strasse_changed?



belongs_to :user

end
