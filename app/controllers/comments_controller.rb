class CommentsController < ApplicationController

  def create
        @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to customer_url(@comment.customer_id)
    else
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    # @commentがdestroyされる前に、commentが誰のものかを変数に保存する
    customer_id = @comment.customer_id
    @comment.destroy
    # さっき保存したcustomer_idをここで使う
    redirect_to customer_url(customer_id)
  end

  private

    def comment_params
      params.require(:comment) .permit(:body, :customer_id)
    end

end
