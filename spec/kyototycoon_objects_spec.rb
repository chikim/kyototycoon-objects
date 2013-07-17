require 'kyototycoon/objects'
require 'kyototycoon'

describe KyotoTycoon::Objects do
  class KTTest
    include KyotoTycoon::Objects
    kyototycoon_counter :views, start: 3
    def initialize attributes = {}
      @id ||= attributes[:id] || 0
    end
    def id; @id; end
  end
  before (:all) {KyotoTycoon.configure(:test, "0.0.0.0", 1978) { }}
  describe "#kyototycoon_counter" do
    after {KyotoTycoon.new.clear}
    context "class method kyototycoon_counter" do
      it {KTTest.should respond_to(:kyototycoon_counter)}
    end
    context "instance counter getter" do
      it {KTTest.new.views.should == 3}
    end
    context "instance counter setter" do
      before do
        @kt_test = KTTest.new
        @kt_test.views += 1
      end
      it {@kt_test.views.should == 4}
    end
  end
end
