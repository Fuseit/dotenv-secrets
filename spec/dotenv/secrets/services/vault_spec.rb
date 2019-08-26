require 'spec_helper'

RSpec.describe Dotenv::Secrets::Services::Vault do
  subject { Dotenv::Secrets::Services::Vault.new('vault') }

  before do
    allow_any_instance_of(::Vault::KV).to receive(:read)
      .and_return({})
    allow_any_instance_of(::Vault::KV).to receive(:list).with('')
      .and_return(['development', 'test', 'production'])
  end

  describe '#list' do
    let(:secrets) { {
      'development' => {},
      'production' => {},
      'test' => {}
    } }

    it 'returns a list of secrets' do
      expect(subject.list).to match(secrets)
    end

    context 'when there are nested secrets' do
      before do
        allow_any_instance_of(::Vault::KV).to receive(:list).with('')
          .and_return(['development', 'test', 'production', 'production/'])
        allow_any_instance_of(::Vault::KV).to receive(:list).with('production/')
          .and_return(['cluster'])
      end

      let(:secrets) { {
        'development' => {},
        'production' => {},
        'production/cluster' => {},
        'test' => {}
      } }

      it 'returns a list of secrets' do
        expect(subject.list).to match(secrets)
      end
    end
  end

  describe '#list_by_path_depth' do
    before do
      allow_any_instance_of(::Vault::KV).to receive(:list).with('')
        .and_return(['development', 'test', 'production', 'production/'])
      allow_any_instance_of(::Vault::KV).to receive(:list).with('production/')
        .and_return(['cluster'])
    end

    let(:secrets) { {
      'development' => {},
      'production' => {},
      'test' => {},
      'production/cluster' => {},
    } }

    it 'sorts keys by the depth of the path' do
      expect(subject.send(:list_by_path_depth).to_a).to eq secrets.to_a
    end
  end
end
