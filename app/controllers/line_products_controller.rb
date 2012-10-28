class LineProductsController < ApplicationController
  # GET /line_products
  # GET /line_products.json
  skip_before_filter :authorize_admin, :only => [:create, :update, :destroy]
  skip_before_filter :authorize
  def index
    @line_products = LineProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_products }
    end
  end

  # GET /line_products/1
  # GET /line_products/1.json
  def show
    @line_product = LineProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_product }
    end
  end

  # GET /line_products/new
  # GET /line_products/new.json
  def new
    @line_product = LineProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_product }
    end
  end

  # GET /line_products/1/edit
  def edit
    @line_product = LineProduct.find(params[:id])
  end

  # POST /line_products
  # POST /line_products.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    #@line_product = @cart.line_products.build(:product => product, :quantity =>1)
    @line_product = @cart.add_product(product.id)

    respond_to do |format|
      if @line_product.save
        format.html { redirect_to root_url }
        format.json { render json: @line_product, status: :created, location: @line_product }
      else
        format.html { render action: "new" }
        format.json { render json: @line_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_products/1
  # PUT /line_products/1.json
  def update
    @line_product = LineProduct.find(params[:id])

    respond_to do |format|
      if @line_product.update_attributes(params[:line_product])
        format.html { redirect_to @line_product, notice: 'Line product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_products/1
  # DELETE /line_products/1.json
  def destroy
    @line_product = LineProduct.find(params[:id])
    @line_product.destroy

    respond_to do |format|
      format.html { redirect_to line_products_url }
      format.json { head :no_content }
    end
  end
end
