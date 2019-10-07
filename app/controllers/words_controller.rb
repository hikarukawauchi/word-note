class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new(content: 'enter word')
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      flash[:success] = '単語が正常に投稿されました'
      redirect_to @word
    else
      flash.now[:danger] = '単語が投稿されませんでした'
      render :new
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])

    if @word.update(word_params)
      flash[:success] = '単語は正常に更新されました'
      redirect_to @word
    else
      flash.now[:danger] = '単語は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    flash[:success] = 'Word は正常に削除されました'
    redirect_to words_url
  end

  private

  # Strong Parameter
  def word_params
    params.require(:word).permit(:content)
  end
end
