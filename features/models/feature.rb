module Estimator
  module Models
    class Feature
      attr_accessor :description
      attr_reader :project

      def initialize(project, description)
        @project = project
        @description = description
        @stories = []
      end

      # @param [Estimator::Models::Story] story
      def add_story(story)
        @stories.push(story)
      end


      # @return [Integer]
      def story_count
        @stories.length
      end


      # @param [Estimator::Models::Story] story
      def remove_story(story)
        @stories.delete(story)
      end

      def total_story_points
        @stories.inject(0) {|points, story| points += story.points}
      end

      def total_adjusted_points
        @stories.inject(0) {|points, story| points += story.adjusted_points }
      end

    end
  end
end