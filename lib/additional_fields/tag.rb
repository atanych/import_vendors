module AdditionalFields
  class Tag < BaseField
    def field_id
      'field_58c3dfc7cff51'
    end

    def field_name
      'vendor_tags'
    end

    def create_real_row
      tags = @value.split(',').map { |tag_name| find_or_create_term(tag_name) }
      Postmeta.create(post: @vendor, meta_key: field_name, meta_value: PHP.serialize(tags.map(&:term_id)))
    end
  end
end