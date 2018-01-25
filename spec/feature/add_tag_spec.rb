feature 'add tag to link' do
  scenario 'add one tag to new url' do
    visit '/links/form'
    fill_in "title", with: "bing"
    fill_in "url", with: "www.bing.com"
    fill_in "tag_name1", with: "education"
    click_button "Save bookmark"
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end
end

feature 'add multiple tags to a link' do
  scenario 'add two tags to new url' do
    visit '/links/form'
    fill_in "title", with: "bing"
    fill_in "url", with: "www.bing.com"
    fill_in "tag_name1", with: "education"
    fill_in "tag_name2", with: "cats"
    click_button "Save bookmark"
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
    expect(link.tags.map(&:name)).to include('cats')
  end
end
