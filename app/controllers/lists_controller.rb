class ListsController < ApplicationController
  before_action :find_list, :only => [:show, :edit, :update, :destroy]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_url
    else
      render :action => :new
    end
  end



  def update
    
    if @list.update_attributes(list_params)
      redirect_to lists_url
    else 
      render :action => :edit
    end
  end

  def destroy
    if List.find(params[:id]).date >= Date.today
      @list.destroy
      redirect_to lists_url
    else
      redirect_to lists_url, :notice => "Error: Due Date Past"
    end
  end
  


  private

  def list_params
    params.require(:list).permit(:title, :date, :description)
  end

  def find_list
    @list = List.find(params[:id])
  end
  

    
  
end
