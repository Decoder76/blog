class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_params, only: [:show, :edit, :update, :destroy]
      def index
        @articles = Article.all
        @articles = Article.order(:title).page params[:page]
      end

      def show
        #@article = Article.find(params[:id])
      end

      def new
        @article = Article.new
      end

      def create
        @article = Article.new(article_params)

        if @article.save
          redirect_to @article
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
        #@article = Article.find(params[:id])
      end

      def update
        #@article = Article.find(params[:id])

        if @article.update(article_params)
          redirect_to @article
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @article.destroy                    
        redirect_to root_path, status: :see_other
      end

  private
          def article_params
          params.require(:article).permit(:title, :content)
          end

          def set_params
          # debugger
          @article=Article.find(params[:id])
          end
end
