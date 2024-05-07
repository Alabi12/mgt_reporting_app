class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
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
    @report = Report.new(report_params)

    if @report.save
      redirect_to @report, notice: "Report was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to @report, notice: "Report was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
    redirect_to reports_url, notice: "Report was successfully destroyed."
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:date, :observation, :risk_level, :recommendation, :action_plan, :timelines, :members_on_duty)
    end

    def authorize_user!
      unless current_user.admin? || (@report && @report.user == current_user)
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to @report || root_path
      end
    end
end
