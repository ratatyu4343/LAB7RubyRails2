class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    if params[:name] != ""
    @student = Student.new
    @street_id = Street.where(name: params[:street]).to_a
    if @street_id.length() == 0
      @street_id = Street.create({name: params[:street]}).id
    else
      @street_id = @street_id[0].id
    end
    @house_id = House.where(number: params[:house]).where(street_id: @street_id).to_a
    if @house_id.length() == 0
      @house_id = House.create({number: params[:house], street_id:@street_id}).id
    else
      @house_id = @house_id[0].id
    end
    @student = Student.create({name: params[:student][:name],
                               apartment:params[:student][:apartment],
                               house_id:@house_id})
    if @student.errors.empty?
      redirect_to @student
    else
      render "new"
    end
    else
      render "new"
    end
  end

  def show
    @student = Student.find(params[:id])
    @house = House.where(id: @student.house_id).to_a[0]
    @street = Street.where(id: @house.street_id).to_a[0]
  end

  def edit
    @student = Student.find(params[:id])
    @house = House.where(id: @student.house_id).to_a[0]
    @street = Street.where(id: @house.street_id).to_a[0]
  end

  def update
    if params[:name] != ""
    @street = Street.where(name: params[:street]).to_a
    if @street.length == 0
      @street = [Street.create({name: params[:street]})]
    end
    @house = House.where(number: params[:house]).where(street_id: @street[0].id)
    if @house.length == 0
      @house = [House.create({number: params[:house], street_id:@street[0].id})]
    end
    @student = Student.find(params[:id])
    @student.update({name: params[:student][:name],
                     apartment:params[:student][:apartment],
                     house_id:@house[0].id})
    if @student.errors.empty?
      redirect_to @student
    else
      render "edit"
    end
    else
      render "edit"
    end
  end

  def index
    @students = Student.all
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end


end
