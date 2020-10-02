class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :new]

  def index

    @search  = Article.search(params[:q])
    @articles = @search.result
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10)
    #  @articles = Article.page params[:page]
  end

  def new
    puts 'here'
    @article = Article.new
  end
  def edit
     @article = current_user.articles.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to articles_path
      # ArticleMailer.signup_confirmation.deliver
    else
      render 'new'
    end

  end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      respond_to do|format|
        format.html{ redirect_to articles_url }
        format.js
      end
    end


  private
  def article_params
    params.require(:article).permit(:title, :text, :avatar)
  end
end
