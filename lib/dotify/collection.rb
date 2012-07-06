Dotify::Config.load_config!

module Dotify
  class Collection
    class << self

      # All
      #
      # Pulls an array of Units from the home
      # directory.
      def all
        @all ||= List.home
      end

      # Linked files are those files which have a
      # symbolic link pointing to the Dotify file.
      def linked
        links = self.all.select { |f| f.linked? }
        return links unless block_given?
        links.each {|u| yield u }
      end

      # Unlinked files are, of course, the opposite
      # of linked files. These are Dotify files which
      # Have no home dir files that are linked to them.
      def unlinked
        unl = self.all.select { |f| !f.linked? }
        return unl unless block_given?
        unl.each {|u| yield u }
      end

    end
  end
end