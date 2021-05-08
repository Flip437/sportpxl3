# == Schema Information
#
# Table name: photos
#
#  id                 :uuid             not null, primary key
#  race_id            :uuid
#  suggested_bibs     :string
#  bib                :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  edition_id         :integer
#  direct_image_url   :string           not null
#  processed          :boolean          default(FALSE)
#

class Photo < ApplicationRecord
  belongs_to :edition
  belongs_to :race

  #PAPERCLIP
  #has_attached_file :image
  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  #PAPERCLIP


  has_one_attached :image

  #validates :image_file_name, uniqueness: { scope: :edition_id }

  DIRECT_IMAGE_URL_FORMAT = %r{\Ahttps:\/\/#{ENV['S3_BUCKET']}\.#{ENV['AWS_S3_HOST_NAME_REGION']}\.amazonaws\.com\/(?<path>uploads\/(?<filename>.+))\z}.freeze
  #https://kapp10.s3-eu-west-1.amazonaws.com/uploads/Decath-Trail-2018_26-05-2018_200.jpg

  #validates :direct_image_url, allow_blank: true, format: { with: DIRECT_IMAGE_URL_FORMAT }
  puts "IN SET IMAGE ATTRIBUTESSSSSSSSSSSSSSSSSSSSSS"
  #before_create :set_image_attributes
  #after_create :queue_processing

  # Override
  # Store an unescaped version of the escaped URL that Amazon returns from direct upload.
  def direct_image_url=(escaped_url)
    write_attribute(:direct_image_url, (CGI.unescape(escaped_url) rescue ''))
  end

  # Determines if file requires post-processing (image resizing, etc)
  def post_process_required?
    %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}.match(image_content_type).present?
  end

  def runner
    return :not_paired if bib.blank?
    edition.results.find_by(bib: bib) || :invalid_bib
  end

  def runner_alert
    return "<p id='#{id}_runner'></p>".html_safe if runner == :not_paired
    return "<p id='#{id}_runner' class='alert alert-danger'>Mauvais numéro de dossard</p>".html_safe if runner == :invalid_bib
    "<p id='#{id}_runner' class='alert alert-success'>#{runner.name} (#{runner.bib})</p>".html_safe
  end

  protected

  # Set attachment attributes from the direct upload
  # @note Retry logic handles S3 "eventual consistency" lag.
  def set_image_attributes

    self.direct_image_url ||= 'blabla'
    return unless self.direct_image_url.present?

    tries ||= 5



    direct_image_url_data = DIRECT_IMAGE_URL_FORMAT.match(direct_image_url)
    direct_upload_head = KAPP10_FINISHLINE_BUCKET.object(direct_image_url_data[:path]).get



    puts "NAMEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
    puts direct_image_url
    puts direct_image_url_data
    puts direct_upload_head
    puts direct_image_url_data[:filename]
    puts "NAMEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"



    self.image_file_name     = direct_image_url_data[:filename]
    puts "hereeeeeeeeeeeeeeeeee1"
    self.image_file_size     = direct_upload_head.content_length
    puts "hereeeeeeeeeeeeeeeeee2"
    self.image_content_type  = direct_upload_head.content_type
    puts "hereeeeeeeeeeeeeeeeee3"
    self.image_updated_at    = direct_upload_head.last_modified

  rescue Aws::S3::Errors::NoSuchKey => e
    tries -= 1
    if tries > 0
      sleep(3)
      retry
    else
      false
    end
  end

  # Queue file processing
  def queue_processing
    return unless self.direct_image_url.present?
    
    #PhotoTransferAndCleanupJob.perform_later id
    DetectBibJob.perform_later id
  end
end
