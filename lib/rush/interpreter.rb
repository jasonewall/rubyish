require 'irb/ruby-lex'
require 'rush/input_method'

module Rush
  class Interpreter
    def initialize shell = Rush::Shell.new
      @shell = shell
      @input = InputMethod.new
    end

    def read_input command = nil
      lexer = RubyLex.new
      lexer.set_prompt do |ltype, indent, continue, line_no|
        @input.prompt = Rush::get_prompt
      end
      lexer.set_input @input

      lexer.each_top_level_statement do |line, line_no|
        begin
          interpret line
        rescue Interrupt => e
        rescue SystemExit, SignalException
          raise
        rescue Exception => e
        end

        if e
          print e.class, ': ', e, "\n"
          puts e.backtrace
        end
      end
    end

    def interpret command
      p eval command
    end

    def method_missing name, *args
      super
    end
  end
end