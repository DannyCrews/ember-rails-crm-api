class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :type
      t.string :title
      t.text :description
      t.references :contact, foreign_key: true
      t.references :topic, polymorphic:true, index:true

      t.timestamps
    end
  end
end
