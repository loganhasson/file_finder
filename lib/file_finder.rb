require 'file_finder/version'
require 'file_finder/configuration'
require 'file_finder/finder'

module FileFinder
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= FileFinder::Configuration.new
  end

  def self.configure
    yield configuration
  end
end

module Kernel
  if self.respond_to?(:path_to)
    alias original_path_to path_to
  end

  private
  module_function def path_to(path)
    FileFinder::Finder.get_absolute_path_to(path)
  end
end

