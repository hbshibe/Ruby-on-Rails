class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update, :show, :destroy]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:success] = "スケジュールが作成されました。"
      redirect_to @schedule
    else
      flash[:danger] = "スケジュール作成に失敗しました。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      flash[:success] = "スケジュールが更新されました。"
      redirect_to @schedule
    else
      flash[:danger] = "スケジュール更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    # @schedule.destroy!
    flash[:success] = 'スケジュールが削除されました。'
    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
  end
end
