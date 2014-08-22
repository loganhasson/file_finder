require "#{FileFinder::File('file_finder/finder.rb')}"

module Kernel
  if self.respond_to?(:path_to)
    alias original_path_to path_to
  end

  private
  module_function def path_to(path)
    FileFinder::Finder.get_absolute_path_to(path)
  end
end
