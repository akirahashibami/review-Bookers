class BooksController < ApplicationController
  def new
  end

  def create
  	@book = Book.new(book_params)
  	# index.htmlに変数を渡すので@bookとなる
  	# もし保存に成功したならば
  	if @book.save
  		# リダイレクトはshowへ notice: メソッドでリダイレクト先にメッセージを表示
  		redirect_to book_path(@book.id), notice: "successfully created"
  	else #そうでなければ
  		@books = Book.all #bookのデータを全部引っ張って
  		render :index #renderはアクションを介さず通す
  	end
  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  # createと同じ
  def update
  	@book = Book.find(params[:id])
	if @book.update(book_params)
  		redirect_to book_path(@book.id), notice: "successfully update"
  	else
  		render :edit
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path, notice: "succesfull delete"
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
