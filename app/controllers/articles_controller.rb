class ArticlesController < ApplicationController
    def index
        @article = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(allowed_params)

        if @article.save
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(allowed_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    private

    def allowed_params
      params.require(:article).permit(:title, :body)
    end
    
end
