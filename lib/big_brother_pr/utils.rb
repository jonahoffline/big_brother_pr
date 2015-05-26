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
  end
end