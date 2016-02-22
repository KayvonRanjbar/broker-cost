class AdminsController < ApplicationController

  def show
    @admin = Admin.find_by_id(params[:id])
    @brokers = Broker.all
  end
  
end
