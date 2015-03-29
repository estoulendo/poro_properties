require 'poro_properties/version'
require 'poro_properties/defaults'

module PoroProperties
  def self.included(base)
    base.extend ClassMethods
  end

  def to_h
    self.class.properties_names
      .inject({}) { |memo, key| memo.merge(key => public_send(key)) }
  end

  module ClassMethods
    attr_accessor :properties_names

    def properties(*names)
      attr_accessor(*names)
      @properties_names ||= []
      @properties_names += names
    end

    def property(name)
      attr_accessor(name)
      @properties_names ||= []
      @properties_names << name
    end
  end
end
