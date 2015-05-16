module Barnyard2
  module Waldo

    class Where

      attr_reader :spool_dir, :spool_filebase, :epoch, :record
      attr_accessor :utc

      def initialize (bookmark=Barnyard2::Waldo::Defaults::Bookmark)
        raise WaldoFileError unless File.file?(bookmark)
        raise WaldoFilePermissionsError unless File.stat(bookmark).readable?
        begin
            # (r) Read-only, starts at beginning of file  (default mode).
            # (b) Binary file mode
            fp = open(bookmark, 'rb')
            s = fp.read(Barnyard2::Waldo::MAX_FILEPATH_BUF)
            @spool_dir = s.strip

            s = fp.read(Barnyard2::Waldo::MAX_FILEPATH_BUF)
            @spool_filebase = s.strip

            s = fp.read(Barnyard2::Waldo::UINT32_t)
            @epoch = s.unpack('V').first

            s = fp.read(Barnyard2::Waldo::UINT32_t)
            @record = s.unpack('V').first
        ensure
            fp.close
        end

      end

      # Unpack the bytes and the array:
      def to_s
        if @utc == true
            "Barnyard spool: #{@spool_dir}/#{@spool_filebase}.#{@epoch}\nRecord Idx: #{@record}\n#{Time.at(@epoch).utc}"
        else
            "Barnyard spool: #{@spool_dir}/#{@spool_filebase}.#{@epoch}\nRecord Idx: #{@record}\n#{Time.at(@epoch)}"
        end
      end

    end

  end
end
