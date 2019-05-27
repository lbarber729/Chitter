require_relative './web_helpers'
feature 'Homepage' do
  scenario 'It welcomes the user' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter!')
  end

  scenario 'displays all peeps' do
    add_peep_1
    add_peep_2
    expect(page).to have_content('This is my first peep')
    expect(page).to have_content('This is my second peep')
  end

  scenario 'displays the time a peep was posted' do
    peep = Peep.post(peep: 'This is  my first peep', posted_at: Time.now)
    visit('/')
    expect(page).to have_content("#{peep.posted_at}")
  end

end
