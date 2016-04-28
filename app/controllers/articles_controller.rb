class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "user", password: "mkr5htgi",
		except: [:index, :show]


	def new
		@article = Article.new
		@articles = Article.all
	end

	def login
		
	end

	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params)

		if @article.save
		redirect_to @article
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

	def edit
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def delete
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end

end
