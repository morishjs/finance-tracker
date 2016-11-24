class StocksController < ApplicationController
  def search
    if params[:stock]
      #데이터베이스에 존재할때
      @stock = Stock.find_by_ticker(params[:stock])
      #otherwise
      @stock ||= Stock.new_from_lookup(params[:stock])
    end

    if @stock
      render partial: 'lookup'
      # render json: @stock
    else
      render status: :not_found, nothing: true
    end
  end
end