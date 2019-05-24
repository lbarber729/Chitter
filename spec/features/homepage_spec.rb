feature 'Homepage' do
  scenario 'It welcomes the user' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'
    expect(page).to have_field('peep')
    expect(page).to have_button('Add peep')
  end
end
