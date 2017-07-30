class EmotionsController < ApplicationController
  before_action :set_emotion, only: [:show, :edit, :update, :destroy]

  # GET /emotions
  # GET /emotions.json
  def index
    @emotions = Emotion.all
  end

  # GET /emotions/1
  # GET /emotions/1.json
  def show
  end

  # GET /emotions/new
  def new
    @emotion = Emotion.new
  end

  # GET /emotions/1/edit
  def edit
  end

  # POST /emotions
  # POST /emotions.json
  def create
    @emotion = Emotion.new(emotion_params)

    respond_to do |format|
      if @emotion.save
        format.html { redirect_to @emotion, notice: 'Emotion was successfully created.' }
        format.json { render :show, status: :created, location: @emotion }
      else
        format.html { render :new }
        format.json { render json: @emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emotions/1
  # PATCH/PUT /emotions/1.json
  def update
    respond_to do |format|
      if @emotion.update(emotion_params)
        format.html { redirect_to @emotion, notice: 'Emotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @emotion }
      else
        format.html { render :edit }
        format.json { render json: @emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emotions/1
  # DELETE /emotions/1.json
  def destroy
    @emotion.destroy
    respond_to do |format|
      format.html { redirect_to emotions_url, notice: 'Emotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def collect
  end

  def change
    respond_to do |format|
      if @user.emotion.update_attributes(current_hr: params[:currenthr])
        format.html { redirect_to collection_url, flash: { success: "Emotion was successfully updated." } }
        format.json { render :show, status: :ok, location: @emotion }

        ActionCable.server.broadcast "emotions_#{@user.id}", html: "<li><p>Current HR: #{@user.emotion.current_hr}</p></li>"
      else
        format.html { redirect_to collection_url, flash: { success: 'Failed to update' } }
        format.json { render json: @emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emotion
      @emotion = Emotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emotion_params
      params.require(:emotion).permit(:current_hr, :emotion_v, :emotion_a, :user_id)
    end

end
