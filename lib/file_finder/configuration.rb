require 'file_finder/finder'

module FileFinder
  class Configuration

    def global_method=(value)
      if value == false
        unset_kernel_method
      elsif value == true
        reset_kernel_method
      else
        raise FileFinder::InvalidConfigOptionError
      end
    end

    def unset_kernel_method
      require "#{FileFinder::File('../unset_kernel')}"
    end

    def reset_kernel_method
      require "#{FileFinder::File('../reset_kernel')}"
    end

  end

  InvalidConfigOptionError = Class.new

end
