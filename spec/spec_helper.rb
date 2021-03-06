require 'simplecov'
require 'pry'
require './lib/sipp_parser'
require './lib/sipp_parser/utility/extraction'
require './lib/sipp_parser/utility/calculation'

SimpleCov.start 'rails'

module TestHelper
  class Extraction
    include SippParser::Utility::Extraction

    EXPECTED_PARTS = [[ 1100, 0], [ 1100, 0], [ 1150, 0], [ 1150, 0], [ 1200, 0], [ 1250, 0], [ 1300, 0], [ 1350, 0], [ 1400, 0], [ 1450, 0], [ 1500, 0], [ 1550, 0], [ 1600, 0], [ 1650, 0], [ 1700, 0], [ 1750, 0], [ 1800, 0], [ 1850, 0], [ 1900, 0], [ 1950, 0], [ 2000, 0], [ 2000, 0], [ 2050, 0], [ 2050, 0], [ 2100, 0], [ 2150, 0], [ 2200, 0], [ 2250, 0], [ 2300, 0], [ 2350, 0], [ 2400, 0], [ 2450, 0], [ 2500, 0], [ 2550, 0], [ 2600, 0], [ 2650, 0], [ 2700, 0], [ 2750, 0], [ 2800, 0], [ 2850, 0], [ 2900, 0], [ 2950, 0], [ 7000, 0], [ 7050, 0], [ 7100, 0], [ 7150, 0], [ 7200, 0], [ 7250, 0], [ 7300, 0], [ 7350, 0], [ 7400, 0], [ 7450, 0], [ 7500, 0], [ 7550, 0], [ 7600, 0], [ 7650, 0], [ 7700, 0], [ 7750, 0], [ 7800, 0], [ 7850, 0], [ 7900, 0], [ 7950, 0], [ 8000, 0], [ 8050, 0], [ 8100, 0], [ 8150, 0], [ 8200, 0], [ 8250, 0], [ 8300, 0], [ 8350, 0], [ 8400, 0], [ 8450, 0], [ 8500, 0], [ 8550, 0], [ 8600, 0], [ 8650, 0], [ 8700, 0], [ 8750, 0], [ 8800, 0], [ 8850, 0], [ 8900, 0], [ 8950, 0], [ 9000, 0], [ 9050, 0], [ 9100, 0], [ 9150, 0], [ 9200, 0], [ 9250, 0], [ 9300, 0], [ 9350, 1], [ 9400, 0], [ 9450, 0], [ 9500, 0], [ 9550, 0], [ 9600, 0], [ 9650, 1], [ 9700, 0], [ 9750, 0], [ 9800, 0], [ 9850, 0], [ 9900, 0], [ 9950, 0], [10000, 0], [10050, 0], [10100, 0], [10150, 0], [10200, 0], [10250, 0], [10300, 0], [10350, 0], [10400, 0], [10450, 0], [10500, 0], [10550, 0], [10600, 0]].map {|row| row.map(&:to_s) }.freeze

    attr_reader :original_file

    def initialize 
      @original_file = File.read './spec/fixture/lv_test_boolean_15713_screen.log'
    end
  end
end
