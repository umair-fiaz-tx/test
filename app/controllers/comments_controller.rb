class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end


  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    # @article.user = current_user

    #if
    @comment.save
    #redirect_to articles_path
    redirect_to article_path(@comment.article)

    # ArticleMailer.signup_confirmation.deliver
    #else
    # render 'new'
    #end

  end

  def edit
  end
end
def comment_params
  params.require(:comment).permit(:author_name, :body)
end