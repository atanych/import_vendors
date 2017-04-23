desc 'Import vendors'
FIELDS = ['categories', 'tags', 'name', 'priority', 'street', 'zip', 'city', 'phone', 'contact', 'email', 'website', 'content']

task import_vendors: :environment do
  Import.('./public/Display_NO.xlsx')
end