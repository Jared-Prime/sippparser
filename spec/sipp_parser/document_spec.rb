require './lib/sipp_parser/document'
require './lib/sipp_parser/data_set'

describe SippParser::Document do
  subject { described_class.new data_set1, data_set2 }

  let(:node_address1) {'0.0.0.0'}
  let(:node_address2) {'0.0.0.1'}

  let(:run_id1) {'1'}
  let(:run_id2) {'3'}
  let(:time){ double Time }
  let(:data){ double Array }

  let(:data_set1) do
    instance_double SippParser::DataSet, node_ip_address: node_address1,
                                         run_id: run_id1,
                                         summary_data: [time, run_id1,
                                                        node_address1, data],
                                         partition_table: [['1','0'],
                                                           ['2','0']]
  end

  let(:data_set2) do
    instance_double SippParser::DataSet, node_ip_address: node_address2,
                                         run_id: run_id2,
                                         summary_data: [time, run_id2,
                                                        node_address2, data],
                                         partition_table: [['1','1'],
                                                           ['2','1']]
  end


  describe '#partition_summary_heading' do
    it 'creates a heading row long enough for all the DataSets' do
      expect(subject.partition_summary_heading)
        .to eq ['Node', 'Test Run ID','','',
                'Node', 'Test Run ID','','' ]
    end
  end

  describe '#partition_summary_data' do
    it 'creates a row with all the DataSet\'s summary data' do
      expect(subject.partition_summary_data)
        .to eq [node_address1, run_id1, '', '',
                node_address2, run_id2, '', '' ]
    end
  end

  describe '#partition_heading' do
    it 'creates a heading row for the partition data' do
      expect(subject.partition_heading)
        .to eq ['Frame', 'Count', '', '',
                'Frame', 'Count', '', '' ]
    end
  end

  describe '#partition_data' do
    it 'fills columns with all the DataSet\'s partition data' do
      expect(subject.partition_data)
        .to eq [['1', '0', '', '', '1', '1', '', ''],
                ['2', '0', '', '', '2', '1', '', '']]
    end
  end
end
