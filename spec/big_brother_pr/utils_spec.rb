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

  describe '.add_missing_coordinates' do
    before(:all) do
      hash = {
        'id' => 1,
        'name' => 'AGUADA-CAM 01',
        'location' => 'PR-2 INT PR-417',
        'imageSource' => 'http://its.dtop.gov.pr/images/cameras/AGDACAM01/AGDACAM01.jpg',
        'latitude' => nil,
        'longitude' => nil,
        'hasCoordinates' => false,
        'dateTime' => '1/10/2014 3:33:24 PM'
      }

      @parsed_response = KawaiiClass.new.add_missing_coordinates(hash)
    end

    it 'adds missing coordinates to camera locations' do
      expect(@parsed_response['latitude']).not_to be_nil
      expect(@parsed_response['longitude']).not_to be_nil
      expect(@parsed_response['hasCoordinates']).to be_truthy
    end
  end

  describe '.remove_extra_characters' do
    it 'removes extra characters from camera location' do
      expect(KawaiiClass.new.remove_extra_characters('PR-2 INT. PR-417'))
        .to eq('PR-2 PR-417')
    end
  end

  describe '.add_county_to_incomplete_location' do
    it 'adds county to incomplete camera location' do
      hash = {
        'name' => 'SAN JUAN-CAM 34',
        'location' => 'AVE PONCE DE LEON INT CALLE HOARE',
      }

      expect(KawaiiClass.new.add_county_to_incomplete_location(hash))
        .to eq('SAN JUAN AVE PONCE DE LEON INT CALLE HOARE')
    end
  end
end
