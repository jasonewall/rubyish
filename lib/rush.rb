require 'rush/shell'
require 'rush/interpreter'

module Rush
  extend self

  def start
    interpreter = Interpreter.new
    interpreter.read_input
  end

  def get_prompt
    user = ENV['USER']
    pwd = Dir.pwd
    "#{user}@#{hostname}:#{pwd}> "
  end

  def hostname
    if Socket.gethostname =~ /^(.+?)\..*$/
      $1
    else
      Socket.gethostname
    end
  end
end