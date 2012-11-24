require 'irb/locale'

# This class quacks like an irb/input-method

module Rubyish
  class InputMethod
    def initialize
      @line_no = 0
      @line = []

      @stdin = IO.open(STDIN.to_i, :external_encoding => 'UTF-8', :internal_encoding => '-')
      @stdout = IO.open(STDOUT.to_i, 'w', :external_encoding => 'UTF-8', :internal_encoding => '-')
    end

    attr_accessor :prompt

    def file_name
      '(line)'
    end

    def gets
      print @prompt
      line = @stdin.gets
      @line[@line_no += 1] = line
    end

    def eof?
      @stdin.eof?
    end

    def readable_after_eof?
      true
    end

    def line(line_no)
      @line[line_no]
    end

    def encoding
      @stdin.external_encoding
    end
  end
end