module Kernel
  if self.respond_to?(:path_to)
    remove_method :path_to

    if self.respond_to?(:original_path_to)
      alias path_to original_path_to
    end
  end
end

