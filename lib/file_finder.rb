require 'file_finder/version'
require 'file_finder/configuration'
require 'file_finder/finder'
require 'reset_kernel'

module FileFinder
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= FileFinder::Configuration.new
  end

  def self.config
    yield configuration
  end
end

