class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:update, :basics, :description, :address, :price, :photos, :calendar, :bankaccount, :publish]

  def index
  end

  def show
  end

  def new
    # 登録するリスティングオブジェクトの作成(newのようなもの)
    # @user = current_user
    #@listing = current_user.listings.new
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to manage_listing_basics_path(@listing),notice: "リスティングを作成・保存しました"
    else
      redirect_to new_listing_path,notice: "リスティングを作成・保存出来ませんでした"
    end
  end

  def edit
  end

  def update
      if @listing.update(listing_params)
        redirect_back( fallback_location: (request.referer || root_path), notice: "更新しました")
    end
  end

  def basics
  end

  def description
  end
  def address
  end
  def price
  end
  def photos
    @photo = Photo.new
  end
  def calendar
  end
  def bankaccount
  end
  def publish
  end

  private
  def listing_params
    params.require(:listing).permit(:home_type,:pet_type,:pet_size,:breeding_years,:price_pernight)
  end

  # リスティング表示の前に行う処理(view側でどのIDの内容を表示するか決めるために必要)
  def set_listing
    @listing = Listing.find(params[:id])
  end

end
