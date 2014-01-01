class Adresse < ActiveRecord::Base
geocoded_by :adresse
def adresse
  [strasse, hausnummer, plz, stadt].compact.join(', ')
end
after_validation :geocode, :if => :strasse_changed?
end
