class FileReader

  def initialize path
    @file = File.new(path, 'r')
  end
  
  def read
    @file.gets
  end
end
