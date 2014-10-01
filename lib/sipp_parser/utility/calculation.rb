module SippParser
  module Utility
    module Calculation
      SUMMARY_HEADERS = ['Total Count', 'Successful Count', 'Failure Count',
        'Percent Successful', 'Percent Failed']

      MIN_DURATION = '9000'
      MAX_DURATION = '10000'

      def calculation_summary_data
        return @calculation_summary_data if @calculation_summary_data
        
        @calculation_summary_data = [ total_calls, successes, failures, success_rate, failure_rate ]
      end

      def total_calls
        return @total_calls if @total_calls

        @total_calls = partition_table.inject(0.0) do |sum,entry|
          sum + entry.last.to_f
        end
      end

      def successes
        return @successes if @successes

        @successes = partition_table.inject(0.0) do |sum,entry|
          frame = entry.first
          sum + frame.to_f if frame > MIN_DURATION && frame < MAX_DURATION
        end
      end

      def failures
        return @failures if @failures

        @failures = partition_table.inject(0.0) do |sum,entry|
          frame = entry.first
          sum + frame.to_f if frame <= MIN_DURATION && frame >= MAX_DURATION
        end
      end

      def success_rate
        @success_rate ||= successes / total_calls 
      end

      def failure_rate
        @failure_rate ||= failures / total_calls
      end
    end
  end
end
