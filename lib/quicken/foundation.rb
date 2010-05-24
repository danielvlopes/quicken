module Quicken
  class Foundation

    def self.accessors_for_spec(spec)
      spec.each do |key, item|
        instance_eval do
          attr_accessor key.to_sym
        end
      end
    end

    def initialize(attrs={})
      attrs.each do |key, value| 
        begin
          send("#{key}=", value) 
        rescue
          next
        end
      end
    end

  end
end