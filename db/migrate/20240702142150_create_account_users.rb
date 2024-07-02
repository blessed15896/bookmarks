class CreateAccountUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :account_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :date_of_birth
      t.string :password_digest

      t.timestamps
    end
    add_index :account_users, :email, unique: true
  end
end
