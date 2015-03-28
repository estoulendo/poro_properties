require 'spec_helper'

describe PoroProperties do
  subject do
    Class.new { include PoroProperties }
  end

  describe '.properties' do
    it 'defines accessors for the properties' do
      expected = %i(foo foo= bar bar=)

      expect { subject.properties(:foo, :bar) }
        .to change { subject.instance_methods(false) }.from([]).to(expected)
    end
  end

  describe '.property' do
    it 'defines an acessor for a property' do
      expected = %i(foo foo=)

      expect { subject.property(:foo) }
        .to change { subject.instance_methods(false) }.from([]).to(expected)
    end
  end

  describe '.properties_names' do
    it 'returns all defined properties' do
      subject.properties(:foo, :bar)
      expect(subject.properties_names).to eql(%i(foo bar))
    end
  end

  describe '#to_h' do
    let(:instance) { subject.new }

    before do
      subject.properties(:foo, :bar, :baz)
      instance.foo = 'foo value'
      instance.bar = 'bar value'
    end

    it 'returns a hash with properties values' do
      expect(instance.to_h).to eql(foo: 'foo value',
                                   bar: 'bar value',
                                   baz: nil)
    end
  end
end
