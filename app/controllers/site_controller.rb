class SiteController < ApplicationController
  def index
    @brokers = Broker.all.to_json
  end
end
