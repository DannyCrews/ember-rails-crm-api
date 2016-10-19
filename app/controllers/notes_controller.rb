class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all

    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    note_klass = params[:data][:type].underscore.classify.safe_constantize
    @note = note_klass.new(note_params)
    @note.topic = relationship_params(:topic)
    @note.contact = relationship_params(:contact)

    if @note.save
      render json: @note, status: :created, location: note_url(@note)
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      @note.topic = relationship_params(:topic) if relationship_params(:topic)
      @note.contact = relationship_params(:contact) relationship_params(:contact)

      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:data).require(:attributes).permit(
      :title, :description
      )
    end
end
