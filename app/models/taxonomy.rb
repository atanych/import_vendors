class Taxonomy < ApplicationRecord
  self.table_name = 'bfi_term_taxonomy'
  has_one :term, foreign_key: :term_id

  VENDOR_TYPES = {
      'vendor_tags' => 'vendor_tag',
      'vendor_categories' => 'vendor_category',
      'vendor_priority' => 'vendor_priority'
  }

  def self.build_term(type, name)
    term = Term.create(name: name, slug: name.parameterize)
    tax = Taxonomy.create(term_id: term.term_id, taxonomy: VENDOR_TYPES[type], description: '')
    Translation.create_translation("tax_#{VENDOR_TYPES[type]}", tax.term_id)
    term
  end
end
