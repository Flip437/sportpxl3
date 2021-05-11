class DetectBibJob < ActiveJob::Base
  queue_as :normal

  def perform(id)
    photo = Photo.find(id)
    vision = ::Google::Cloud::Vision.new project: "kapp10-freshstart-ocr", keyfile: JSON.parse(ENV["GOOGLE_CLOUD_KEYFILE"])
    image = vision.image(photo.direct_image_url)
    annotation = vision.annotate(image, text: true)

    return unless annotation.text.present?
    bib = annotation.text.words.select { |w| w.text.match(/^\d+$/) }.last.text
    photo.bib = bib
    photo.save!
  end
end
