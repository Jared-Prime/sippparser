require 'csv'

module SippParser
  class Document
    SPACER_COLS = ['','']

    def initialize(*data_sets)
      @data_sets = data_sets.to_a
    end

    def partition_summary_heading
      return @partition_summary_heading if @partition_summary_heading

      @partition_summary_heading = []

      for set in @data_sets
        @partition_summary_heading = @partition_summary_heading + ['Node', 'Test Run ID'] + SPACER_COLS
      end
      
      return @partition_summary_heading
    end

    def partition_summary_data
      return @partition_summary_data if @partition_summary_data

      @partition_summary_data = []

      for set in @data_sets
        @partition_summary_data = @partition_summary_data + [set.node_ip_address, set.run_id] + SPACER_COLS
      end

      return @partition_summary_data
    end

    def partition_heading
      return @partition_heading if @partition_heading

      @partition_heading = []

      for set in @data_sets
        @partition_heading = @partition_heading + ['Frame', 'Count'] + SPACER_COLS
      end

      return @partition_heading
    end

    def partition_data
      return @partition_data if @partition_data

      @partition_data = []

      row, col_set = 0, 0

      for set in @data_sets
        for table in set.partition_table
          if col_set == 0
            @partition_data << table + SPACER_COLS 
          else
            @partition_data[row] = @partition_data[row] + table + SPACER_COLS
          end

          row += 1
        end

        row = 0
        col_set += 1
      end

      return @partition_data
    end

    def summary_data
      return @summary_data if @summary_data

      @summary_data = []

      for set in @data_sets
        @summary_data << set.summary_data 
      end
    end

    # :nocov:
    def write_summary_data(filename)
      CSV.open(filename, 'w') do |csv|
        csv << SippParser::Utility::Calculation::SUMMARY_HEADERS
        csv << summary_data
      end
    end

    def write_partition_tables(filename)
      CSV.open(filename, 'w') do |csv|
        csv << partition_summary_heading
        csv << partition_summary_data
        csv << partition_heading
        partition_data.each {|row| csv << row }

        csv
      end
    end
    # :nocov:
  end
end
