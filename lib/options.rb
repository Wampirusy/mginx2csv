require 'optparse'

class Options

  attr_reader :errors, :input_file, :output_file, :csv_separator

  def initialize
    @errors = []
    @options = {}

    begin
      OptionParser.new do |opts|
        opts.on('-iFILE', "--input=FILE", "Input file") {|v| @input_file = v}
        opts.on('-oFILE', "--output=FILE", "Output file") {|v| @output_file = v}
        opts.on('-sSEPAR', "--separator=SEPAR", "CSV separator") {|v| @csv_separator = v}
      end.parse!
    rescue OptionParser::InvalidOption => error
      @errors.push error.message
    end

    validate
  end

  def validate
    if @input_file.nil?
      @errors.push 'no input file'
    elsif !File.exist? @input_file
      @errors.push 'input file doesn\'t exist'
    elsif @output_file.nil?
      @output_file = @input_file + '.csv'
    end
  end

  def valid?
    errors.empty?
  end
end