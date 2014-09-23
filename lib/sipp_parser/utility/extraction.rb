module SippParser
  module Utility
    module Extraction
      PARTION_LINE   = /ms <= n </
      TIMESTAMP_LINE = /Timestamp.*/
      TIME_SEPARATOR = /(:|\s)/
      PEAK_CONCURRENCY_LINE = /Peak was.* calls/
      TARGET_RATE_LINE  = /.*8838.*UDP\)/
      AVG_RATE_LINE     = /Call Rate.*/
      AVG_DURATION_LINE = /Call Length.*/
      IP_ADDRESS = /\d{3}\.\d{3}\.\d{2}\.\d{1}/
      SUMMARY_HEADING = ['Node IP', 'Test Run ID', 'Timestamp', 'Peak Concurrency',
        'Target Rate', 'Average Rate', 'Average Duration']

      def partition_table(frame_pos=5, count_pos=8)
        return @partition_table if @partition_table
        
        lines = lines.select do |line|
          line.match PARTION_LINE
        end

        lines = lines.map do |line|
          line = line.split
          [ line[frame_pos], line[count_pos] ]
        end

        @partition_table = lines
      end

      def timestamp
        return @timestamp if @timestamp

        ts = original_file.match(TIMESTAMP_LINE).to_s
        ts = ts.split TIME_SEPARATOR
        ts = ts.reject { |s| s.strip.empty? || s == ':' }

        @timestamp = Time.new ts[7], ts[2], ts[3], ts[4], ts[5], ts[6]
      end

      def peak_concurrency(pos=2)
        return @peak_concurrency if @peak_concurrency

        peak = original_file.match(PEAK_CONCURRENCY_LINE).to_s
        
        @peak_concurrency = peak.split[pos]
      end

      def target_rate(pos=0)
        return @target_rate if @target_rate

        rate = original_file.match(TARGET_RATE_LINE).to_s
        rate = rate.split '('

        @target_rate = rate[pos].to_i
      end

      def average_rate(pos=-2)
        return @average_rate if @average_rate
        
        rate = original_file.match(AVG_RATE_LINE).to_s
        rate = rate.split[pos].to_f
      end

      def average_duration(left=-2, right=-1)
        return @average_duration if @average_duration

        dur = original_file.match(AVG_DURATION_LINE).to_s.strip
        dur = dur.split ':'

        @average_duration = (dur[left] + '.' + dur[right]).to_f
      end

      def target_ip_address
        return @target_ip_address if @target_ip_address

        @target_ip_address = original_file.match(IP_ADDRESS).to_s
      end
    end
  end
end
