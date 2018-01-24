feature 'add tag to link' do
  scenario 'add one tag to new url' do
    visit '/links/new'
    visit "/links/new"
    fill_in "title", with: "bing"
    fill_in "url", with: "www.bing.com"
    fill_in "tag_name", with: "new tag"
    click_button "Save bookmark"
    click_button "Visit bookmarks"
    expect(page).to have_content "new tag"
  end
end
