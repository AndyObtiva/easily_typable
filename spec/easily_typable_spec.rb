require 'rubygems'
require 'spec'
require File.dirname(__FILE__) + '/../lib/easily_typable'

class TypeA
  include Obtiva::EasilyTypable
end

class TypeB < TypeA
end

class TypeC < TypeB
end

describe "Obtiva::EasilyTypable" do
  it "should add type_a? method to TypeA object" do
    TypeA.new.type_a?.should be_true
  end
  it "should add type_b? method to TypeB object" do
    TypeB.new.type_b?.should be_true
  end
  it "should add type_b? method to TypeA object" do
    TypeA.new.type_b?.should be_false
  end
  it "should add type_c? method to TypeC object" do
    TypeC.new.type_c?.should be_true
  end
  it "should add type_c? method to TypeA object" do
    TypeA.new.type_c?.should be_false
  end
  it "should add type_c? method to TypeB object" do
    TypeB.new.type_c?.should be_false
  end
end