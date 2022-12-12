class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  
  # GET /lists or /lists.json
  def index
    @lists = List.all
    @list = List.new
    @start_time = Time.now  
    @end_time = Time.now + 5.days
    @deadline =@end_time.strftime("%d %B %Y")

    @remaining_time = TimeDifference.between(@start_time, @end_time).humanize
  # @diff =@object.updated_at.to_time.to_i - @object.created_at.to_time.to_i
  # @hour = "#{diff / 3600}:#{(diff % 3600) / 60}"
end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to root_url, notice: "List was successfully created." }
        format.json { render :lists, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to root_url, notice: "List was successfully updated." }
        format.json { render :lists, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:description, :completed, :who, :deadline)
    end
end
