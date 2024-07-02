require 'rails_helper'

RSpec.describe "account/users/show", type: :view do
  before(:each) do
    assign(:account_user, Account::User.create!(
      first_name: "First Name",
      last_name: "Last Name",
      email: "Email",
      photo: nil,
      password: "secret"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
