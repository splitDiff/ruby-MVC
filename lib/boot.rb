db_config_file = File.join(File.dirname(__FILE__), '..', 'app', 'database.yml')
if File.exist?(db_config_file)
  config = YAML.load(File.read(db_config_file))
  DB = Sequel.connect(config)
  Sequel.extension :migration
end


# Connecting all our framework's classes'
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each{|file| require file}

# Connecting all our framework's files'
Dir[File.join(File.dirname(__FILE__), '..', 'app', '**', '*.rb')].each{|file| require file}

# if there is a database connection, run all migrations
if DB
  Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), '..', 'app', 'db', 'migrations'))
end

ROUTES = YAML.load(File.read(File.join(File.dirname(__FILE__), '..', 'app', 'routes.yml')))