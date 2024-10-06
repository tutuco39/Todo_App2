class BoardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    @board.user = current_user
    if @board.save
      redirect_to boards_path,
                  notice: 'Boardを作成しました'
    else
      flash.now[:error] = '作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @boards = Board.all
  end

  def show
    redirect_to board_tasks_path(@board)
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to boards_path,
      notice: 'Boardを更新しました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to boards_path, notice: 'Boardを削除しました'
  end

  private

  def board_params
    params.require(:board).permit(
      :name, :description
      )
  end

end
