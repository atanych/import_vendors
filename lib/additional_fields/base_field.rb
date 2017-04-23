module AdditionalFields
  class BaseField
    FIELD_ID = 'xxxxx'
    FIELD_VALUE = 'xxxxx'

    def self.call(vendor, value)
      field = self.new(vendor, value)
      field.create_redundant_row
      field.create_real_row
    end

    def initialize(vendor, value)
      @vendor = vendor
      @value = value
    end

    def field_id
      raise 'should be implemented'
    end

    def field_names
      raise 'should be implemented'
    end

    def create_redundant_row
      Postmeta.create(post: @vendor, meta_key: "_#{field_name}", meta_value: field_id)
    end

    def create_real_row
      Postmeta.create(post: @vendor, meta_key: field_name, meta_value: @value)
    end

    def find_or_create_term(term_name)
      term_name = term_name.strip
      adapted_field_name = Taxonomy::VENDOR_TYPES[field_name]
      taxonomies = Taxonomy.joins(:term).where(bfi_terms: {name: term_name}, taxonomy: adapted_field_name).all.select do |t|
        Translation.exists?(element_id: t.id, element_type: "tax_#{adapted_field_name}")
      end
      taxonomies.empty? ? Taxonomy.build_term(field_name, term_name) : taxonomies.first.term
    end
  end
end