class CreateContactsProject < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts_projects do |t|
      t.references :contacts, index: true, foreign_key: true
      t.references :projects, index: true, foreign_key: true
    end
  end
end
