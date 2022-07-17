class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
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

    private
        def article_params
            params.require(:article).permit(:title, :content)
        end
end
