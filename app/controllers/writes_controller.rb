class WritesController < ApplicationController
  before_action :set_write, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /writes
  # GET /writes.json
  def index
    @writes = Write.all
  end

  # GET /writes/1
  # GET /writes/1.json
  def show
    @comments = @write.comments
    @comment = Comment.new
  end

  # GET /writes/new
  def new
    @write = Write.new
  end

  # GET /writes/1/edit
  def edit
  end

  # POST /writes
  # POST /writes.json
  def create
    @write = Write.new(write_params.merge(user: current_user))

    respond_to do |format|
      if @write.save
        format.html { redirect_to @write, notice: 'Write was successfully created.' }
        format.json { render :show, status: :created, location: @write }
      else
        format.html { render :new }
        format.json { render json: @write.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /writes/1
  # PATCH/PUT /writes/1.json
  def update
    respond_to do |format|
      if @write.update(write_params)
        format.html { redirect_to @write, notice: 'Write was successfully updated.' }
        format.json { render :show, status: :ok, location: @write }
      else
        format.html { render :edit }
        format.json { render json: @write.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /writes/1
  # DELETE /writes/1.json
  def destroyed
    @write.destroy
    respond_to do |format|
      format.html { redirect_to writes_url, notice: 'Write was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_write
      @write = Write.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def write_params
      params.require(:write).permit(:title, :post, :publish, :user_id)
    end
end
