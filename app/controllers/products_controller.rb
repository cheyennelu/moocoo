class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :home ]
  before_action :set_product, only: [:show, :update]

  def home
    @products = Product.all
  end

  def index
    @brands = Brand.all
    @products = Product.all
    @price = Product.order('price_cents DESC')
  end

  def show
    @order = Order.new
    product = Product.find(params[:id])
    @reviews = Review.where(product: product).reverse
    @review = Review.new
  end

  def update
    uploaded_photos = params[:product][:photos]
    @product.photos.attach(uploaded_photos)
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
