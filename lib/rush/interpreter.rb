module Rush
  class Interpreter
    def initialize shell
      @shell = shell
    end

    def interpret command
      begin
        results = @shell.eval_command command
        puts results if results
      rescue Exception => e
        exit if e.class == SystemExit
        $oops = e 
        puts e.message
      end
    end
  end
end