require 'json'
require 'httparty'
require 'big_brother_pr/utils'

module BigBrotherPR
  class HTTP
    include HTTParty
    include BigBrotherPR::Utils

    base_uri 'its.dtop.gov.pr'

    cookies gsScrollPos: ''
    headers 'Content-Type' => 'application/json',
            'User-Agent'   => "BigBrotherPR-Rubygem/#{BigBrotherPR::VERSION}"

    def find_cameras
      traffic_cams = []

      (1..110).each do |index|
        cam_attributes = find_by_id(index)
        traffic_cams.push(cam_attributes)
      end

      merged_cams = merge_cams(public: cctv, private: traffic_cams)

      merged_cams.map do |res|
        parsed_response = cleanup_response(res)
        add_missing_coordinates(parsed_response)
      end
    end

    def merge_cams(public:, private:)
      private.sort_by! { |private_attributes| private_attributes['Name'] }

      private.each_with_index do |private_attributes, index|
        private_attributes['Id'] = index.next
        private_attributes['Latitude'] = nil
        private_attributes['Longitude'] = nil
        private_attributes['HasCoordinates'] = false
      end

      public.map do |camera_attributes|
        camera_attributes.each do |key, value|
          if key.eql?('ImageUrl')
            if (private_hash = private.find { |c| c['ImageSource'] === value }) && has_coordinates?(camera_attributes)
              private[private.index(private_hash)]['Latitude'] = camera_attributes['Latitude']
              private[private.index(private_hash)]['Longitude'] = camera_attributes['Longitude']
              private[private.index(private_hash)]['HasCoordinates'] = true
            end
          end
        end
      end
      private
    end

    def has_coordinates?(camera_attributes)
      (camera_attributes['Latitude'] != 0) && (camera_attributes['Latitude'] != 0)
    end

    def find_by_id(id = 1)
      self.class.post('/es/TrafficImage.aspx/GetImageData',
        body: { id: id }.to_json
      )['d']
    end

    def cctv
      self.class.post('/es/Default.aspx/GetCctv', body: {}.to_json)['d']['Cctv']
    end

    def videos
      self.class.post('/es/Default.aspx/GetVds', body: {}.to_json)['d']['Vds']
    end
  end
end
