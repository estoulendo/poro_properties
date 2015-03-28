require 'spec_helper'
require 'poro_properties/defaults'

describe PoroProperties::Defaults do
  subject do
    Class.new do
      include PoroProperties
      include PoroProperties::Defaults
    end
  end

  describe '.property' do
    before { subject.property(:foo, default: 'bar') }

    it 'defines a default value for a property' do
      expect(subject.new.foo).to eql('bar')
    end

    it 'returns a default only if value is not set' do
      instance = subject.new
      instance.foo = 'baz'
      expect(instance.foo).to eql('baz')
    end
  end
end
