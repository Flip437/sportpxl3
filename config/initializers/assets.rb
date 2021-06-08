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

Rails.application.config.assets.precompile += %w( template/jquery.min.js )
Rails.application.config.assets.precompile += %w( template/jquery-3.2.1.min.js )
Rails.application.config.assets.precompile += %w( template/jquery-migrate-3.0.1.min.js )

Rails.application.config.assets.precompile += %w( template/popper.min.js )
Rails.application.config.assets.precompile += %w( template/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( template/jquery.easing.1.3.js )
Rails.application.config.assets.precompile += %w( template/jquery.waypoints.min.js )
Rails.application.config.assets.precompile += %w( template/jquery.stellar.min.js )
Rails.application.config.assets.precompile += %w( template/jquery.animateNumber.min.js )
Rails.application.config.assets.precompile += %w( template/bootstrap-datepicker.js )
Rails.application.config.assets.precompile += %w( template/jquery.timepicker.min.js )
Rails.application.config.assets.precompile += %w( template/owl.carousel.min.js )
Rails.application.config.assets.precompile += %w( template/jquery.magnific-popup.min.js )
Rails.application.config.assets.precompile += %w( template/scrollax.min.js )
Rails.application.config.assets.precompile += %w( template/main.js )




#Rails.application.config.assets.precompile += %w( diploma_form.sass )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
