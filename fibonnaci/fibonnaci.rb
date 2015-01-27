require 'bigdecimal'

module Estimator
  module Fibonnaci

    # @param [Integer] n
    # @return [Integer] fibonnaci number
    def self.calculate(n)
      n < 2 ? n : (calculate(n - 1) + calculate(n - 2))
    end


    # @param [Integer] n
    # @return [Boolean] True if the number is a valid fibonnaci number within the calculated sqeuence
    # A positive integer ω is a Fibonacci number if and only if one of 5ω2 + 4 and 5ω2 - 4 is a perfect square.
    def self.valid?(n)
      n = BigDecimal.new(n)

      candidate1 = (5*(n**2)+4).sqrt(0)
      candidate2= (5*(n**2)-4).sqrt(0)

      (candidate1 == candidate1.round || candidate2 == candidate2.round)
    end

    # @param [Integer] n - A candidate fibonnaci number
    # @return [Integer] The closest fibonnaci number in the calculated sequence
    def self.closest(n)
      if valid? n
        n
      else
        n.downto 0 do |candidate|
          candidate if valid? candidate
        end
      end
    end
  end
end