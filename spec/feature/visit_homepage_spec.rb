feature 'Homepage' do
  scenario 'Contains bookmarks' do
    Link.create(title: "google", url: "www.google.com")
    visit('/links')
    expect(page).to have_content('www.google.com')
  end
end
