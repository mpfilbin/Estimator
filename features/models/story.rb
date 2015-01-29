require_relative '../../fibonnaci/fibonnaci'

module Estimator
  module Models
    class Story
      attr_accessor :description, :points

      # @param [String] description - A description of the user story
      # @param [Integer] points - The number of story points assigned
      # @param [Estimator::Models::Risk] risk - A risk instance that quantifies the amount of risk associated with
      # the story
      def initialize(description, points, risk)
        @description = description
        @points = Estimator::Fibonnaci.closest points
        @risk = risk
      end

      # @return [Symbol] size
      def risk_size
        @risk.size
      end

      # @return [Float] the risk-adjusted story point value
      def adjusted_points
        @risk.adjust(@points)
      end

    end
  end
end