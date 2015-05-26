require 'spec_helper'

describe BigBrotherPR::Utils do
  class KawaiiClass
    include BigBrotherPR::Utils
  end

  let(:utils) { KawaiiClass.new }

  describe '.add_base_url_to_image' do
    it 'returns full image path' do
      expect(utils.add_base_url_to_image('/images/cameras/SJCAM16/SJCAM16.jpg'))
        .to eq('http://its.dtop.gov.pr/images/cameras/SJCAM16/SJCAM16.jpg')
    end
  end

  describe '.cleanup_response' do
    before(:all) do
      hash = {
        'Id' => 1,
        'Name' => 'Kawaii',
        'ImageSource' => '/images/cameras/SJCAM16/SJCAM16.jpg'
      }

      @parsed_response = KawaiiClass.new.cleanup_response(hash)
    end

    context 'when called with a camel-cased hash keys' do
      it 'returns transformed hash with lower camel-case keys' do
        expect(@parsed_response.keys).to eq(['id', 'name', 'imageSource'])
      end
    end
  end
end
