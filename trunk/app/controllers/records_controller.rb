class RecordsController < ApplicationController

  def index
    @title = 'Search Records'
    search
    render :action => 'search'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def search
    @title = "Search for Record"
  end

  def show
    @title = "Details for Record"
    @record = Record.find(params[:id])
  end

  def new
    @title = "New Record"
    @record = Record.new
  end

  def create
    @title = "Create New Record"
    @record = Record.new(params[:record])
    @record.tag_with(params[:tag_list])
    if @record.save
      flash[:notice] = 'The new record was successfully created.'
      redirect_to :action => 'index'
    else
      flash[:notice] = 'Your Record was not saved. Please try again.'
      render :action => 'new'
    end
  end

  def edit
    @title = "Editing Record"
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    @record.tag_with(params[:tag_list])
    if @record.update_attributes(params[:record])
      flash[:notice] = 'Record was successfully updated.'
      redirect_to :action => 'show', :id => @record
    else
      render :action => 'edit'
    end
  end

  def destroy
    Record.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
