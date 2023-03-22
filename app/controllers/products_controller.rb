class ProductsController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_category

  def index
    @products = Category.products
  end

  def new
    @product = Category.products.build
  end

  def edit
  end

  def show
  end

  def create
    @product = Category.products.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to category_product_path(@category, @product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to category_product_path(@category, @product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :code, :stock, :category_id)
  end

end
