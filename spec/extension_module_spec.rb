require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'yogo/support/extension_module'

module ExampleModule
  extend Yogo::ExtensionModule
end

module ClassModule
  def class_method_one
  end
  
  def class_method_two
  end
end

module InstanceModule
  def inst_method_one
  end
  
  def inst_method_two
  end
end

describe "ExtensionModule" do
  it "should have instance_extensions" do
    ExampleModule.should respond_to(:instance_extensions)
  end
  
  it "should have class_extensions" do
    ExampleModule.should respond_to(:class_extensions)
  end
  
  describe "instance_extensions" do
    it "should return a block" do
      ExampleModule.instance_extensions.should be_a_kind_of(Proc)
    end
  end
  
  describe "class_extensions" do
    it "should return a block" do
      ExampleModule.class_extensions.should be_a_kind_of(Proc)
    end
  end
  
  describe "adding extensions" do
    it "should accept a class_extensions block" do
      ExampleModule.class_extensions do
        extend ClassModule
      end
    end
    
    it "should accept a instance_extensions block" do
      ExampleModule.instance_extensions do
        extend InstanceModule
      end
    end
  end
  
  describe "a Class extended with an ExtensionModule" do
    before(:all) do
      @c1 = Class.new { extend ExampleModule }
    end
    
    it "should have ClassModule methods as class methods" do
      @c1.should respond_to(:class_method_one)
      @c1.should respond_to(:class_method_two)
      @c1.should_not respond_to(:inst_method_one)
      @c1.should_not respond_to(:inst_method_two)
    end
  end
  
  describe "a non-Class/Module object extended with an ExtensionModule" do
    before(:all) do
      @o1 = Object.new
      @o1.extend(ExampleModule)
    end
    
    it "should give InstanceModule methods on its instances" do
      @o1.should respond_to(:inst_method_one)
      @o1.should respond_to(:inst_method_two)
      @o1.should_not respond_to(:class_method_one)
      @o1.should_not respond_to(:class_method_two)
    end
  end
end