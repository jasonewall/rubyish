require 'rush/shell'
require 'rush/interpreter'

module Rush
  extend self
  def get_prompt
    user = ENV['USER']
    hostname = Socket.gethostname
    pwd = Dir.pwd
    "#{user}@#{hostname}:#{pwd}> "
  end
end