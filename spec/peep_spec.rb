require_relative '../lib/peep'
describe 'peep' do

  describe '#post' do
    it 'can post a peep' do
      Peep.post('This is my first peep')
      peep = Peep.all
      expect(peep.first.peep).to eq('This is my first peep') 
    end
  end

end
