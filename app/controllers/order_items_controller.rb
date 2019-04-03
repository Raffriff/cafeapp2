class OrderItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order = Order.find(params[:order_id])
    @order_items = @order.order_items
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.find(params[:id])
  end

  # GET /order_items/new
  def new
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.build
  end

  # GET /order_items/1/edit
  def edit
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.find(params[:id])
  end

  # POST /order_items
  # POST /order_items.json
  def create
    
    #@profile = Profile.find(params[:profile_id])
    @order = Order.find(params[:order_id])
    @order_item = @order.order_items.build(params.require(:order_item).permit(:id))
    if @order_item.save
      redirect_to order_order_items_url(@order, @order_item), notice: "Items were successfully added."
    else
      render :action => "new"
    end
    
    #@order_item = OrderItem.new(order_item_params)

    #respond_to do |format|
      #if @order_item.save
        #format.html { redirect_to @order_item, notice: 'Order item was successfully created.' }
        #format.json { render :show, status: :created, location: @order_item }
      #else
        #format.html { render :new }
        #format.json { render json: @order_item.errors, status: :unprocessable_entity }
      #end
    #end
    
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    
    @order = Order.find(params[:order_id])
    @order_item = Order_item.find(params[:id])
    if @order_item.update_attributes(params.require(:order_item).permit(:id))
      redirect_to order_order_items_url(@order, @order_item)
    else
      render :action => "edit"
    end
    
    #respond_to do |format|
     # if @order_item.update(order_item_params)
      #  format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
       # format.json { render :show, status: :ok, location: @order_item }
      #else
       # format.html { render :edit }
        #format.json { render json: @order_item.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    
    @order = Order.find(params[:order_id])
    @order_item = Order_item.find(params[:id])
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_order_items_path(@order), notice: 'Order list was successfully destroyed.' }
      format.xml { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:menu_item_id, :order_id)
    end
end
