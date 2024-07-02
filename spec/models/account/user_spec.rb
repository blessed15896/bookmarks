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
require 'rails_helper'

RSpec.describe Account::User, type: :model do
  describe 'validations' do
    subject { build(:account_user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_least(3) }

    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(3) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it { should have_one_attached(:photo) }

    it { should have_secure_password }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
