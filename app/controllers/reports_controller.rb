class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :edit]
  # before_action :authorize_user!, only: [:edit, :update, :destroy]

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
    @report= current_user.reports.build(report_params)
    if @report.save
      redirect_to @report, notice: "Report was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_url, notice: "Report was successfully deleted."
  end
  
  # PATCH/PUT /reports/1
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end


    def report_params
      params.require(:report).permit(:date, :observation, :risk_level, :recommendation, :action_plan, :timelines, :members_on_duty)
    end
end
