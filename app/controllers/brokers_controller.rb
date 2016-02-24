class BrokersController < ApplicationController

  before_action :current_admin

  def new
    @broker = Broker.new
  end

  def create
    broker_params = params.require(:broker).permit(:name, :website, :image, :min_deposit, :stock_trade_fee, :mutual_fund_trade_fee, :option_base_trade_fee, :margin_rate)
    @broker = Broker.create(broker_params)
    redirect_to current_admin
  end

  def edit
    @broker = Broker.find_by_id(params[:id])
  end

  def update
    @broker = Broker.find_by_id(params[:id])
    broker_params = params.require(:broker).permit(:name, :website, :image, :min_deposit, :stock_trade_fee, :mutual_fund_trade_fee, :option_base_trade_fee, :margin_rate)
    @broker.update_attributes(broker_params)
    redirect_to @broker
  end

  def show
    @broker = Broker.find_by_id(params[:id])
  end

  def destroy
    @broker = Broker.find_by_id(params[:id])
    @broker.destroy
    redirect_to current_admin
  end

  def select
    @broker1 = Broker.find_by_id(params[:foo])
    @broker2 = Broker.find_by_id(params[:bar])
  end

end
