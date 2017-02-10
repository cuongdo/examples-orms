require 'test_helper'

class ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "post" do
    post customers_url, params: { name: "hodor" }, as: :json
    assert_response :redirect
    follow_redirect!
    assert_response :success

    c = Customer.find_by(name: "hodor")
    assert_not_nil(c)

    post products_url, params: { name: "derp", price: 3.4 }, as: :json
    assert_response :redirect
    follow_redirect!
    assert_response :success

    p = Product.find_by(name: "derp")
    assert_not_nil(p)

    post orders_url, params: { subtotal: 3.4, customer: { id: c.id }, products: {}}, as: :json
    assert_response :redirect
    follow_redirect!
    assert_response :success


  end
end
