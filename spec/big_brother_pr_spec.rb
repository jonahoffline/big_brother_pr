require 'spec_helper'

describe BigBrotherPR do
  it 'has a version number' do
    expect(BigBrotherPR::VERSION).not_to be nil
  end

  describe '#find_all_cameras' do
    before(:all) do
      @method_described = BigBrotherPR.find_all_cameras
    end

    context 'when request is successful' do
      it 'returns sorted cams' do
        expect(@method_described.count).to eq(110)
      end

      it 'contains an id' do
        expect(@method_described.first.key?('id')).to be_truthy
      end

      it 'contains hasCoordinates key' do
        expect(@method_described.last.key?('hasCoordinates')).to be_truthy
      end

      it 'contains coordinates' do
        expect(@method_described.last.key?('latitude')).to be_truthy
        expect(@method_described.last.key?('longitude')).to be_truthy
      end

      it 'contains name' do
        expect(@method_described.last.key?('name')).to be_truthy
      end

      it 'contains location' do
        expect(@method_described.last.key?('location')).to be_truthy
      end

      it 'contains imageSource' do
        expect(@method_described.last.key?('imageSource')).to be_truthy
      end

      it 'contains dateTime' do
        expect(@method_described.last.key?('dateTime')).to be_truthy
      end
    end
  end
end
