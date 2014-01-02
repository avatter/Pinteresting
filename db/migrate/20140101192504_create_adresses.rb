class CreateAdresses < ActiveRecord::Migration
  def change
    create_table :adresses do |t|
      t.string :strasse
      t.string :hausnummer
      t.string :plz
      t.string :stadt
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.timestamps
    end
  end
end
