require './lib/sipp_parser/utility/extraction'
require './lib/sipp_parser/utility/calculation'

module SippParser
  class DataSet
    include SippParser::Utility::Extraction
    include SippParser::Utility::Calculation

    attr_reader :original_file
    attr_reader :total_calls, :success_rate, :error_rate

    def initialize(original_file, run_id='')
      @original_file, @run_id = original_file, run_id

      return self
    end

    private

    def lines
      @lines ||= original_file.split /\r\n/
    end
  end
end
