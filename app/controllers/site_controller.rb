class SiteController < ApplicationController
  def index
    @brokers_data = Broker.all.to_json
  end
end
