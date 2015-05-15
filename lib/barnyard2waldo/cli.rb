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
        options[:bookmark] = Barnyard2::Waldo::Defaults::Bookmark

        opt_parser = OptionParser.new do |opt|
          opt.banner = "Usage: waldo [OPTIONS]"

          opt.on("-b","Bookmark file","  Default: #{options[:bookmark]}") do |value|
            options[:bookmark] = value
          end

          opt.separator "Options::"

          opt.on_tail("-h","--help","Display this screen") do
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

        finder = Barnyard2::Waldo::Where.new(options[:bookmark])
        puts finder

      end

    end #Class

  end #module
end #module
