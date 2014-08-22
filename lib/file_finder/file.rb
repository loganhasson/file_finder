module FileFinder

  def self.File(path)
    FileFinder::Finder.get_absolute_path_to(path)
  end

  class Finder
    att_reader :path, :configuration

    def self.get_absolute_path_to(path)
      new(path).absolute_path
    end

    def initialize(path)
      @path = path
    end

    def absolute_path
      ::File.join(::File.dirname(::File.expand_path(__FILE__)), path)
    end
  end

end

