class JournalsController < ApplicationController
  before_action :set_journal, only: %i[ show edit update destroy ]

  def index
    @journals = Journal.all
  end

  def show
    set_journal
  end

  def new
    @journal = Journal.new
  end

  def edit
  end

  def create
    @journal = Journal.new(journal_params)
    respond_to do |format|
      if @journal.save
        format.html { redirect_to @journal, notice: "Journal was successfully created." }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: "Journal was successfully updated." }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to journals_url, notice: "Journal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_journal
      @journal = Journal.find(params[:id])
    end

    def journal_params
      params.require(:journal).permit(:title, :description, :user_id)
    end
end
