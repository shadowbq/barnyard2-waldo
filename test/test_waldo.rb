require 'test_helper'
require 'minitest/spec'

describe Barnyard2::Waldo::Where do
  before do
    @where = Barnyard2::Waldo::Where.new('test/data/barnyard.waldo')
  end

  describe "when looking for waldo" do
    it "should seek correctly" do
      @where.spool_dir.must_equal '/var/log/snort'
    end
    it "should respond positively" do
      @where.spool_filebase.must_equal 'merged.log'
    end
    it "should return epoch" do
      @where.epoch.must_equal 1426175522
    end
    it "should return the idx" do
      @where.record.must_equal 119879
    end

  end

  describe "when asking to print" do
    it "it should print the string" do
      @where.utc = true
      @where.to_s.must_equal "Barnyard spool: /var/log/snort/merged.log.1426175522\nRecord Idx: 119879\n2015-03-12 15:52:02 UTC"
    end
  end
end

require 'fileutils'

describe Barnyard2::Waldo::Where do

    describe "when looking at a incorrect file perm" do
        before do
            FileUtils.cp_r('test/data/barnyard.waldo', 'test/data/ZZZZZ.waldo')
            FileUtils.chmod 0000, 'test/data/ZZZZZ.waldo'
        end

        it "should raise file permission errors" do
            assert_raises Barnyard2::Waldo::WaldoFilePermissionsError do
                Barnyard2::Waldo::Where.new('test/data/ZZZZZ.waldo')
            end
        end

        after do
            FileUtils.chmod 0664, 'test/data/ZZZZZ.waldo'
            FileUtils.rm 'test/data/ZZZZZ.waldo'
        end    
    end

    describe "when looking for a bad waldo" do

        it "should raise File existance errors" do
            assert_raises Barnyard2::Waldo::WaldoFileError do
                Barnyard2::Waldo::Where.new('test/data/XXXXX.waldo')
            end
        end

    end
end
