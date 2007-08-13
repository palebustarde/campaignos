class FinancialsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @fiscal_transaction_pages, @fiscal_transactions = paginate :fiscal_transactions, :per_page => 10
  end

  def show
    @fiscal_transaction = FiscalTransaction.find(params[:id])
  end

  def new
    @fiscal_transaction = FiscalTransaction.new
  end

  def create
    @fiscal_transaction = FiscalTransaction.new(params[:fiscal_transaction])
    if @fiscal_transaction.save
      flash[:notice] = 'FiscalTransaction was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @fiscal_transaction = FiscalTransaction.find(params[:id])
  end

  def update
    @fiscal_transaction = FiscalTransaction.find(params[:id])
    if @fiscal_transaction.update_attributes(params[:fiscal_transaction])
      flash[:notice] = 'FiscalTransaction was successfully updated.'
      redirect_to :action => 'show', :id => @fiscal_transaction
    else
      render :action => 'edit'
    end
  end

  def destroy
    FiscalTransaction.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
