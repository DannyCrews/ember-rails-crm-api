class CreateAuthTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tokens do |t|
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
