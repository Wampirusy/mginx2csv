require 'csv'

class FileWriter

  DEFAULT_SEP = ';'

  def initialize (path, options = {})
    if options[:col_sep].nil?
      options[:col_sep] = DEFAULT_SEP
    end

    @file = CSV.open(path, 'w', {:col_sep => options[:col_sep]})
  end
  
  def write data
    @file << data
  end
end
