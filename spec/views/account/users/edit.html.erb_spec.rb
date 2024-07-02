require 'rails_helper'

RSpec.describe "account/users/edit", type: :view do
  let(:account_user) {
    Account::User.create!(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      photo: nil,
      password: "secret"
    )
  }

  before(:each) do
    assign(:account_user, account_user)
  end

  it "renders the edit account_user form" do
    render

    assert_select "form[action=?][method=?]", account_user_path(account_user), "post" do

      assert_select "input[name=?]", "account_user[first_name]"

      assert_select "input[name=?]", "account_user[last_name]"

      assert_select "input[name=?]", "account_user[email]"

      assert_select "input[name=?]", "account_user[photo]"

      assert_select "input[name=?]", "account_user[password]"
    end
  end
end
