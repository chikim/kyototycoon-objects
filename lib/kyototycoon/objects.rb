require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/try'

class KyotoTycoon
  module Objects
    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def kyototycoon_connection
        @kyototycoon_connection ||= (KyotoTycoon.configures.values.last || KyotoTycoon.new).call
      end

      def kyototycoon_counter(name, options={})
        options[:start] ||= 0
        define_method(name) do
          instance_variable_get("@#{name}") || instance_variable_set("@#{name}", self.class.kyototycoon_connection[kyototycoon_counter_key(name)].try(:to_i) || options[:start])
        end

        define_method("#{name}=") do |value|
          instance_variable_set("@#{name}", value)
          self.class.kyototycoon_connection[kyototycoon_counter_key(name)] = value
        end
      end
    end

    private
    def kyototycoon_counter_key attr
      "#{self.class.name.underscore.pluralize}:#{self.id}:#{attr}"
    end
  end
end
