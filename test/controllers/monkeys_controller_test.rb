require 'test_helper'

class MonkeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monkey = monkeys(:one)
  end

  test "should get index" do
    get monkeys_url
    assert_response :success
  end

  test "should get new" do
    get new_monkey_url
    assert_response :success
  end

  test "should create monkey" do
    assert_difference('Monkey.count') do
      post monkeys_url, params: { monkey: { name: @monkey.name } }
    end

    assert_redirected_to monkey_url(Monkey.last)
  end

  test "should show monkey" do
    get monkey_url(@monkey)
    assert_response :success
  end

  test "should get edit" do
    get edit_monkey_url(@monkey)
    assert_response :success
  end

  test "should update monkey" do
    patch monkey_url(@monkey), params: { monkey: { name: @monkey.name } }
    assert_redirected_to monkey_url(@monkey)
  end

  test "should destroy monkey" do
    assert_difference('Monkey.count', -1) do
      delete monkey_url(@monkey)
    end

    assert_redirected_to monkeys_url
  end
end
