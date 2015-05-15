module Barnyard2
  module Waldo

    class Where

      attr_reader :spool_dir, :spool_filebase, :epoch, :record

      def initialize (bookmark=Barnyard2::Waldo::Defaults::Bookmark)
        fp = open(bookmark, 'rb')
        s = fp.read(MAX_FILEPATH_BUF)
        @spool_dir = s.strip

        s = fp.read(MAX_FILEPATH_BUF)
        @spool_filebase = s.strip

        s = fp.read(UINT32_t)
        @epoch = s.unpack('V').first

        s = fp.read(UINT32_t)
        @record = s.unpack('V').first
      ensure
        fp.close
      end

      # Unpack the bytes and the array:
      def to_s
        "Barnyard spool: #{@spool_dir}/#{@spool_filebase}.#{@epoch}\nRecord Idx: #{@record}\n#{Time.at(@epoch)}"
      end

    end

  end
end
