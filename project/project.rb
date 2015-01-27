module Estimator
  module Models
    class Project

      attr_accessor :title, :start_date, :end_date
      attr_reader :client

      def initialize(title = "", client, start_date, end_date)

        @title = title
        @start_date = start_date
        @end_date = end_date
        @client = client

      end
    end
  end
end