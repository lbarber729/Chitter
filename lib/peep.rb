require 'pg'

class Peep
attr_reader :id, :peep

  def initialize(id:, peep:, posted_at:)
    @id = id
    @peep = peep
    @posted_at = posted_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_manager_test')
    else
      con = PG.connect(dbname: 'chitter_manager')
    end

    all = con.exec("SELECT * FROM chitter ORDER BY posted_at DESC")
    all.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], posted_at: peep['posted_at'])
    end
  end

  def self.post(peep)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_manager_test')
    else
      con = PG.connect(dbname: 'chitter_manager')
    end

    result = con.exec("INSERT INTO chitter (peep) Values ('#{peep}')RETURNING id, peep, posted_at;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], posted_at:  result[0]['posted_at'])
  end
end
