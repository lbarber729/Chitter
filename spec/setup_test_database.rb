require 'pg'

def setup_test_database
  p 'Setting up test database....⏳'

  connection = PG.connect(dbname: 'chitter_manager_test')

  connection.exec('TRUNCATE users, chitter;')
end
