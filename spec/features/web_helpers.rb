def add_peep_1
  visit('/')
  fill_in('peep', with: 'This is my first peep')
  click_button('Add peep')
end

def add_peep_2
  visit('/')
  fill_in('peep', with: 'This is my second peep')
  click_button('Add peep')
end

def sign_up
  visit('/')
  click_button 'Sign up'
  fill_in('name', with: 'Lucy Barber')
  fill_in('username', with: 'lbarber729')
  fill_in('email', with: 'lucy@email.com')
  fill_in('password', with: 'Password123')
  click_button('Sign up')
end
