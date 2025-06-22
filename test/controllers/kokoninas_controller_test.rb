require "test_helper"

class KokoninasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kokonina = kokoninas(:one)
  end

  test "should get index" do
    get kokoninas_url
    assert_response :success
  end

  test "should get new" do
    get new_kokonina_url
    assert_response :success
  end

  test "should create kokonina" do
    assert_difference("Kokonina.count") do
      post kokoninas_url, params: { kokonina: { author_id: @kokonina.author_id, description: @kokonina.description, title: @kokonina.title } }
    end

    assert_redirected_to kokonina_url(Kokonina.last)
  end

  test "should show kokonina" do
    get kokonina_url(@kokonina)
    assert_response :success
  end

  test "should get edit" do
    get edit_kokonina_url(@kokonina)
    assert_response :success
  end

  test "should update kokonina" do
    patch kokonina_url(@kokonina), params: { kokonina: { author_id: @kokonina.author_id, description: @kokonina.description, title: @kokonina.title } }
    assert_redirected_to kokonina_url(@kokonina)
  end

  test "should destroy kokonina" do
    assert_difference("Kokonina.count", -1) do
      delete kokonina_url(@kokonina)
    end

    assert_redirected_to kokoninas_url
  end
end
