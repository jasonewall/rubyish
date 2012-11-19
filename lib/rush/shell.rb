require 'socket'

module Rush
  module Shell
    extend self

    def start
      loop {
        begin
          print get_prompt_string
          $pi = eval gets
          p $pi if $pi
        rescue Exception => e
          exit if e.class == SystemExit
          $pi = nil
          p e.message
          $oops = e
        end
      }
    end

    def get_prompt_string
      user = ENV['USER']
      hostname = Socket.gethostname
      pwd = Dir.pwd
      prompt = "#{user}@#{hostname}:#{pwd}> "
    end
  end
end