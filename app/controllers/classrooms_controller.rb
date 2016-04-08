class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /classrooms
  def index

    if params[:search]
      @classrooms = Classroom.search(params[:search]).order("created_at DESC")
    else
      @classrooms = Classroom.order("created_at DESC")
    end
  end

  # GET /classrooms/1
  def show

  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
    @students = Student.all
    @courses = Course.all
  end

  # GET /classrooms/1/edit
  def edit
    @students = Student.all
    @courses = Course.all
  end

  # POST /classrooms
  def create
    @classroom = Classroom.new(classroom_params)

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: 'classroom was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /classrooms/1
  def update
    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to @classroom, notice: 'classroom was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'classroom was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def classroom_params
    params.require(:classroom).permit(:student_id, :course_id)
  end
end