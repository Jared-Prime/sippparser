require './lib/sipp_parser/utility/extraction'
require './lib/sipp_parser/utility/calculation'

module SippParser
  class DataSet
    include SippParser::Utility::Extraction
    include SippParser::Utility::Calculation

    attr_reader :original_file, :run_id

    def initialize(original_file, run_id='')
      @original_file, @run_id = original_file, run_id

      return self
    end

    def summary_data
      return @summary_data if @summary_data

      @summary_data = [timestamp, run_id, node_ip_address] + extraction_summary_data + calculation_summary_data
    end
  end
end
