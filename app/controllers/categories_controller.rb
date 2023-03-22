class CategoriesController < ApplicationController
  # GET /categories or /categories.json
  def index
    @user = current_user
    @categories = current_user.categories.includes(:payments).order(id: :desc)
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  def most_recent
    @user = current_user
    @categories = Category.all
  end

  def most_ancient
    @user = current_user
    @categories = Category.all
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    add_category = current_user.categories.new(category_params)
    if add_category.save
      redirect_to categories_path, notice: 'Category was successfully added'
    else
      render :new, alert: 'Failed to add category'
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @user = current_user
    @category = Category.find(params[:id])

    if @category.destroy
      redirect_to categories_path, notice: 'Category was successfully deleted'
    else
      render :index, alert: 'Failed to delete category'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
