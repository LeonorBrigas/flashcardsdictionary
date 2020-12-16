class FlashcardsController < ApplicationController
  before_action :set_params, only: [:answer, :edit, :update, :show, :destroy]

  def home
  end

  def index
    @flashcards = Flashcard.all
  end

  def show
    # @flashcard = Flashcard.find(params[:id])
  end

  def next
    current_id = params[:id]
    next_id = Flashcard.where("id > ?", current_id.to_i).first
    if next_id === nil
      next_id = Flashcard.first
      redirect_to controller: :flashcards, action: :show, id: next_id
      # redirect_to flashcards_path(@flashcard(params[:next_id]))
      return
    end
      redirect_to controller: :flashcards, action: :show, id: next_id
  end

  def previous
    current_id = params[:id]
    previous_id = Flashcard.where("id < ?", current_id.to_i).last
    if previous_id === nil
      previous_id = Flashcard.last
      redirect_to controller: :flashcards, action: :show, id: previous_id
    return
  end
    redirect_to controller: :flashcards, action: :show, id: previous_id
  end

  def answer
  end

  def new
    @flashcard = Flashcard.new
  end

  def create
    @flashcard = Flashcard.new(f_params)
    if @flashcard.save
      redirect_to flashcard_path(@flashcard)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flashcard.update(f_params)
      redirect_to flashcard_path(@flashcard)
    else
      render :edit
    end
  end

  def destroy
    @flashcard.destroy
    redirect_to flashcards_path
  end

  # def match(params[:guess])
  #   count = 0
  #   # User inputs a possible definition (guess in textarea)
  #   # Program checks if input matches the word definition
  #   if guess === @flashcard.answer
  #     # If yes, point counter increases and flashcard is set as know by the user, etc.
  #     # i am missing a count variable in the flashcards??
  #     @flashcard.count += 1
  #   end
  # end

  private
  def f_params
    params.require(:flashcard).permit(:prompt, :answer)
  end

  def set_params
    @flashcard = Flashcard.find(params[:id])
  end
end
