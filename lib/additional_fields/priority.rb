module AdditionalFields
  class Priority < BaseField
    def field_id
      'field_58c3dfe2cff52'
    end

    def field_name
      'vendor_priority'
    end

    def create_real_row
      priority = find_or_create_term(@value)
      Postmeta.create(post: @vendor, meta_key: field_name, meta_value: PHP.serialize([priority.term_id]))
    end
  end
end