class ApplicationController < ActionController::API
    rescue_from(ActiveRecord::RecordInvalid, {with: :unprocessable})

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
