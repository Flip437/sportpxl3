# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.1'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += %w( diploma.css )
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( picto.css )

Rails.application.config.assets.paths << Rails.root.join("app", "assets", "images")


Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/


Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.precompile += %w( template/jquery-3.2.1.min.js )


#DataTables files
Rails.application.config.assets.precompile += %w( template/jquery-3.5.1.js )
Rails.application.config.assets.precompile += %w( template/jquery.dataTables.min.js )
Rails.application.config.assets.precompile += %w( template/dataTables.bootstrap4.min.js )

Rails.application.config.assets.precompile += %w( template/bootstrap.css )
Rails.application.config.assets.precompile += %w( template/dataTables.bootstrap4.min.css )

Rails.application.config.assets.precompile += %w( template/datatables.css )
Rails.application.config.assets.precompile += %w( template/datatables.js )




#Rails.application.config.assets.precompile += %w( diploma_form.sass )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
