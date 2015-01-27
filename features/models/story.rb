module Estimator
  module Models
    class Story
      attr_accessor :description, :points
      @@fibonnaci_sequence = []

      # @param [String] description - A description of the user story
      # @param [Integer] points - The number of story points assigned
      # @param [Estimator::Models::Risk] risk - A risk instance that quantifies the amount of risk associated with
      # the story
      def initialize(description, points, risk)
        @description = description
        @points = valid_fibonacci_number?(points) ? points : closest_fibonacci_number(points)
        @risk = risk
      end

      # @return [Float] the risk-adjusted story point value
      def adjusted_points
        @risk.adjust(@points)
      end

      # @param [Integer] n - The number of number of fibonnaci numbers to generate
      # @param [Boolean] regenerate - If true, the sequence will be regenerated
      def self.generate_sequence_up_to(n = 0, regenerate = false)
        if @@fibonnaci_sequence.empty? || regenerate == true

          @@fibonnaci_sequence.clear
          sequence = [0]

          while n > 0
            sequence.push(self.fibonnaci(n))
            n -= 1
          end

          @@fibonnaci_sequence.concat(sequence.reverse).sort!
        end
        @@fibonnaci_sequence

      end

      # @param [Integer] n - The number to see the fibonnaci sequence
      # @return [Integer] A fibonnaci number
      def self.fibonnaci(n)
        n <= 1 ? n : (fibonnaci(n - 1) + fibonnaci(n - 2))
      end

      private

      # @param [Integer] n
      # @return [Boolean] True if the number is a valid fibonnaci number within the calculated sqeuence
      def valid_fibonacci_number?(n)
        !n.nil? and @@fibonnaci_sequence.include? n
      end

      # @param [Integer] n - A candidate fibonnaci number
      # @return [Integer] The closest fibonnaci number in the calculated sequence
      def closest_fibonacci_number(n)
        @@fibonnaci_sequence.reduce { |previous, current| (current - n).abs < (previous - goal).abs ? current : previous }
      end

    end
  end
end