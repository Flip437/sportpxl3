class PhotosController < ApplicationController
  layout "picto_edition_home", only: [:new, :show, :index, :edit]
  before_action :set_event, only: %I[index create destroy_all]
  before_action :set_edition, only: %I[index new create destroy_all update]
  before_action :set_photo, only: %I[update destroy]

  def index

    #IDS are not INTEGER
    
    #photo_ids = PhotoSearchService.new(@edition, params).fetch_ids
   # @photos = @edition.photos.where(id: photo_ids).paginate(page: params[:page], per_page: 30).order(created_at: :desc)
    @photos = @edition.photos.paginate(page: params[:page], per_page: 30).order(created_at: :desc)
  end

  # GET /photos/new
  def new
    @photo = Photo.new
    @photosCount = @edition.photos.all.count

    #@photosIdentifierCount = @edition.photos.photos_identifier.count
    #@photosNonIdentifierCount = @edition.photos.photos_no_identifier.count 
  end

  def add_edition_photos
    images_params[:images].each do |img|
      photo = Photo.new
      photo.image.attach(img)
      photo.edition_id = images_params[:edition_id]
      photo.save
      flash[:photo_errors] = photo.errors.messages if !photo.save
    end

    if !flash[:photo_errors]
      redirect_to event_edition_photos_path, notice: 'Vos photos ont été enregistrées'
    else
      redirect_to event_edition_photos_path, alert: "Il y a eu #{flash[:photo_errors].count} erreurs lors de l'enregsitrement"
    end
  end


  def create
    #@photo = @edition.photos.create! photo_params crate multiple photos

		@photo = Photo.new(photo_params)
    #@photo.edition_id = params[:edition_id]
	  if @photo.save
      redirect_to event_edition_photos_path, notice: 'Vos photos ont été ajoutées.'
    else
      redirect_to event_edition_photos_path, alert: 'Une erreur est survenue'
    end
  end




  def update
    @success = @photo.update(photo_params)
    respond_to do |format|
      format.js
      if @success
        format.html { redirect_to event_edition_photos_path, notice: 'Vos photos ont été modifiées' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :index }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @photo.destroy
      redirect_to event_edition_photos_path(event_id: @photo.edition.event_id, edition_id: @photo.edition_id), notice: 'Photo supprimée.'
    else
      redirect_to event_edition_photos_path(event_id: @photo.edition.event_id, edition_id: @photo.edition_id), alert: "La photo n'a pas pu être supprimée"
    end
  end

  def destroy_all
    @photos = @edition.photos.where(id: params[:photo_ids])
    @photos.destroy_all
    redirect_to event_edition_photos_path(event_id: @event.id, edition_id: @edition.id), notice: "Les photos ont bien été supprimées."
  end#Barkoxe$1As

  private

  def set_event
    @event = Event.find params[:event_id]
  end

  def set_edition
    @edition = Edition.find params[:edition_id]
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(
      :id,
      :bib,
      :direct_image_url,
      :edition_id,
      image: []
    )
  end

  def images_params
    params.permit(:edition_id, images: [])
  end

end
