#STDLIBS
require 'rubygems'

module Barnyard2
  module Waldo
    $:.unshift(File.dirname(__FILE__))

    MAX_FILEPATH_BUF = 1024
    UINT32_t = 4

    require "barnyard2waldo/main"
    require "barnyard2waldo/version"
    require "barnyard2waldo/where"

  end
end
