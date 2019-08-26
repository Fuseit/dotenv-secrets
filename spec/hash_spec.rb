require 'spec_helper'

RSpec.describe Hash do
  describe '.explode' do
    let(:normal_hash) { {
      'y' => {'key' => 'y'},
      'a' => {'key' => 'a'},
      'c' => {'key' => 'c'},
      'c/d' => {'key' => 'c/d'},
      'f/g' => {'key' => 'f/g'},
      'i' => {'key' => 'i'}
    } }

    let(:exploded_hash) { {
      'a' => {'key' => 'a'},
      'c' => {'d' => {'key' => 'c/d'}, 'key' => 'c'},
      'f' => {'g' => {'key' => 'f/g'}},
      'i' => {'key' => 'i'},
      'y' => {'key' => 'y'}
    } }

    it 'expands the hash my spliting and merging keys' do
      expect(normal_hash.explode).to eq exploded_hash
    end
  end
end
