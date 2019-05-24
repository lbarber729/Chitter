
feature 'Homepage' do
  scenario 'It welcomes the user' do
    visit('/')
    fill_in('peep', with: 'This is my fist peep')
    click_button('Add peep')
    expect(page).to have_content('This is my fist peep')
  end
end
