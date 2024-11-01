class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
    # @post = Post.find(params[:id])
    # @encrypted_id = @post.encrypted_id_string
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(encrypted_id_string: params[:id])
  end

  def create
    @post = Post.new(post_params)
  
    respond_to do |format|
      if @post.save  
        format.html { redirect_to @post, notice: "El post se ha creado exitosamente." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { 
          flash.now[:alert] = "Hubo un error al crear el post. Por favor, revisa los errores." 
          render :new, status: :unprocessable_entity 
        }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Union member was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = if params[:id].to_i.to_s == params[:id]
                Post.find(params[:id])
              else
                Post.find_by!(encrypted_id_string: params[:id])
              end
    end

    def post_params
      params.require(:post).permit(:title, :body, :encrypted_id_string)
    end
end
