require 'csv'

module SippParser
  autoload :DataSet,  './lib/sipp_parser/data_set'
  autoload :Document, './lib/sipp_parser/document'

  class << self
    def open_file(path)
      orig = File.read path
      run_id = path.gsub /[A-Za-z_\.]/, ''
      DataSet.new orig, run_id
    end
  end
end
