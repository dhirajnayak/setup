require 'expansions'
require './user'

class Setup < Thor

  default_task :all

  desc 'expand', 'expands all templates'
  def expand
    Expansions::CLIInterface.run('ExpansionFile')
  end

  desc 'all', 'runs all setup items'
  def all()
    unless File.exist?(User.settings_file)
      `cp settings_template #{User.settings_file}`
      puts "A settings file has been generated for you at : #{User.settings_file}, please review it, make necessary changes and then rerun this task"
      exit
    end
    expand
  end

  no_commands do
    def get_option(prompt)
      result = ask(prompt)
      raise Thor::Error, "You must enter a value for that field." if value.empty?
      value
    end
  end
end
