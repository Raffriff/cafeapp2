class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET profile/orders.json
  def index
    @profile = Profile.find(params[:profile_id])
    @orders = @profile.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @profile = Profile.find(params[:profile_id])
    @order = @profile.orders.find(params[:id])
  end

  # GET /orders/new
  def new
    @profile = Profile.find(params[:profile_id])
    @order = @profile.orders.build
  end

  # GET /orders/1/edit
  def edit
    @profile = Profile.find(params[:profile_id])
    @order = @profile.orders.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    #@order = Order.new(order_params)

    #respond_to do |format|
     # if @order.save
      #  format.html { redirect_to @order, notice: 'Order was successfully created.' }
       # format.json { render :show, status: :created, location: @order }
      #else
       # format.html { render :new }
        #format.json { render json: @order.errors, status: :unprocessable_entity }
      #end
    #end 
    
    @profile = Profile.find(params[:profile_id])
    @order = @profile.orders.build(params.require(:order).permit(:pickUpTime, :totalPrice))
    if @order.save
      redirect_to profile_order_url(@profile, @order), notice: "Order was successfully created."
    else
      render :action => "new"
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    #respond_to do |format|
      #if @order.update(order_params)
        #format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        #format.json { render :show, status: :ok, location: @order }
      #else
       # format.html { render :edit }
        #format.json { render json: @order.errors, status: :unprocessable_entity }
      #end
    #end
    
    @profile = Profile.find(params[:profile_id])
    @order = Order.find(params[:id])
    if @order.update_attributes(params.require(:order).permit(:pickUpTime, :totalPrice))
      redirect_to profile_order_url(@profile, @order)
    else
      render :action => "edit"
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @profile = Profile.find(params[:profile_id])
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to profile_orders_path(@profile), notice: 'Order was successfully destroyed.' }
      format.xml { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:pickUpTime, :totalPrice, :profile_id)
    end
end
