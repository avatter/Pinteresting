json.array!(@adresses) do |adress|
  json.extract! adress, :id, :strasse, :hausnummer, :plz, :stadt, :latitude, :longitude
  json.url adress_url(adress, format: :json)
end
