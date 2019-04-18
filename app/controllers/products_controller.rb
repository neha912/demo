class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.csv {
         send_data @products.to_csv(['name','price','description'])
      }
    end
   
  end

  def show
  end

  
  def new
    @product = Product.new
  end

 
  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product was created successfully"
      redirect_to @product
    else
      render :new 
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
      flash[:success] = "Product was successfully updated"
    else
      render :edit
    end
  end


  def destroy
    @product.destroy
    flash[:notice] ='Product was successfully destroyed.' 
    redirect_to products_url
  end


  def import
    Product.import(params[:file])
    redirect_to products_url, notice: "Product Uploaded successfully"
   end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
