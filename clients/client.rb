module Estimator
  module Models
    class Client
      attr_accessor :name

      def initialize(name = nil)
        @name = name
      end

    end
  end
end