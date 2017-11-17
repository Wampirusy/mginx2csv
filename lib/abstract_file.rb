class AbstractFile
  def initialize (path)
    @file = open_file(path)
  end
  
  def open_file (path)
    rise 'abstract method to File.new'
  end
end
