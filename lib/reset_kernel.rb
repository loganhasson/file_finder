require 'file_finder/finder.rb'

module Kernel
  if self.respond_to?(:apath_to)
    alias original_apath_to apath_to

    class << self
      alias original_apath_to apath_to
    end
  end

  private
  module_function def apath_to(path)
    FileFinder::Finder.get_absolute_path_to(path)
  end
end
