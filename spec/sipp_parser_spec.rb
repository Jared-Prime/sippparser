require './lib/sipp_parser'
require './lib/sipp_parser/data_set'

describe SippParser do
  subject { described_class }
  let(:file_contents) { double 'read File' }
  let(:data_set)      { double 'DataSet'   }

  before :each do
    allow(File).to receive(:read) { file_contents }
    allow(SippParser::DataSet).to receive(:new) { data_set }
  end

  describe '.open_file' do
    it 'takes a filepath as input and outputs a DataSet' do
      expect(subject.open_file('./some/file.log')).to eq data_set # bad mock!
    end
  end
end
