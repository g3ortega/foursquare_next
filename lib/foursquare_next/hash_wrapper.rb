module FoursquareNext
  class HashWrapper < ::Hashie::Mash
    if respond_to?(:disable_warnings)
      disable_warnings
    end
  end
end
