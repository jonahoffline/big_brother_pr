require 'big_brother_pr/version'
require 'big_brother_pr/http'
require 'big_brother_pr/utils'

module BigBrotherPR
  def self.find_all_cameras
    BigBrotherPR::Client.new.find_all_cameras
  end

  class Client
    attr_reader :http, :traffic_cams

    def initialize
      @http = BigBrotherPR::HTTP.new
    end

    def find_all_cameras
      @traffic_cams = http.find_cameras
    end

    def save(response = traffic_cams)
      File.open('traffic_cams.json', 'w') do |f|
        f.write(response.to_json)
      end
    end
  end
end
