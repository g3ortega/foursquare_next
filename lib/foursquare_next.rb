require "faraday"
require "faraday_middleware"
require "hashie/mash"

__dir__

module FoursquareNext
  class << self
    FIELDS = [:client_id, :client_secret, :api_version, :ssl, :connection_middleware, :locale].freeze
    attr_accessor(*FIELDS)

    def filter(tips, term)
      tip = []
      tips&.items&.each do |check_tip|
        tip << check_tip if check_tip.text.downcase.include? term.downcase
      end
      HashWrapper.new(count: tip.count, items: tip)
    end

    def configure
      yield self
      true
    end
  end

  require "foursquare_next/hash_wrapper"
  require "foursquare_next/mashify_wrapper"
  require "foursquare_next/campaigns"
  require "foursquare_next/users"
  require "foursquare_next/specials"
  require "foursquare_next/settings"
  require "foursquare_next/photos"
  require "foursquare_next/tips"
  require "foursquare_next/checkins"
  require "foursquare_next/venues"
  require "foursquare_next/venuegroups"
  require "foursquare_next/pages"
  require "foursquare_next/lists"
  require "foursquare_next/events"
  require "foursquare_next/client"
  require "foursquare_next/api_error"
end
