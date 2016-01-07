class SubjectsController < ApplicationController
 
  layout "admin"

  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({name: 'Default'})
    @subject_count = Subject.count + 1
  end

  def create

    # New Object
    @subject = Subject.new(subject_params)

    # Save Object
    if @subject.save
      # If save success, redirect to index
      flash[:notice] = "Subject Created Succesfully."
      redirect_to(action: 'index')
    else
      # If save fails, redisplay form
      @subject_count = Subject.count + 1
      render('new')
    end

  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # Find Object
    @subject = Subject.find(params[:id])

    # update Object
    if @subject.update_attributes(subject_params)
      # If update success, redirect to index
      flash[:notice] = "Subject Updated Succesfully."
      redirect_to(action: 'show', id: @subject.id)
    else
      # If update fails, redisplay form
      @subject_count = Subject.count 
      render('edit')
    end

  end

  def delete
    @subject = Subject.find(params[:id])

  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' Destroyed Succesfully."
    redirect_to(action: 'index')
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible, :created_at)
    end

end
