module Barnyard2
  module Waldo

    class CustomError < StandardError; end

    class WaldoFileError < StandardError; end
    class WaldoFilePermissionsError < StandardError; end

    module Defaults
        Bookmark = '/var/spool/barnyard.waldo'
        UTC = 'false'
    end

  end
end
