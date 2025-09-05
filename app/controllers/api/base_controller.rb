# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    rescue_from Exception, with: :error500
    rescue_from ActiveRecord::RecordNotFound, with: :error404

    def error500(exception)
      logger.error("#{exception.message}\n#{params.to_unsafe_h}\n#{exception.backtrace.join('\n')}")
      render json: {}, status: :internal_server_error
    end

    def error404
      render json: {}, status: :not_found
    end
  end
end
