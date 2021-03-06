class ProductsController < ApplicationController
	def index
        
       if params[:productLine]
        
		@products = Product.where("\"productLine\" = ?", params[:productLine])
        @title = "Showing category '#{params[:productLine]}'"
           
        elsif params[:search]
        @products = Product.search(params[:search])
        @title = "Your search for '#{params[:search]}' returned #{@products.count} result(s)"
        else
           @products = Product.all
           @title =  "Showing all products"
        end
        @cart = current_cart
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find(params[:id])
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to @product 
		else
			render 'new'
		end
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to @product 
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to products_path
	end
	private
	def product_params
		params.require(:product).permit(:productCode, :productName, 
			:productLine, :productScale, :productVendor, :productDescription, 
			:quantityInStock, :buyPrice, :MSRP)
	end
end