feature 'filter by tag' do
  scenario "check links with tag bubbles are displayed" do
    visit '/links/new'
    fill_in "title", with: "yellow"
    fill_in "url", with: "www.blue.com"
    fill_in "tag_name", with: "bubbles"
    click_button "Save bookmark"
    fill_in "title", with: "black"
    fill_in "url", with: "www.pink.com"
    fill_in "tag_name", with: "squares"
    click_button "Save bookmark"
    visit '/tags/bubbles'
    expect(page).to have_content("www.blue.com")
    expect(page).not_to have_content("www.pink.com")
  end
end
