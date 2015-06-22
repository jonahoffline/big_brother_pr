require 'geocoder'
require 'active_support/core_ext/string/inflections'

module BigBrotherPR
  module Utils
    def self.included(base)
      base.extend(self)
    end

    def add_base_url_to_image(image_path)
      "http://its.dtop.gov.pr#{image_path}"
    end

    def cleanup_response(response)
      response.each_with_object({}) do |(key, value), hash|
        hash[key.camelize(:lower)] = (key.eql?('ImageSource') ? add_base_url_to_image(value) : value)
      end
    end

    def add_missing_coordinates(response)
      unless response['hasCoordinates']
        location = add_county_to_incomplete_location(response)
        if (geo_data = coordinates_for(location))
          response['latitude']  = geo_data[:latitude]
          response['longitude'] = geo_data[:longitude]
          response['hasCoordinates'] = true if (response['latitude'] && response['longitude'])
        end
      end
      response
    end

    def remove_extra_characters(location)
      location.gsub(/\.|INT/, '').split.join(' ')
    end

    def add_county_to_incomplete_location(address)
      if !!(address['location'] =~ /PR/)
        address['location']
      else
        county = address['name'].gsub(/(\WCAM \d+)/, '')
        "#{county} #{address['location']}"
      end
    end

    def coordinates_for(address)
      address = remove_extra_characters(address)
      results = []

      dev_null do
        results = Geocoder.search(address)
      end

      if ((!results.empty?) && (results.first.latitude && results.first.longitude))
        {
          latitude: results.first.latitude,
          longitude: results.first.longitude
        }
      else
        false
      end
    end

    def dev_null
      orig_stdout = $stdout.dup
      $stdout.reopen('/dev/null', 'w')
      yield
    ensure
      $stdout.reopen(orig_stdout)
    end
  end
end
