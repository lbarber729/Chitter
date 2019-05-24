require 'pg'

class Peep
attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_manager_test')
    else
      con = PG.connect(dbname: 'chitter_manager')
    end

    all = con.exec("SELECT * FROM chitter")
    all.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'])
    end
  end

  def self.post(peep)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_manager_test')
    else
      con = PG.connect(dbname: 'chitter_manager')
    end

    con.exec("INSERT INTO chitter (peep) Values ('#{peep}') RETURNING id, peep;")
  end

end
