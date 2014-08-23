require 'pathname'

module FileFinder

  def self.File(path)
    FileFinder::Finder.get_absolute_path_to(path, Kernel.caller.first.match(/(.*):.*:.*/)[1])
  end

  class Finder
    attr_reader :path, :configuration, :calling_file

    def self.get_absolute_path_to(path, calling_file = __FILE__)
      new(path, calling_file).absolute_path
    end

    def initialize(path, calling_file)
      @path = path
      @calling_file = calling_file
    end

    def absolute_path
      Pathname.new(File.join(File.dirname(File.expand_path(calling_file)), path)).expand_path.to_s
    end

  end

end

