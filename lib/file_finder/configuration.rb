require 'file_finder/file'

module FileFinder
  class Configuration

    def initialize
      set_kernel_method
    end

    def set_kernel_method
      class << Kernel
        if self.respond_to?(:path_to)
          alias original_path_to path_to
        end

        private
        module_function def path_to(path)
          FileFinder::File.get_absolute_path_to(path)
        end
      end
    end

    def global_method=(value)
      if value == false
        unset_kernel_method
      end
    end

    def unset_kernel_method
      class << Kernel
        if self.respond_to?(:path_to)
          remove_method :path_to

          if self.respond_to?(:original_path_to)
            alias path_to original_path_to
          end
        end
      end
    end

  end
end
