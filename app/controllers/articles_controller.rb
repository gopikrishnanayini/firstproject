class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		respond_to do |format| 
			if @article.save
				format.html { redirect_to @article, notice: 'Article was successfully created.'}
				format.json { render json: show, :status => :created, location: @article }
			else
				format.html { render action: 'new'}
				format.json { render json: @article.errors, :status => :unprocessable_entity }
			end
		end
	end
	def show
		@article = Article.find(params[:id])
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		respond_to do |format|
			if @article.update(article_params)
				format.html { redirect_to @article, notice: 'Article was successfully updated.' }
				format.json { render json: show, status: :updated, location: @article }
			else
			format.html { render action: 'update'}
			format.json { render json: @article.errors, :status => :unprocessable_entity }
		end
	   end
    end
  def destroy
  	@article = Article.find(params[:id])
  	@article.destroy
  	redirect_to s_path 
  end
   private
   def article_params
	params.require(:article).permit(:name, :age, :email, :resume)
   end
end