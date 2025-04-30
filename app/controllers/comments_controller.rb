class CommentsController < ApplicationController
 # http_basic_authenticate_with name: "admin", password: "admin", only: :destroy
 before_action :set_params

    def create
      #@comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
    end
    
    def destroy
      #@comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end

    private
      def set_params
        @article = Article.find(params[:article_id])
      end
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end

end