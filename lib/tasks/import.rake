desc 'Import vendors'

task import_vendors: :environment do
  Import.('./public/Display.xlsx')
end