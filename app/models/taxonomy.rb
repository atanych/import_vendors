class Taxonomy < ApplicationRecord
  self.table_name = 'bfi_term_taxonomy'
  has_one :term, foreign_key: :term_id

  VENDOR_TYPES = {
      'tag' => 'vendor_tag',
      'category' => 'vendor_category',
      'priority' => 'vendor_priority'
  }

  def self.build_term(type, name)
    term = Term.create(name: name, slug: name.parameterize)
    tax = Taxonomy.create(term_id: term.term_id, taxonomy: VENDOR_TYPES[type], description: '')
    trid = Translation.where(language_code: ENV['LANG']).order(trid: :desc).first
    Translation.create(
      element_type: "tax_#{tax.taxonomy}",
      element_id: tax.term_id,
      language_code: ENV['LANG'],
      trid: trid.trid + 1
    )
  end
end
