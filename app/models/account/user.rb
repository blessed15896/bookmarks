# == Schema Information
#
# Table name: account_users
#
#  id              :bigint           not null, primary key
#  date_of_birth   :date
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_account_users_on_email  (email) UNIQUE
#
class Account::User < ApplicationRecord
  has_one_attached :photo
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 3 }
  validates :password, length: { minimum: 6 }
end

