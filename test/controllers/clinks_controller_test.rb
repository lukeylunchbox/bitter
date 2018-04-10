require 'test_helper'

class ClinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clink = clinks(:one)
  end

  test "should get index" do
    get clinks_url
    assert_response :success
  end

  test "should get new" do
    get new_clink_url
    assert_response :success
  end

  test "should create clink" do
    assert_difference('Clink.count') do
      post clinks_url, params: { clink: { clink: @clink.clink } }
    end

    assert_redirected_to clink_url(Clink.last)
  end

  test "should show clink" do
    get clink_url(@clink)
    assert_response :success
  end

  test "should get edit" do
    get edit_clink_url(@clink)
    assert_response :success
  end

  test "should update clink" do
    patch clink_url(@clink), params: { clink: { clink: @clink.clink } }
    assert_redirected_to clink_url(@clink)
  end

  test "should destroy clink" do
    assert_difference('Clink.count', -1) do
      delete clink_url(@clink)
    end

    assert_redirected_to clinks_url
  end
end
