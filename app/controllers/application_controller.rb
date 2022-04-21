class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordNotSaved, with: :record_not_saved
    rescue_from ActiveRecord::RecordNotUnique, with: :record_not_updated

    before_action :get_article, only: [:show, :edit, :update, :destroy]

    private
        def get_article
            @article = Article.find(params[:id])
        end

        def record_not_found
            render plain: "404: Could not find record by ID", status:404
        end

        def record_not_saved
            render plain: "409: Create Error!", status:409
        end

        def record_not_updated
            render plain: "409: Update Error!", status:409
        end
end
