if RUBY_VERSION >= '1.9' && !defined?(Rubinius)
  begin
    require 'coveralls'
    Coveralls.wear!
    require "codeclimate-test-reporter"
    CodeClimate::TestReporter.start
  rescue LoadError, StandardError
    #no op to support Ruby 1.8.7, ree and Rubinius which do not support Coveralls
  end
end

require 'easily_typable'

class TypeA
  include EasilyTypable
end

class TypeB < TypeA
end

class TypeC < TypeB
end

describe EasilyTypable do
  it "should add type_a? method to TypeA object" do
    expect(TypeA.new.type_a?).to be_truthy
  end
  it "should add type_b? method to TypeA object" do
    expect(TypeA.new.type_b?).to be_falsey
  end
  it "should add type_c? method to TypeA object" do
    expect(TypeA.new.type_c?).to be_falsey
  end
  it "should add type_a? method to TypeB object" do
    expect(TypeB.new.type_a?).to be_truthy
  end
  it "should add type_b? method to TypeB object" do
    expect(TypeB.new.type_b?).to be_truthy
  end
  it "should add type_c? method to TypeB object" do
    expect(TypeB.new.type_c?).to be_falsey
  end
  it "should add type_a? method to TypeC object" do
    expect(TypeC.new.type_a?).to be_truthy
  end
  it "should add type_b? method to TypeC object" do
    expect(TypeC.new.type_b?).to be_truthy
  end
  it "should add type_c? method to TypeC object" do
    expect(TypeC.new.type_c?).to be_truthy
  end
end
