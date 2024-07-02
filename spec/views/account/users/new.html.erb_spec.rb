require 'rails_helper'

RSpec.describe "account/users/new", type: :view do
  before(:each) do
    assign(:account_user, Account::User.new(
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      photo: nil,
      password: ""
    ))
  end

  it "renders new account_user form" do
    render

    assert_select "form[action=?][method=?]", account_users_path, "post" do

      assert_select "input[name=?]", "account_user[first_name]"

      assert_select "input[name=?]", "account_user[last_name]"

      assert_select "input[name=?]", "account_user[email]"

      assert_select "input[name=?]", "account_user[photo]"

      assert_select "input[name=?]", "account_user[password]"
    end
  end
end
