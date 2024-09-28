class BoardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @board = current_user.boards.build
  end

  def create
    @board = Board.new(board_params)
    # if @board.save
    #   redirect_to board_path(@board),
    #               notice: '保存できました'
    # else
    #   flash.now[:error] = '保存に失敗しました'
    #   render :new
    # end
  end

  def index
  end

end
