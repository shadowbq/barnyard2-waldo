module Barnyard2
  module Waldo

    class CustomError < StandardError; end

    module Defaults
        Bookmark = '/var/spool/barnyard.waldo'
        UTC = 'false'
    end

  end
end
