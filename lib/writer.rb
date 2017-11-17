require './lib/abstract_file'

class FileWriter < AbstractFile
  def open_file (path)
    File.new(path, 'w+')
  end
  
  def write data
    @file.puts data
  end
end
