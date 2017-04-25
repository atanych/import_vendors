module AdditionalFields
  class HourlyRate < BaseField
    def field_id
      'field_58ff5e23c16ce'
    end

    def field_name
      'vendor_hourly_rate'
    end

    def create_real_row
      binding.pry
      Postmeta.create(post: @vendor, meta_key: field_name, meta_value: Sanitize.clean(@value))
    end
  end
end