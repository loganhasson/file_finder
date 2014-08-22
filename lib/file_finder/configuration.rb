require 'file_finder/finder'

module FileFinder
  class Configuration

    def global_method=(value)
      if value == false || value == 'false'
        unset_kernel_method
      elsif value == true || value == 'true'
        reset_kernel_method
      else
        raise FileFinder::InvalidConfigOptionError, "global_method= accepts either `true` or `false`"
      end
    end

    def unset_kernel_method
      load "#{FileFinder::File('../unset_kernel.rb')}"
    end

    def reset_kernel_method
      load "#{FileFinder::File('../reset_kernel.rb')}"
    end

  end

  InvalidConfigOptionError = Class.new(StandardError)

end

