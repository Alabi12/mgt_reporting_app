class ReportsController < ApplicationController
  before_action :authenticate_user!  # Ensure user is authenticated
  before_action :set_report, only: [:show, :update, :edit, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

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

  # POST /reports
  def create
    if current_user.nil?
      redirect_to new_user_session_path, alert: 'You must be logged in to create a report.'
      return
    end

    @report = current_user.reports.build(report_params)
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:date, :observation, :risk_level, :recommendation, :action_plan, :timelines, :members_on_duty)
  end
end
