# app/controllers/users/articles_controller.rb
module Users
  class ArticlesController < ApplicationController
    before_action :authenticate_user! # ログインユーザーのみを許可する

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
        @article = Article.new(article_params)
        if @article.save
          redirect_to users_article_path(@article), notice: 'Article was successfully created.'
        else
          render :new
        end
      end
      
    
      def edit
        @article = Article.find(params[:id])
      end
    
      def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          redirect_to users_article_path(@article)
        else
          render :edit
        end
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to users_articles_path, notice: 'Article was successfully destroyed.'
      end
      
      
    
      private
    
      def article_params
        params.require(:article).permit(:title, :content, :image_url, :image_file)
      end
    end
  end
  