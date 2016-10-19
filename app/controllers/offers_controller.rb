class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :update, :destroy]

  # GET /offers
  def index
    @offers = Offer.all

    render json: @offers
  end

  # GET /offers/1
  def show
    render json: @offer
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)
    @offer.project = relationship_params[:project]
    @offer.contacts = relationship_params[:contacts] || []
    @offer.tasks = relationship_params[:tasks] || []

    if @offer.save
      render json: @offer, status: :created, location: @offer
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      @offer.project = relationship_params[:project] if relationship_params[:project]
      @offer.contacts = relationship_params[:contacts] if relationship_params[:contacts]
      @offer.tasks = relationship_params[:tasks] if relationship_params[:tasks]

      render json: @offer
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /offers/1
  def destroy
    @offer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def offer_params
      params.require(:data).require(:attributes).permit(:name, :price, :status, :valid_until)
    end
end
