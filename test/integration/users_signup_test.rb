require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: {  name: "",
                                          email: "user@invalid",
                                          password: "foo",
                                          passwor_confirmation: "bar" } } 
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert.alert-danger'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Test User",
                                        email: "test@test.com",
                                        password: "passwordTest",
                                        passwor_confirmation: "passwordTest" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash[:success].blank?
  end
end
