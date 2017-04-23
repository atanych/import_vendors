module AdditionalFields
  class Category < BaseField
    def field_id
      'field_58c3de23591a9'
    end

    def field_name
      'vendor_categories'
    end

    def create_real_row
      categories = @value.split(',').map { |category_name| find_or_create_term(category_name) }
      category_ids = categories.map { |cat| cat.term_id.to_s }
      Postmeta.create(post: @vendor, meta_key: field_name, meta_value: PHP.serialize(category_ids))
    end
  end
end