require 'php_serialize'

class Import
  MAIN_FIELDS = {
      post_title: 2,
      post_content: 11
  }

  ADDITIONAL_FIELDS = {
      category: 0,
      tag: 1,
      priority: 3,
      street: 4,
      zip: 5,
      city: 6,
      phone: 7,
      contact: 8,
      email: 9,
      website: 10,
      hourly_rate: 12
  }

  ADDITIONAL_GEO_FIELDS = ['latitude', 'longitude']

  class << self
    def call(path)
      xlsx = Roo::Spreadsheet.open(path, extension: :xlsx)
      sheet = xlsx.parse
      sheet.map do |row|
        break if self.row_empty?(row)
        vendor = self.preset_vendor
        vendor = self.set_main_fields(vendor, row)
        vendor.save
        self.create_additional_fields(vendor, row)
        self.look_up_coordinates(vendor, row)
      end
    end

    def row_empty?(row)
      row.compact.select { |d| d.try(:strip).present? }.empty?
    end

    def set_main_fields(vendor, row)
      MAIN_FIELDS.each { |field_name, index| vendor.send("#{field_name}=", row[index]) if row[index] }
      vendor
    end

    def create_additional_fields(vendor, row)
      ADDITIONAL_FIELDS.each do |field_name, index|
        additional_field_class = "AdditionalFields::#{field_name.to_s.camelize}".constantize
        additional_field_class.(vendor, row[index])
      end
      vendor
    end

    def look_up_coordinates(vendor, row)
      city = row[ADDITIONAL_FIELDS[:city]]
      street = row[ADDITIONAL_FIELDS[:street]]
      return if city.empty?
      geo_object = Geokit::Geocoders::GoogleGeocoder.geocode("#{city} #{street}")
      ADDITIONAL_GEO_FIELDS.each do |field_name|
        additional_field_class = "AdditionalFields::#{field_name.capitalize}".constantize
        additional_field_class.(vendor, geo_object.send(field_name))
      end
    end

    def preset_vendor
      Post.new(
          post_author: 645,
          post_date: Time.now + 2.hour,
          post_date_gmt: Time.now,
          post_status: 'publish',
          comment_status: 'closed',
          ping_status: 'closed',
          post_modified: Time.now + 2.hour,
          post_modified_gmt: Time.now,
          post_parent: 0,
          menu_order: 0,
          post_type: 'vendor',
          post_excerpt: '',
          to_ping: '',
          pinged: '',
          post_content_filtered: '',
          post_content: '',
          comment_count: 0
      )
    end
  end

end