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
