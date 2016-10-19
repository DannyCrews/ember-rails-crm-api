class CreateContactsOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts_offers do |t|
      t.references :contact, foreign_key: true
      t.references :offer, foreign_key: true
    end
  end
end
