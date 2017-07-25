feature 'Creating links' do

  scenario 'I can add a new link'do
    visit('/links/new')
    fill_in :title, with: 'This is Google'
    fill_in :url, with: 'http://www.google.com'
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('This is Google')
    end
  end
end
