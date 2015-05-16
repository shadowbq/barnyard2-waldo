require 'optparse'
require 'barnyard2waldo'


module Barnyard2
  module Waldo
    class CLI

      def self.invoke
        self.new
      end

      def initialize
        options = {}
        options[:utc] = Barnyard2::Waldo::Defaults::UTC
        options[:bookmark] = Barnyard2::Waldo::Defaults::Bookmark

        opt_parser = OptionParser.new do |opt|
          opt.banner = "Usage: waldo [OPTIONS]"

          opt.on("-b", "--bookmark [waldofile]", "Bookmark file", "  Default: #{options[:bookmark]}") do |value|
            options[:bookmark] = value
          end

          opt.on("-z", "--zulu", "Print Zulu time (utc)", "  Default: #{options[:utc]}") do |value|
            options[:utc] = value
          end

          opt.separator "Options::"

          opt.on_tail("-h", "--help", "Display this screen") do
            puts opt_parser
            exit 0
          end

        end

        #Verify the options
        begin
        #  raise unless ARGV.size > 0
          opt_parser.parse!

        #If options fail display help
        #rescue Exception => e
        #  puts e.message
        #  puts e.backtrace.inspect
        rescue
          puts opt_parser
          exit
        end

        begin
            finder = Barnyard2::Waldo::Where.new(options[:bookmark])
            finder.utc = options[:utc]
            puts finder
        rescue Barnyard2::Waldo::WaldoFilePermissionsError
            abort "Waldo File Read Perrmission Error, check permissions on the bookmark file."
        rescue Barnyard2::Waldo::WaldoFileError
            abort "Waldo File Error, file may not exist."
        end
      end

    end #Class

  end #module
end #module
