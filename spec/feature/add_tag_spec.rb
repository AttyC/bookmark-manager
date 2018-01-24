feature 'add tag to link' do
  scenario 'add one tag to new url' do
    visit '/links/new'
    visit "/links/new"
    fill_in "title", with: "bing"
    fill_in "url", with: "www.bing.com"
    fill_in "tag_name", with: "education"
    click_button "Save bookmark"
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end
end
