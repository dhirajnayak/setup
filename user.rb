module User
  extend self

  def settings_file
    "#{name}.settings"
  end

  def name
    name = `whoami`.chomp
    name = name.gsub(/\s/, '')
    name = name.gsub(/\//, '')
    name = name.gsub(/\\/, '')
    name
    name.downcase
  end
end
