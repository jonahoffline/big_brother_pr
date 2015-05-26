require 'spec_helper'
require 'pry'

describe BigBrotherPR::HTTP do
  let(:http) { BigBrotherPR::HTTP.new }

  describe '.cookies' do
    it 'returns a Hash' do
      expect(http.class.cookies).to be_a(Hash)
    end

    it 'contains a gsScrollPos cookie value' do
      expect(http.class.cookies.key?(:gsScrollPos)).to be_truthy
      expect(http.class.cookies.fetch(:gsScrollPos)).to eq('')
    end
  end

  describe '.headers' do
    it 'returns a Hash' do
      expect(http.class.headers).to be_a(Hash)
    end

    it 'contains a Content-Type header' do
      expect(http.class.headers.key?('Content-Type')).to be_truthy
      expect(http.class.headers.fetch('Content-Type')).to eq('application/json')
    end

    it 'contains a User-Agent header' do
      expect(http.class.headers.key?('User-Agent')).to be_truthy
      expect(http.class.headers.fetch('User-Agent'))
        .to eq("BigBrotherPR-Rubygem/#{BigBrotherPR::VERSION}")
    end
  end

  describe '.videos' do
    it 'returns an Array' do
      expect(http.videos).to be_a(Array)
    end
  end

  describe '.cctv' do
    it 'returns an Array of hashes' do
      expect(http.cctv).to be_a(Array)
      expect(http.cctv.first).to be_a(Hash)
    end
  end
end
