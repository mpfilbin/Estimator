module Estimator
  module Models
    class Risk
      @@multipliers = {}

      def initialize(new_size  = :small)
        size = new_size.to_sym
      end

      def size
        @size
      end

      def size=(new_size)
        @size = valid_size? new_size ? size : :small
      end

      def adjust(points = 0)
        unless @@multipliers.keys.empty?
          multiplier = @@multipliers.fetch size
          points * multiplier
        else
          points
        end
      end


      def self.register_multipliers(multipliers)
        @@multipliers.merge! multipliers
      end


      private

      def valid_size?(size)
        @@multipliers.keys.include? size
      end

    end


  end
end