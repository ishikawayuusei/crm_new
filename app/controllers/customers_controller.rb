class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  before_action :set_company, only: [:new, :edit]
  def index
    @customers = Customer.page(params[:page])
  end

  def new
   @customer = Customer.new
   @companies = Company.all
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
       redirect_to @customer
    else
      render :new
    end
  end

  def edit
    @companies = Company.all
  end

  def update
      if  @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end
  private
  def cutomer_params
        params.require(:customer).permit(
      :family_name,
      :given_name,
      :email,
      :company_id
      )
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

    def set_company
    @customer = Customer.find(params[:id])
  end
end