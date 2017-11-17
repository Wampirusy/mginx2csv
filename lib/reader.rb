require './lib/abstract_file'

class FileReader < AbstractFile
  def open_file (path)
    File.new(path, 'r')
  end
  
  def read
    @file.gets
  end
end
