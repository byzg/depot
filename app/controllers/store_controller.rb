class StoreController < ApplicationController
  def index
    @products=Product.order(:title)
    session[:counter].nil? ? session[:counter]=0 : session[:counter]+=1
    @counter_label="This page was showed  #{session[:counter]} times" if session[:counter]>5
  end
end
