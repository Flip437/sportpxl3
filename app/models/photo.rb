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
#  direct_image_url   :string           not nullphoto_ids
#  processed          :boolean          default(FALSE)
#

class Photo < ApplicationRecord
  belongs_to :edition
  #belongs_to :race
  has_one_attached :image
  validates :image_file_name, uniqueness: { scope: :edition_id }



  DIRECT_IMAGE_URL_FORMAT = %r{\Ahttps:\/\/#{ENV['S3_BUCKET']}\.#{ENV['AWS_S3_HOST_NAME_REGION']}\.amazonaws\.com\/(?<path>uploads\/(?<filename>.+))\z}.freeze
  #DIRECT_IMAGE_URL_FORMAT = %r{\Ahttps:\/\/#{ENV['AWS_S3_HOST_NAME_REGION']}\.amazonaws\.com\/#{ENV['S3_BUCKET']}\/(?<path>uploads\/.+\/(?<filename>.+))\z}.freeze
  validates :direct_image_url, presence: true, allow_blank: true#, format: { with: DIRECT_IMAGE_URL_FORMAT }
  before_create :set_image_attributes
  after_create :queue_processing




  # # Override
  # # Store an unescaped version of the escaped URL that Amazon returns from direct upload.
  # def direct_image_url=(escaped_url)
  #   puts "SERVICE URLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"
  #   puts self.image.service_url

  #   s3 = Aws::S3::Resource.new
  #   bucket = s3.bucket('kapp10')
  #   obj = bucket.object(self.image.key)
  #   url = obj.presigned_url(:get)

  #   write_attribute(:direct_image_url, (CGI.unescape(url) rescue ''))

  #   puts "PRESIGNED URLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"
  #   puts url
  #   puts CGI.parse(URI.parse(url).query)
  # end





  # Determines if file requires post-processing (image resizing, etc)
  def post_process_required?
    %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}.match(image_content_type).present?
  end

  def runner
    return :not_paired if bib.blank?
    # edition.results.find_by(bib: bib) || :invalid_bib
    edition.contacts.find_by(dossard: bib)
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
    tries ||= 5
    s3 = Aws::S3::Resource.new
    bucket = s3.bucket(ENV['S3_BUCKET'])
    obj = bucket.object(self.image.key)
    #set attributes from amazon s3 object
    self.direct_image_url    = obj.public_url
    self.image_file_size     = obj.size
    self.image_content_type  = obj.content_type
    self.image_updated_at    = obj.last_modified
    #set attributes from active storage blob table
    self.image_file_name      = self.image.blob.filename
    self.image_content_type   = self.image.blob.content_type

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
    #PhotoTransferAndCleanupJob.perform_later(self.id)
    DetectBibJob.perform_now(self.id)
  end
end
