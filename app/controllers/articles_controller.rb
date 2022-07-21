class ArticlesController < ApplicationController
    before_action :set_article, only: %i[ show edit update destroy ]

    def index
        @articles = Article.all
    end

    def show

    end

    def new
        @article = Article.new
    end

    def create
        #インスタンスを model から作成
        @article = Article.new( article_params )
        # インスタンスを DB に保存する
        if @article.save
            redirect_to @article, notice: "Article was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit

    end

    def update

        if @article.update(article_params)
            redirect_to @article, notice: "Article was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            redirect_to @article, notice: "Article was successfully destroyed."
        else
            render :edit, status: :unprocessable_entity
        end

    end

    private
        def set_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.require(:article).permit(:title, :content)
        end
end
