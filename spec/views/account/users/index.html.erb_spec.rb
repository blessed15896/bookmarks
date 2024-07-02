require 'rails_helper'

RSpec.describe "account/users/index", type: :view do
  before(:each) do
    assign(:account_users, [
      Account::User.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email1",
        photo: nil,
        password: "secret"
      ),
      Account::User.create!(
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email2",
        photo: nil,
        password: "secret"
      )
    ])
  end

  it "renders a list of account/users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email1".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Email2".to_s), count: 1
  end
end
