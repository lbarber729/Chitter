require_relative '../lib/peep'
describe 'peep' do

  describe '.post' do
    it 'can post a peep' do
      Peep.post(peep: 'This is my first peep', posted_at: Time.now)
      peep = Peep.all
      expect(peep.first.peep).to eq('This is my first peep')
    end
  end

  describe '.all' do
    it 'shows all peeps in reverse chronological order' do

      first_peep = Peep.post(peep: 'This is my first peep', posted_at: Time.new - 60)
      second_peep = Peep.post(peep:'This is my second peep', posted_at: Time.now)
      peep = Peep.all
      expect(peep.first.peep).to eq('This is my second peep')
    end

  end

end
