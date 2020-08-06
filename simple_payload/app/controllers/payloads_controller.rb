class PayloadsController < ApplicationController
  before_action :set_payload, only: [:show, :update, :destroy]

  # GET /payloads
  def index
    @payloads = Payload.all

    render json: @payloads
  end

  # GET /payloads/1
  def show
    render json: @payload
  end

  # POST /payloads
  def create
    @payload = Payload.new(payload_params)

    if @payload.save
      render json: @payload, status: :created, location: @payload
    else
      render json: @payload.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payloads/1
  def update
    if @payload.update(payload_params)
      render json: @payload
    else
      render json: @payload.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payloads/1
  def destroy
    @payload.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payload
      @payload = Payload.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payload_params
      params.require(:payload).permit(:message)
    end
end
