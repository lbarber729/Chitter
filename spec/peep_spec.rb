require_relative '../lib/peep'
describe 'peep' do

  describe '.post' do
    it 'can post a peep' do
      Peep.post('This is my first peep')
      peep = Peep.all
      expect(peep.first.peep).to eq('This is my first peep')
    end
  end

  describe '.all' do
    it 'shows all peeps in reverse chronological order' do
      peep = Peep.post('This is my first peep')
      peep_newest = Peep.post('This is my second peep')
      peep = Peep.all
      expect(peep.first.peep).to eq('This is my second peep')
    end
  end

end
