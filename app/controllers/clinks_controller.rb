class ClinksController < ApplicationController
  before_action :set_clink, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @clinks = Clink.all.order("created_at DESC")
    @clink = Clink.new
  end

  def show
  end

  def new
    @clink = current_user.clinks.build
  end

  def edit
  end

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

  def destroy
    @clink.destroy
    respond_to do |format|
      format.html { redirect_to clinks_url, notice: 'Clink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_clink
      @clink = Clink.find(params[:id])
    end

    def clink_params
      params.require(:clink).permit(:clink)
    end
end
