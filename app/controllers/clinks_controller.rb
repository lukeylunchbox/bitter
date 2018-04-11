class ClinksController < ApplicationController
  before_action :set_clink, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /clinks
  # GET /clinks.json
  def index
    @clinks = Clink.all.order("created_at DESC")
    @clink = Clink.new
  end

  # GET /clinks/1
  # GET /clinks/1.json
  def show
  end

  # GET /clinks/new
  def new
    @clink = current_user.clinks.build
  end

  # GET /clinks/1/edit
  def edit
  end

  # POST /clinks
  # POST /clinks.json
  def create
    @clink = current_user.clinks.build(clink_params)

    respond_to do |format|
      if @clink.save
        format.html { redirect_to root_path, notice: 'Clink was successfully created.' }
        format.json { render :show, status: :created, location: @clink }
      else
        format.html { render :new }
        format.json { render json: @clink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinks/1
  # PATCH/PUT /clinks/1.json
  def update
    respond_to do |format|
      if @clink.update(clink_params)
        format.html { redirect_to @clink, notice: 'Clink was successfully updated.' }
        format.json { render :show, status: :ok, location: @clink }
      else
        format.html { render :edit }
        format.json { render json: @clink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinks/1
  # DELETE /clinks/1.json
  def destroy
    @clink.destroy
    respond_to do |format|
      format.html { redirect_to clinks_url, notice: 'Clink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clink
      @clink = Clink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clink_params
      params.require(:clink).permit(:clink)
    end
end
