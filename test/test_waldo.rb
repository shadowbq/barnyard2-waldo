require 'minitest/spec'

describe Where do
  before do
    @where = finder = Barnyard2::Waldo::Where.new('test/data/barnyard.waldo')
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
      @where.to_s.must_equal ''
    end
  end
end
