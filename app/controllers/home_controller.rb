class HomeController < ApplicationController
  def home
    @courses = Course.all
    @classrooms = Classroom.all
    @students = Student.all
  end
end
