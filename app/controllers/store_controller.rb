class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
    session[:counter].nil? ? session[:counter]=0 : session[:counter]+=1
    @counter_label="This page was showed  #{session[:counter]} times" if session[:counter]>5
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @cart = current_cart
    end
  end
end
