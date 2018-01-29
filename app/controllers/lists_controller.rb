class ListsController < ApplicationController
  before_action :find_list, :only => [:show, :edit, :update, :destroy, :check]
  def index
    @lists = List.all
    @list = List.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    # if @list.save
    #   respond_to do |format|
    #     # format.html
    #     format.js
    #   end
    # end

  end

  def edit

    respond_to do |format|
      format.js
    end
  end


  def update

    if @list.update(list_params)
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    if  @list.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  def check
    @list.update(check: !(@list.check))
  end



  private

  def list_params
    params.require(:list).permit(:title, :date, :description)
  end

  def find_list
    @list = List.find(params[:id])
  end




end
