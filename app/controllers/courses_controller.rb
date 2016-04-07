class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  def index

    if params[:search]
      @courses = Course.search(params[:search]).order("created_at DESC")
    else
      @courses = Course.order("created_at DESC")
    end

  end

  # GET /courses/1
  def show

  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @courses = Course.new(course_params)

    respond_to do |format|
      if @courses.save
        format.html { redirect_to @course, notice: 'course was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /courses/1
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'course was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'course was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:name, :description)
  end
end