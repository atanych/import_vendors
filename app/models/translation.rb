class Translation < ApplicationRecord
  self.table_name = 'bfi_icl_translations'

  def self.create_translation(element_type, element_id)
    trid = Translation.where(language_code: ENV['LANG']).order(trid: :desc).first
    Translation.create(
        element_type: element_type,
        element_id: element_id,
        language_code: ENV['LANG'],
        trid: trid ? trid.trid + 1 : 1
    )
  end
end