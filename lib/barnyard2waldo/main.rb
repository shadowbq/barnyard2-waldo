module Barnyard2
  module Waldo

    class CustomError < StandardError; end

    module Defaults
        Bookmark = '/var/spool/barnyard.waldo'
    end

  end
end
