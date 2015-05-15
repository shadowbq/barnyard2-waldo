require 'rubygems'
require 'bundler/setup'

require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
  add_group "Bin", "/lib/cli"
  add_group "Lib", "/lib"
end

gem "minitest"
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start


require File.join(File.dirname(__FILE__), '..', 'lib', 'barnyard2waldo', 'cli')
require File.join(File.dirname(__FILE__), '..', 'lib', 'barnyard2waldo')
