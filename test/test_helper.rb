require 'rubygems'
require 'bundler/setup'

require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
  add_group "Bin", "/lib/cli"
  add_group "Lib", "/lib"
end


require 'minitest/autorun'
require 'minitest/colorize'
require 'minitest/spec'

require 'turn/autorun'

require File.join(File.dirname(__FILE__), '..', 'lib', 'barnyard2waldo', 'cli')
require File.join(File.dirname(__FILE__), '..', 'lib', 'barnyard2waldo')

=begin
Turn Configurations
  tests           List of file names or glob patterns of tests to run. Default: ["test/**/{test,}*{,test}.rb"]
  exclude         List of file names or globs to exclude from tests list. Default: []
  pattern         Regexp pattern that all test names must match to be eligible to run. Default: /.*/ (all)
  matchcase       Regexp pattern that all test cases must match to be eligible to run. Default: nil (all)
  loadpath        Add these folders to the $LOAD_PATH. Default: ['lib']
  requires        Libs to require when running tests. Default: []
  format          Reporter type (:pretty, :dot, :cue, :marshal, :outline, :progress). Default: :pretty
  live            Test against live install (i.e. Don't use loadpath option). Default: false
  verbose         Verbose output? Default: false
  trace           Number of backtrace lines to display. Default: set from ENV or nil (all)
  natural         Use natural language case names.  Default: false
  ansi            Force colorized output (requires 'ansi' gem). Default: set from ENV or nil (auto)
=end

Turn.config do |c|
 # use one of output formats:
 # :outline  - turn's original case/test outline mode [default]
 # :progress - indicates progress with progress bar
 # :dotted   - test/unit's traditional dot-progress mode
 # :pretty   - new pretty reporter
 # :marshal  - dump output as YAML (normal run mode only)
 # :cue      - interactive testing
 c.format  = :outline
 # turn on invoke/execute tracing, enable full backtrace
 c.trace   = true
 # use humanized test names (works only with :outline format)
 c.natural = true
end
