require 'spec_helper'

describe SippParser::Utility::Extraction do

  subject { TestHelper::Extraction.new }
  let(:partitions) { TestHelper::Extraction::EXPECTED_PARTS }
  let(:time) { Time.new 2014, 9, 17, 16, 12, 48 }

  describe '#partition_table' do
    it 'returns a properly parsed partition table' do
      expect(subject.partition_table).to eq partitions
    end
  end
  
  describe '#timestamp' do
    it 'returns a properly parsed timestamp' do
      expect(subject.timestamp).to eq time
    end
  end
  
  describe '#peak_concurrency' do
    it 'returns a properly parsed concurrency value' do
      expect(subject.peak_concurrency).to eq '1'
    end
  end
  
  describe '#target_rate' do
    it 'returns a properly parsed target rate' do
      expect(subject.target_rate).to eq 1
    end
  end

  describe '#average_rate' do
    it 'returns a properly parsed average rate' do
      expect(subject.average_rate).to eq 0.097
    end
  end

  describe '#average_duration' do
    it 'returns a properly parsed duration' do
      expect(subject.average_duration).to eq 9.478
    end
  end
  
  describe '#node_ip_address' do
    it 'returns a properly parsed ip address' do
      expect(subject.node_ip_address).to eq '192.168.11.1'
    end
  end
end
