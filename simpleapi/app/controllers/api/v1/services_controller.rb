class Api::V1::ServicesController < ApplicationController
    def index
        @services = Service.all
        render json: @services
    end

    def show
        @services = Service.find(params[:id])
        render json: @services
    end

    def create
        @services = Service.new(service_params)
        if @services.save
            render json: @services
        else
            render error: { error: 'Something got jacked up in the process. Could not create the service' }, status: 400
        end
    end

    def update
        if @services
            @services.update(service_params)
            render json: {message: 'Service has been successfully updated', data: @services}, status: 200
        else
            render error: { error: 'Something got jacked up in the process. Could not update the service' }, status: 400
            render error: { error: 'Something got jacked up in the process. Could not update the service' }, status: 400
        end
    end

    private 
    def service_params
        params.permit(:payload, :body)
    end
end
