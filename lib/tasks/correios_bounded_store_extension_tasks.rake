namespace :spree do
  namespace :extensions do
    namespace :correios_bounded_store do
      desc "Copies public assets of the Correios Bounded Store to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[CorreiosBoundedStoreExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(CorreiosBoundedStoreExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  

      desc %q\
      Load initial database fixtures for this extension (/db/samples/*.yml) into the current environment's database.
      \
      task :load_sample_data => :environment do

        EXTENSION_SAMPLE_PATH = 'vendor/extensions/correios_bounded_store/db/sample'

        require 'active_record/fixtures'
        puts "Loading default data..."
        sample_fixture_path = File.join(RAILS_ROOT, EXTENSION_SAMPLE_PATH)
        Dir.glob(File.join(sample_fixture_path, '*.{yml,csv}')).each do |file|
          Fixtures.create_fixtures(sample_fixture_path, File.basename(file, '.*'))
        end
        puts "...done."
      end


    end
  end
end