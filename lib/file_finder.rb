require 'file_finder/version'
require 'file_finder/configuration'

module FileFinder
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= FileFinder::Cofiguration.new
  end

  def self.configure
    yield configuration
  end
end

FileFinder.configuration

