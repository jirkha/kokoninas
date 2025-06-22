require "application_system_test_case"

class KokoninasTest < ApplicationSystemTestCase
  setup do
    @kokonina = kokoninas(:one)
  end

  test "visiting the index" do
    visit kokoninas_url
    assert_selector "h1", text: "Kokoninas"
  end

  test "should create kokonina" do
    visit kokoninas_url
    click_on "New kokonina"

    fill_in "Author", with: @kokonina.author_id
    fill_in "Description", with: @kokonina.description
    fill_in "Title", with: @kokonina.title
    click_on "Create Kokonina"

    assert_text "Kokonina was successfully created"
    click_on "Back"
  end

  test "should update Kokonina" do
    visit kokonina_url(@kokonina)
    click_on "Edit this kokonina", match: :first

    fill_in "Author", with: @kokonina.author_id
    fill_in "Description", with: @kokonina.description
    fill_in "Title", with: @kokonina.title
    click_on "Update Kokonina"

    assert_text "Kokonina was successfully updated"
    click_on "Back"
  end

  test "should destroy Kokonina" do
    visit kokonina_url(@kokonina)
    click_on "Destroy this kokonina", match: :first

    assert_text "Kokonina was successfully destroyed"
  end
end
