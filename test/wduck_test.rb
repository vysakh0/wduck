require_relative 'test_helper'

describe Wduck::Duck do

  subject { Wduck::Duck.new("linux") }
  describe "function result that gets called for duck" do
    it "should respond to the function call" do
      subject.must_respond_to(:result)
    end

    it "function should be array of json objects" do
      subject.result.must_be_instance_of(Array)
    end
  end

  describe "check the results of for each condition" do
  end


end
