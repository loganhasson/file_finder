require 'file_finder/finder'

module FileFinder
  class Configuration

    def global_method=(value)
      if value == false
        unset_kernel_method
      end
    end

    def unset_kernel_method
      require 'lib/unset_kernel'
    end

  end
end
