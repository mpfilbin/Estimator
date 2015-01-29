require_relative '../../features/models/story'

module Estimator
  module Providers
    class StoryProvider

      def initialize(risk_provider)
        @risk_provider = risk_provider
      end

      def build_story(description, points, risk_size)
        @risk = @risk_provider.build(risk_size)
        Estimator::Models::Story.new(description, points, @risk)
      end

    end
  end
end