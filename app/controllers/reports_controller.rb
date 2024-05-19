class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:show, :update, :edit, :destroy]

  skip_before_action :set_report, only: %i[index new create summary] # Add summary here

  # GET /reports
  def index
    @reports = Report.all
  end

  # GET /reports/1
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  def attendance_input
    @group = params[:group]
  end

  def submit_attendance
    group = params[:group]
    attendance = params[:attendance].to_i
    # Handle the attendance submission logic here

    # Redirect back to the report form or wherever appropriate
    redirect_to new_report_path, notice: "Attendance for #{group} recorded: #{attendance}"
  end

  # New action to display the summary
  def summary
    @group_attendance = Report.group(:group).sum(:attendance)
    @date_group_attendance = calculate_date_group_attendance
  end

  def calculate_date_group_attendance
    date_group_attendance = {}

    # Query the database to retrieve all reports
    reports = Report.all

    # Iterate through each report to populate the date_group_attendance hash
    reports.each do |report|
      date = report.date.strftime('%Y-%m-%d') # Format date as string
      group = report.group
      attendance = report.attendance

      # Check if the date already exists in the hash, if not, initialize it
      date_group_attendance[date] ||= {}

      # Check if the group already exists for this date, if not, initialize it
      date_group_attendance[date][group] ||= 0

      # Add the attendance count to the corresponding group for the date
      date_group_attendance[date][group] += attendance
    end
    date_group_attendance
  end

  # POST /reports
  def create
    if current_user.nil?
      redirect_to new_user_session_path, alert: 'You must be logged in to create a report.'
      return
    end
  
    @report = current_user.reports.build(report_params)
    @report.status = params[:status] # Assign the selected status
    if @report.save
      redirect_to @report, notice: "Report was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: "Report was successfully deleted."
  end


  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to @report, notice: 'Report was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: "Report was successfully deleted."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params

    params.require(:report).permit(:date, :observation, :status, :recommendation, :action_plan, :members_on_duty)

    params.require(:report).permit(:date, :observation, :recommendation, :action_plan, :members_on_duty, :group, :attendance)
    
  end
end
