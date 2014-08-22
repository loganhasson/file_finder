module Kernel
  if self.respond_to?(:apath_to)
    remove_method :apath_to

    class << self
      remove_method :apath_to
    end

    if self.respond_to?(:original_apath_to)
      alias apath_to original_apath_to

      class << self
        alias apath_to original_apath_to
      end
    end
  end
end

