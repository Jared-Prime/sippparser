require 'spec_helper'

describe SippParser::DataSet do
  subject { described_class.new file }

  let(:file){ File.read './spec/fixture/lv_test_boolean_15713_screen.log' }

  describe '#summary_data' do
    it 'returns the summary data' do
      expect(subject.summary_data).to eq ['Wed Sep 17 16:12:48 2014', '15731', '192.168.11.1']
    end
  end
end
