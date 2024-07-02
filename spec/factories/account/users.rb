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
FactoryBot.define do
  factory :account_user, class: 'Account::User' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { "#{first_name.downcase}#{last_name.downcase}#{rand(1000)}@example.com" }
    date_of_birth { Faker::Date.birthday }
    password { "$3cr3t" }
  end

  trait :with_photo do
    after(:build) {
      account_user.photo.attach(
        io: File.open(Rails.root.join('spec', 'fixture_files', 'user.png')),
        filename: 'user.png',
        content_type: 'image/png'
      )
    }
  end
end
