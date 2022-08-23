require 'test_helper'

class CreateExpenseTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "john",
                              email: "john@mail.com",
                              password: "password")
    sign_in_as(@user)
  end

  test "get new expense form and create expense " do
    get "/expenses/new"
    assert_response :success
    assert_difference 'Expense.count', 1 do
      post expenses_url, params: { expense: { category:"Food", cost: 200 } }
      assert_response :redirect
    end

    follow_redirect! 
    assert_response :success
    assert_match "Food", response.body
  end

  test "get new expense form and reject invalid expense submission " do
    get "/expenses/new"
    assert_response :success
    assert_no_difference 'Expense.count' do
      post expenses_url, params: { expense: { category:" ", cost:0 } }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h5.alert-heading'
  end
end
