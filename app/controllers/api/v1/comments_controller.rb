class Api::V1::CommentsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.new(comment_params)
    @comment.restaurant = @restaurant
    unless @comment.save
      render_error
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content, :image)
  end

  def render_error
    render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
  end
end
