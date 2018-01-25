feature 'Add bookmark' do
  scenario 'add one bookmark' do
    visit "/links/form"
    fill_in "title", with: "yahoo"
    fill_in "url", with: "www.yahoo.com"
    click_button "Save bookmark"
    click_button "Visit bookmarks"
    expect(page).to have_content('www.yahoo.com')
  end
end
