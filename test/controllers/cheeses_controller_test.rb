require 'test_helper'

class CheesesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cheese = cheeses(:one)
  end

  test "should get index" do
    get cheeses_url
    assert_response :success
  end

  test "should get new" do
    get new_cheese_url
    assert_response :success
  end

  test "should create cheese" do
    assert_difference('Cheese.count') do
      post cheeses_url, params: { cheese: { name: @cheese.name } }
    end

    assert_redirected_to cheese_url(Cheese.last)
  end

  test "should show cheese" do
    get cheese_url(@cheese)
    assert_response :success
  end

  test "should get edit" do
    get edit_cheese_url(@cheese)
    assert_response :success
  end

  test "should update cheese" do
    patch cheese_url(@cheese), params: { cheese: { name: @cheese.name } }
    assert_redirected_to cheese_url(@cheese)
  end

  test "should destroy cheese" do
    assert_difference('Cheese.count', -1) do
      delete cheese_url(@cheese)
    end

    assert_redirected_to cheeses_url
  end
end
