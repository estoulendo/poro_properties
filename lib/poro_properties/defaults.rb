module PoroProperties
  module Defaults
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      attr_accessor :properties_defaults

      def property(name, default:)
        super(name)
        define_method(name) do
          instance_variable_get("@#{name}") || default
        end
      end
    end
  end
end
