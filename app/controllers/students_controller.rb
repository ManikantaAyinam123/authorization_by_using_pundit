class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
    authorize @students
  end

  def show
    # No additional logic needed here for now
  end

  def new
    @student = Student.new
    authorize @student
  end

  def create
    @student = Student.new(student_params)
    authorize @student

    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
    authorize @student
    # No additional logic needed here for now
  end

  def update
    authorize @student

    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    authorize @student
    @student.destroy
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :branch)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
