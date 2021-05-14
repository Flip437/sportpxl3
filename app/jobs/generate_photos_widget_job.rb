require 'htmlentities'
require 'htmlcompressor'

class GeneratePhotosWidgetJob < ActiveJob::Base
  queue_as :normal

  def perform(edition_id)    
    @edition      = Edition.find(edition_id)
    @categories   = @edition.contacts.pluck(:category).uniq.sort
    @photos_json  = @edition.get_widget_photos_json
    contacts     = @edition.contacts
    photos      = @edition.photos.map do |photo|

      contact = contacts.select{ |c| c.dossard === photo.bib }.first
      if contact
        if contact.nom
          name = contact.nom
        else
          name = "#{contact.prenom} #{result.nom}"
        end
      else
        name = ''
      end
      {
        url:   photo.direct_image_url,
        bib:   photo.bib || "",
        rank:  "RANK",#(result && result.rank) ? result.rank : results.size + 1,
        race:  "RACE",#result ? result.race_detail.parameterize : '',
        sex:   contact ? contact.sex.downcase : 'm',
        categ: contact ? contact.category.downcase : '',
        name:  name.gsub(/'/, " "), # fix problem with `'` in names 🤷
      }
    end

    photos = photos.sort_by{|photo| photo[:rank]}
    @photos_json = photos.to_json
    @generated_at = Time.now

    erb_file = "#{Rails.root}/app/views/editions/photos_widget.html.erb"
    erb_str  = File.read(erb_file)
    renderer = ERB.new(erb_str)

    if renderer
      html       = renderer.result(binding)
      compressor = HtmlCompressor::Compressor.new
      KAPP10_WIDGETS_BUCKET.object(@edition.photos_widget_storage_name).put(content_type: 'text/html', body: compressor.compress(html), acl:'public-read')
      @edition.update_attribute(:photos_widget_generated_at, @generated_at)
    end
  end
end
