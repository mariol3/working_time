class WorkDaysController < ApplicationController
  skip_before_filter :admin_section
  
  # GET /work_days
  # GET /work_days.json
  def index
    # Get all work days in the actual month
    currentTime = Time.now
    @user = current_user
    @work_days = @user.work_days.order("date").where(date: currentTime.at_beginning_of_month..currentTime.at_end_of_month)
    
    # Gets sum of all the work hours
    @work_days_total_hours = @work_days.inject(0.0){|sum, item| sum+item.work_hours} || 0
    @work_days_extra_hours = @work_days_total_hours - (@work_days.count * @user.daily_hours)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_days }
    end
  end

  # GET /work_days/1
  # GET /work_days/1.json
  def show
    @work_day = WorkDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_day }
    end
  end

  # GET /work_days/new
  # GET /work_days/new.json
  def new
    @work_day = WorkDay.new

    respond_to do |format|
      format.html
      format.json { render json: @work_day }
    end
  end

  # GET /work_days/1/edit
  def edit
    @work_day = WorkDay.find(params[:id])
  end

  # POST /work_days
  # POST /work_days.json
  def create
    user = current_user
    @work_day = user.work_days.create(params[:work_day]) 

    respond_to do |format|
      if @work_day.save
        flash[:notice] = 'Giornata di lavoro salvata con successo.'
        format.html { redirect_to action: 'index' }
        format.json { render json: @work_day, status: :created, location: @work_day }
      else
        format.html { render action: "new" }
        format.json { render json: @work_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_days/1
  # PUT /work_days/1.json
  def update
    @work_day = WorkDay.find(params[:id])

    respond_to do |format|
      if @work_day.update_attributes(params[:work_day])
        flash[:notice] = 'Giornata di lavoro salvata con successo.'
        format.html { redirect_to action: 'index' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_days/1
  # DELETE /work_days/1.json
  def destroy
    @work_day = WorkDay.find(params[:id])
    @work_day.destroy

    respond_to do |format|
      flash[:notice] = 'Giornata di lavoro rimossa con successo.'
      format.html { redirect_to work_days_url }
      format.json { head :no_content }
    end
  end
end
