# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "bfi_ahm_download_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "pid",                   null: false
    t.integer "uid",                   null: false
    t.string  "oid",       limit: 100, null: false
    t.integer "year",                  null: false
    t.integer "month",                 null: false
    t.integer "day",                   null: false
    t.integer "timestamp",             null: false
    t.string  "ip",        limit: 20,  null: false
  end

  create_table "bfi_ahm_emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "email",                        null: false
    t.integer "pid",                          null: false
    t.integer "date",                         null: false
    t.text    "custom_data",    limit: 65535, null: false
    t.integer "request_status",               null: false
  end

  create_table "bfi_commentmeta", primary_key: "meta_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "comment_id",                    default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text   "meta_value", limit: 4294967295
    t.index ["comment_id"], name: "comment_id", using: :btree
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
  end

  create_table "bfi_comments", primary_key: "comment_ID", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint   "comment_post_ID",                    default: 0,   null: false, unsigned: true
    t.text     "comment_author",       limit: 255,                 null: false
    t.string   "comment_author_email", limit: 100,   default: "",  null: false
    t.string   "comment_author_url",   limit: 200,   default: "",  null: false
    t.string   "comment_author_IP",    limit: 100,   default: "",  null: false
    t.datetime "comment_date",                                     null: false
    t.datetime "comment_date_gmt",                                 null: false
    t.text     "comment_content",      limit: 65535,               null: false
    t.integer  "comment_karma",                      default: 0,   null: false
    t.string   "comment_approved",     limit: 20,    default: "1", null: false
    t.string   "comment_agent",                      default: "",  null: false
    t.string   "comment_type",         limit: 20,    default: "",  null: false
    t.bigint   "comment_parent",                     default: 0,   null: false, unsigned: true
    t.bigint   "user_id",                            default: 0,   null: false, unsigned: true
    t.index ["comment_approved", "comment_date_gmt"], name: "comment_approved_date_gmt", using: :btree
    t.index ["comment_author_email"], name: "comment_author_email", length: { comment_author_email: 10 }, using: :btree
    t.index ["comment_date_gmt"], name: "comment_date_gmt", using: :btree
    t.index ["comment_parent"], name: "comment_parent", using: :btree
    t.index ["comment_post_ID"], name: "comment_post_ID", using: :btree
  end

  create_table "bfi_ddownload_statistics", primary_key: "ID", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "status",     limit: 10, default: "success", null: false
    t.datetime "date",                                      null: false
    t.bigint   "post_id",                                   null: false, unsigned: true
    t.bigint   "user_id",               default: 0,         null: false, unsigned: true
    t.binary   "user_ip",    limit: 16,                     null: false
    t.string   "user_agent",                                null: false
  end

  create_table "bfi_download_log", primary_key: "ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "type",                    limit: 200, default: "download", null: false
    t.bigint   "user_id",                                                  null: false
    t.string   "user_ip",                 limit: 200,                      null: false
    t.string   "user_agent",              limit: 200,                      null: false
    t.bigint   "download_id",                                              null: false
    t.bigint   "version_id",                                               null: false
    t.string   "version",                 limit: 200,                      null: false
    t.datetime "download_date",                                            null: false
    t.string   "download_status",         limit: 200
    t.string   "download_status_message", limit: 200
    t.index ["download_id"], name: "attribute_name", using: :btree
  end

  create_table "bfi_fileaway_downloads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string  "timestamp"
    t.string  "file",      limit: 1000
    t.integer "uid"
    t.string  "email"
    t.string  "ip"
    t.string  "agent"
    t.binary  "notified",  limit: 1,    default: "b'0'"
    t.index ["uid"], name: "uid", using: :btree
  end

  create_table "bfi_fileaway_metadata", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "file",     limit: 1000
    t.text   "metadata", limit: 4294967295
  end

  create_table "bfi_icl_content_status", primary_key: "rid", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint   "nid",                  null: false
    t.datetime "timestamp",            null: false
    t.string   "md5",       limit: 32, null: false
    t.index ["nid"], name: "nid", using: :btree
  end

  create_table "bfi_icl_core_status", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint  "rid",               null: false
    t.string  "module", limit: 16, null: false
    t.string  "origin", limit: 64, null: false
    t.string  "target", limit: 64, null: false
    t.integer "status", limit: 2,  null: false
    t.index ["rid"], name: "rid", using: :btree
  end

  create_table "bfi_icl_flags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string  "lang_code",     limit: 10,             null: false
    t.string  "flag",          limit: 32,             null: false
    t.integer "from_template", limit: 1,  default: 0, null: false
    t.index ["lang_code"], name: "lang_code", unique: true, using: :btree
  end

  create_table "bfi_icl_languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string  "code",           limit: 7,                   null: false
    t.string  "english_name",   limit: 128,                 null: false
    t.integer "major",          limit: 1,   default: 0,     null: false
    t.integer "active",         limit: 1,                   null: false
    t.string  "default_locale", limit: 35
    t.string  "tag",            limit: 35
    t.boolean "encode_url",                 default: false, null: false
    t.index ["code"], name: "code", unique: true, using: :btree
    t.index ["english_name"], name: "english_name", unique: true, using: :btree
  end

  create_table "bfi_icl_languages_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "language_code",         limit: 7, null: false
    t.string "display_language_code", limit: 7, null: false
    t.string "name",                            null: false, collation: "utf8_general_ci"
    t.index ["language_code", "display_language_code"], name: "language_code", unique: true, using: :btree
  end

  create_table "bfi_icl_locale_map", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "code",   limit: 7,  null: false
    t.string "locale", limit: 35, null: false
    t.index ["code", "locale"], name: "code", unique: true, using: :btree
  end

  create_table "bfi_icl_message_status", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint   "rid",                                                           null: false, unsigned: true
    t.bigint   "object_id",                                                     null: false, unsigned: true
    t.string   "from_language", limit: 10,                                      null: false
    t.string   "to_language",   limit: 10,                                      null: false
    t.datetime "timestamp",                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "md5",           limit: 32,                                      null: false
    t.string   "object_type",   limit: 64,                                      null: false
    t.integer  "status",        limit: 2,                                       null: false
    t.index ["object_id"], name: "object_id", using: :btree
    t.index ["rid"], name: "rid", unique: true, using: :btree
  end

  create_table "bfi_icl_node", primary_key: "nid", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string  "md5",         limit: 32,             null: false
    t.integer "links_fixed", limit: 1,  default: 0, null: false
  end

  create_table "bfi_icl_reminders", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text    "message",    limit: 65535, null: false
    t.text    "url",        limit: 65535, null: false
    t.integer "can_delete", limit: 1,     null: false
    t.integer "show",       limit: 1,     null: false
  end

  create_table "bfi_icl_string_packages", primary_key: "ID", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "kind_slug", limit: 160,   null: false
    t.string "kind",      limit: 160,   null: false
    t.string "name",      limit: 160,   null: false
    t.string "title",     limit: 160,   null: false
    t.text   "edit_link", limit: 65535, null: false
    t.text   "view_link", limit: 65535, null: false
  end

  create_table "bfi_icl_string_pages", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "string_id", null: false
    t.bigint "url_id",    null: false
    t.index ["url_id"], name: "string_to_url_id", using: :btree
  end

  create_table "bfi_icl_string_positions", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint  "string_id",                  null: false
    t.integer "kind",             limit: 1
    t.string  "position_in_page",           null: false
    t.index ["string_id"], name: "string_id", using: :btree
  end

  create_table "bfi_icl_string_status", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint   "rid",                                                                   null: false
    t.bigint   "string_translation_id",                                                 null: false
    t.datetime "timestamp",                        default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "md5",                   limit: 32,                                      null: false
    t.index ["string_translation_id"], name: "string_translation_id", using: :btree
  end

  create_table "bfi_icl_string_translations", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint   "string_id",                                                              null: false, unsigned: true
    t.string   "language",            limit: 10,                                         null: false
    t.integer  "status",              limit: 1,                                          null: false
    t.text     "value",               limit: 65535
    t.bigint   "translator_id",                                                                       unsigned: true
    t.string   "translation_service", limit: 16,    default: "",                         null: false
    t.integer  "batch_id",                          default: 0,                          null: false
    t.datetime "translation_date",                  default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["string_id", "language"], name: "string_language", unique: true, using: :btree
  end

  create_table "bfi_icl_string_urls", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "language", limit: 5
    t.string "url"
    t.index ["language", "url"], name: "string_string_lang_url", unique: true, length: { url: 191 }, using: :btree
  end

  create_table "bfi_icl_strings", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string  "language",                limit: 7,                      null: false
    t.string  "context",                 limit: 160,                                 collation: "utf8_general_ci"
    t.string  "name",                    limit: 160,                                 collation: "utf8_general_ci"
    t.text    "value",                   limit: 65535,                  null: false
    t.bigint  "string_package_id",                                                                                   unsigned: true
    t.string  "type",                    limit: 40,    default: "LINE", null: false
    t.string  "title",                   limit: 160
    t.integer "status",                  limit: 1,                      null: false
    t.text    "gettext_context",         limit: 65535,                  null: false
    t.string  "domain_name_context_md5", limit: 32,                                  collation: "latin1_general_ci"
    t.index ["domain_name_context_md5"], name: "uc_domain_name_context_md5", unique: true, using: :btree
    t.index ["language", "context"], name: "language_context", using: :btree
  end

  create_table "bfi_icl_translate", primary_key: "tid", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint   "job_id",                                                                        null: false, unsigned: true
    t.bigint   "content_id",                                                                    null: false, unsigned: true
    t.datetime "timestamp",                                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "field_type",            limit: 160,                                             null: false
    t.string   "field_format",          limit: 16,                                              null: false
    t.integer  "field_translate",       limit: 1,                                               null: false
    t.text     "field_data",            limit: 4294967295,                                      null: false
    t.text     "field_data_translated", limit: 4294967295,                                      null: false
    t.integer  "field_finished",        limit: 1,          default: 0,                          null: false
    t.index ["job_id"], name: "job_id", using: :btree
  end

  create_table "bfi_icl_translate_job", primary_key: "job_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint  "rid",                                 null: false, unsigned: true
    t.integer "translator_id",                       null: false, unsigned: true
    t.integer "translated",    limit: 1, default: 0, null: false, unsigned: true
    t.integer "manager_id",                          null: false, unsigned: true
    t.integer "revision",                                         unsigned: true
    t.index ["rid", "translator_id"], name: "rid", using: :btree
  end

  create_table "bfi_icl_translation_batches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text     "batch_name",  limit: 65535, null: false
    t.integer  "tp_id"
    t.text     "ts_url",      limit: 65535
    t.datetime "last_update"
  end

  create_table "bfi_icl_translation_status", primary_key: "rid", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint   "translation_id",                                                              null: false
    t.integer  "status",              limit: 1,                                               null: false
    t.bigint   "translator_id",                                                               null: false
    t.integer  "needs_update",        limit: 1,                                               null: false
    t.string   "md5",                 limit: 32,                                              null: false
    t.string   "translation_service", limit: 16,                                              null: false
    t.integer  "batch_id",                               default: 0,                          null: false
    t.text     "translation_package", limit: 4294967295,                                      null: false
    t.datetime "timestamp",                              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer  "links_fixed",         limit: 1,          default: 0,                          null: false
    t.text     "_prevstate",          limit: 4294967295
    t.index ["translation_id"], name: "translation_id", unique: true, using: :btree
  end

  create_table "bfi_icl_translations", primary_key: "translation_id", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "element_type",         limit: 36, default: "post_post", null: false
    t.bigint "element_id"
    t.bigint "trid",                                                  null: false
    t.string "language_code",        limit: 7,                        null: false
    t.string "source_language_code", limit: 7
    t.index ["element_id", "element_type", "language_code"], name: "id_type_language", using: :btree
    t.index ["element_type", "element_id"], name: "el_type_id", unique: true, using: :btree
    t.index ["trid", "language_code"], name: "trid_lang", unique: true, using: :btree
    t.index ["trid"], name: "trid", using: :btree
  end

  create_table "bfi_itsec_lockouts", primary_key: "lockout_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "lockout_type",       limit: 20,             null: false
    t.datetime "lockout_start",                             null: false
    t.datetime "lockout_start_gmt",                         null: false
    t.datetime "lockout_expire",                            null: false
    t.datetime "lockout_expire_gmt",                        null: false
    t.string   "lockout_host",       limit: 40
    t.bigint   "lockout_user",                                           unsigned: true
    t.string   "lockout_username",   limit: 60
    t.integer  "lockout_active",                default: 1, null: false
    t.index ["lockout_active"], name: "lockout_active", using: :btree
    t.index ["lockout_expire_gmt"], name: "lockout_expire_gmt", using: :btree
    t.index ["lockout_host"], name: "lockout_host", using: :btree
    t.index ["lockout_user"], name: "lockout_user", using: :btree
    t.index ["lockout_username"], name: "lockout_username", using: :btree
  end

  create_table "bfi_itsec_log", primary_key: "log_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "log_type",     limit: 20,         default: "",                    null: false
    t.string   "log_function",                    default: "",                    null: false
    t.integer  "log_priority",                    default: 1,                     null: false
    t.datetime "log_date",                        default: '1000-01-01 00:00:00', null: false
    t.datetime "log_date_gmt",                    default: '1000-01-01 00:00:00', null: false
    t.string   "log_host",     limit: 40
    t.string   "log_username", limit: 60
    t.bigint   "log_user",                                                                     unsigned: true
    t.string   "log_url"
    t.string   "log_referrer"
    t.text     "log_data",     limit: 4294967295,                                 null: false
    t.index ["log_date_gmt"], name: "log_date_gmt", using: :btree
    t.index ["log_type"], name: "log_type", using: :btree
  end

  create_table "bfi_itsec_temp", primary_key: "temp_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "temp_type",     limit: 20, null: false
    t.datetime "temp_date",                null: false
    t.datetime "temp_date_gmt",            null: false
    t.string   "temp_host",     limit: 40
    t.bigint   "temp_user",                             unsigned: true
    t.string   "temp_username", limit: 60
    t.index ["temp_date_gmt"], name: "temp_date_gmt", using: :btree
    t.index ["temp_host"], name: "temp_host", using: :btree
    t.index ["temp_user"], name: "temp_user", using: :btree
    t.index ["temp_username"], name: "temp_username", using: :btree
  end

  create_table "bfi_links", primary_key: "link_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "link_url",                          default: "",  null: false
    t.string   "link_name",                         default: "",  null: false
    t.string   "link_image",                        default: "",  null: false
    t.string   "link_target",      limit: 25,       default: "",  null: false
    t.string   "link_description",                  default: "",  null: false
    t.string   "link_visible",     limit: 20,       default: "Y", null: false
    t.bigint   "link_owner",                        default: 1,   null: false, unsigned: true
    t.integer  "link_rating",                       default: 0,   null: false
    t.datetime "link_updated",                                    null: false
    t.string   "link_rel",                          default: "",  null: false
    t.text     "link_notes",       limit: 16777215,               null: false
    t.string   "link_rss",                          default: "",  null: false
    t.index ["link_visible"], name: "link_visible", using: :btree
  end

  create_table "bfi_options", primary_key: "option_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "option_name",  limit: 191,        default: "",    null: false
    t.text   "option_value", limit: 4294967295,                 null: false
    t.string "autoload",     limit: 20,         default: "yes", null: false
    t.index ["option_name"], name: "option_name", unique: true, using: :btree
  end

  create_table "bfi_postmeta", primary_key: "meta_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "post_id",                       default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text   "meta_value", limit: 4294967295
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
    t.index ["post_id"], name: "post_id", using: :btree
  end

  create_table "bfi_posts", primary_key: "ID", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint   "post_author",                              default: 0,         null: false, unsigned: true
    t.datetime "post_date",                                                    null: false
    t.datetime "post_date_gmt",                                                null: false
    t.text     "post_content",          limit: 4294967295,                     null: false
    t.text     "post_title",            limit: 65535,                          null: false
    t.text     "post_excerpt",          limit: 65535,                          null: false
    t.string   "post_status",           limit: 20,         default: "publish", null: false
    t.string   "comment_status",        limit: 20,         default: "open",    null: false
    t.string   "ping_status",           limit: 20,         default: "open",    null: false
    t.string   "post_password",                            default: "",        null: false
    t.string   "post_name",             limit: 200,        default: "",        null: false
    t.text     "to_ping",               limit: 65535,                          null: false
    t.text     "pinged",                limit: 65535,                          null: false
    t.datetime "post_modified",                                                null: false
    t.datetime "post_modified_gmt",                                            null: false
    t.text     "post_content_filtered", limit: 4294967295,                     null: false
    t.bigint   "post_parent",                              default: 0,         null: false, unsigned: true
    t.string   "guid",                                     default: "",        null: false
    t.integer  "menu_order",                               default: 0,         null: false
    t.string   "post_type",             limit: 20,         default: "post",    null: false
    t.string   "post_mime_type",        limit: 100,        default: "",        null: false
    t.bigint   "comment_count",                            default: 0,         null: false
    t.index ["post_author"], name: "post_author", using: :btree
    t.index ["post_name"], name: "post_name", length: { post_name: 191 }, using: :btree
    t.index ["post_parent"], name: "post_parent", using: :btree
    t.index ["post_type", "post_status", "post_date", "ID"], name: "type_status_date", using: :btree
  end

  create_table "bfi_rg_form", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "title",        limit: 150,                 null: false
    t.datetime "date_created",                             null: false
    t.boolean  "is_active",                default: true,  null: false
    t.boolean  "is_trash",                 default: false, null: false
  end

  create_table "bfi_rg_form_meta", primary_key: "form_id", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text "display_meta",      limit: 4294967295
    t.text "entries_grid_meta", limit: 4294967295
    t.text "confirmations",     limit: 4294967295
    t.text "notifications",     limit: 4294967295
  end

  create_table "bfi_rg_form_view", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "form_id",      limit: 3,              null: false, unsigned: true
    t.datetime "date_created",                        null: false
    t.string   "ip",           limit: 15
    t.integer  "count",        limit: 3,  default: 1, null: false, unsigned: true
    t.index ["date_created"], name: "date_created", using: :btree
    t.index ["form_id"], name: "form_id", using: :btree
  end

  create_table "bfi_rg_incomplete_submissions", primary_key: "uuid", id: :string, limit: 32, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "email"
    t.integer  "form_id",      limit: 3,          null: false, unsigned: true
    t.datetime "date_created",                    null: false
    t.string   "ip",           limit: 39,         null: false
    t.text     "source_url",   limit: 4294967295, null: false
    t.text     "submission",   limit: 4294967295, null: false
    t.index ["form_id"], name: "form_id", using: :btree
  end

  create_table "bfi_rg_lead", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "form_id",          limit: 3,                                               null: false, unsigned: true
    t.bigint   "post_id",                                                                               unsigned: true
    t.datetime "date_created",                                                             null: false
    t.boolean  "is_starred",                                            default: false,    null: false
    t.boolean  "is_read",                                               default: false,    null: false
    t.string   "ip",               limit: 39,                                              null: false
    t.string   "source_url",       limit: 200,                          default: "",       null: false
    t.string   "user_agent",       limit: 250,                          default: "",       null: false
    t.string   "currency",         limit: 5
    t.string   "payment_status",   limit: 15
    t.datetime "payment_date"
    t.decimal  "payment_amount",               precision: 19, scale: 2
    t.string   "payment_method",   limit: 30
    t.string   "transaction_id",   limit: 50
    t.boolean  "is_fulfilled"
    t.bigint   "created_by",                                                                            unsigned: true
    t.boolean  "transaction_type"
    t.string   "status",           limit: 20,                           default: "active", null: false
    t.index ["form_id"], name: "form_id", using: :btree
    t.index ["status"], name: "status", using: :btree
  end

  create_table "bfi_rg_lead_detail", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "lead_id",                         null: false, unsigned: true
    t.integer "form_id",      limit: 3,          null: false, unsigned: true
    t.float   "field_number", limit: 24,         null: false
    t.text    "value",        limit: 4294967295
    t.index ["form_id"], name: "form_id", using: :btree
    t.index ["lead_id", "field_number"], name: "lead_field_number", using: :btree
    t.index ["lead_id"], name: "lead_id", using: :btree
    t.index ["value"], name: "lead_field_value", length: { value: 191 }, using: :btree
  end

  create_table "bfi_rg_lead_detail_long", primary_key: "lead_detail_id", id: :bigint, default: nil, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.text "value", limit: 4294967295
  end

  create_table "bfi_rg_lead_meta", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer "form_id",    limit: 3,          default: 0, null: false, unsigned: true
    t.bigint  "lead_id",                                   null: false, unsigned: true
    t.string  "meta_key"
    t.text    "meta_value", limit: 4294967295
    t.index ["form_id", "meta_key"], name: "form_id_meta_key", length: { meta_key: 191 }, using: :btree
    t.index ["lead_id"], name: "lead_id", using: :btree
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
  end

  create_table "bfi_rg_lead_notes", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "lead_id",                         null: false, unsigned: true
    t.string   "user_name",    limit: 250
    t.bigint   "user_id"
    t.datetime "date_created",                    null: false
    t.text     "value",        limit: 4294967295
    t.string   "note_type",    limit: 50
    t.index ["lead_id", "user_id"], name: "lead_user_key", using: :btree
    t.index ["lead_id"], name: "lead_id", using: :btree
  end

  create_table "bfi_rich_web_photo_slider_instal", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "SL_Img_Title",                          null: false
    t.text    "Sl_Img_Description", limit: 4294967295, null: false
    t.string  "Sl_Img_Url",                            null: false
    t.string  "Sl_Link_Url",                           null: false
    t.string  "Sl_Link_NewTab",                        null: false
    t.integer "Sl_Number",                             null: false
  end

  create_table "bfi_rich_web_photo_slider_manager", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "Slider_Title",         null: false
    t.string  "Slider_Type",          null: false
    t.integer "Slider_IMGS_Quantity", null: false
  end

  create_table "bfi_rich_web_slider_effect1", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rich_web_slider_ID",   null: false
    t.string "rich_web_slider_name", null: false
    t.string "rich_web_slider_type", null: false
    t.string "rich_web_Sl1_SlS",     null: false
    t.string "rich_web_Sl1_SlSS",    null: false
    t.string "rich_web_Sl1_PoH",     null: false
    t.string "rich_web_Sl1_W",       null: false
    t.string "rich_web_Sl1_H",       null: false
    t.string "rich_web_Sl1_BoxS",    null: false
    t.string "rich_web_Sl1_BoxSC",   null: false
    t.string "rich_web_Sl1_IBW",     null: false
    t.string "rich_web_Sl1_IBS",     null: false
    t.string "rich_web_Sl1_IBC",     null: false
    t.string "rich_web_Sl1_IBR",     null: false
    t.string "rich_web_Sl1_TBgC",    null: false
    t.string "rich_web_Sl1_TC",      null: false
    t.string "rich_web_Sl1_TTA",     null: false
    t.string "rich_web_Sl1_TFS",     null: false
    t.string "rich_web_Sl1_TFF",     null: false
    t.string "rich_web_Sl1_TUp",     null: false
    t.string "rich_web_Sl1_ArBgC",   null: false
    t.string "rich_web_Sl1_ArOp",    null: false
    t.string "rich_web_Sl1_ArType",  null: false
    t.string "rich_web_Sl1_ArHBgC",  null: false
    t.string "rich_web_Sl1_ArHOp",   null: false
    t.string "rich_web_Sl1_ArHEff",  null: false
    t.string "rich_web_Sl1_ArBoxW",  null: false
    t.string "rich_web_Sl1_NavW",    null: false
    t.string "rich_web_Sl1_NavH",    null: false
    t.string "rich_web_Sl1_NavPB",   null: false
    t.string "rich_web_Sl1_NavBW",   null: false
    t.string "rich_web_Sl1_NavBS",   null: false
    t.string "rich_web_Sl1_NavBC",   null: false
    t.string "rich_web_Sl1_NavBR",   null: false
    t.string "rich_web_Sl1_NavCC",   null: false
    t.string "rich_web_Sl1_NavHC",   null: false
    t.string "rich_web_Sl1_ArPFT",   null: false
    t.string "rich_web_Sl1_NavPos",  null: false
  end

  create_table "bfi_rich_web_slider_effect2", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "richideo_EN_ID",        null: false
    t.string "rich_web_slider_name",  null: false
    t.string "rich_web_slider_type",  null: false
    t.string "rich_CS_BIB",           null: false
    t.string "rich_CS_P",             null: false
    t.string "rich_CS_Loop",          null: false
    t.string "rich_CS_SD",            null: false
    t.string "rich_CS_AT",            null: false
    t.string "rich_CS_Cont_BgC",      null: false
    t.string "rich_CS_Cont_BSC",      null: false
    t.string "rich_CS_Cont_W",        null: false
    t.string "rich_CS_Cont_H",        null: false
    t.string "rich_CS_Cont_Op",       null: false
    t.string "rich_CS_Cont_BW",       null: false
    t.string "rich_CS_Cont_BS",       null: false
    t.string "rich_CS_Cont_BC",       null: false
    t.string "rich_CS_Cont_BR",       null: false
    t.string "rich_CS_Video_TShow",   null: false
    t.string "rich_CS_Video_TC",      null: false
    t.string "rich_CS_Video_TSC",     null: false
    t.string "rich_CS_Video_TFS",     null: false
    t.string "rich_CS_Video_TFF",     null: false
    t.string "rich_CS_Video_TTA",     null: false
    t.string "rich_CS_Video_DShow",   null: false
    t.string "rich_CS_Video_DC",      null: false
    t.string "rich_CS_Video_DSC",     null: false
    t.string "rich_CS_Video_DFS",     null: false
    t.string "rich_CS_Video_DFF",     null: false
    t.string "rich_CS_Video_DTA",     null: false
    t.string "rich_CS_Video_Show",    null: false
    t.string "rich_CS_Video_W",       null: false
    t.string "rich_CS_Video_H",       null: false
    t.string "rich_CS_LFS",           null: false
    t.string "rich_CS_LFF",           null: false
    t.string "rich_CS_LC",            null: false
    t.string "rich_CS_LT",            null: false
    t.string "rich_CS_LBgC",          null: false
    t.string "rich_CS_LBC",           null: false
    t.string "rich_CS_LBR",           null: false
    t.string "rich_CS_LPos",          null: false
    t.string "rich_CS_LHBgC",         null: false
    t.string "rich_CS_LHC",           null: false
    t.string "rich_CS_Video_ArrShow", null: false
    t.string "rich_CS_AFS",           null: false
    t.string "rich_CS_AC",            null: false
    t.string "rich_CS_Icon",          null: false
    t.string "rich_CS_Link_BW",       null: false
    t.string "rich_CS_Link_BS",       null: false
  end

  create_table "bfi_rich_web_slider_effect3", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rich_web_slider_ID",               null: false
    t.string "rich_web_slider_name",             null: false
    t.string "rich_web_slider_type",             null: false
    t.string "rich_fsl_animation",               null: false
    t.string "rich_fsl_SShow",                   null: false
    t.string "rich_fsl_SShow_Speed",             null: false
    t.string "rich_fsl_Anim_Dur",                null: false
    t.string "rich_fsl_Ic_Show",                 null: false
    t.string "rich_fsl_PPL_Show",                null: false
    t.string "rich_fsl_Randomize",               null: false
    t.string "rich_fsl_Loop",                    null: false
    t.string "rich_fsl_Width",                   null: false
    t.string "rich_fsl_Height",                  null: false
    t.string "rich_fsl_Border_Width",            null: false
    t.string "rich_fsl_Border_Style",            null: false
    t.string "rich_fsl_Border_Color",            null: false
    t.string "rich_fsl_Box_Shadow",              null: false
    t.string "rich_fsl_Shadow_Color",            null: false
    t.string "rich_fsl_Desc_Show",               null: false
    t.string "rich_fsl_Desc_Size",               null: false
    t.string "rich_fsl_Desc_Color",              null: false
    t.string "rich_fsl_Desc_Font_Family",        null: false
    t.string "rich_fsl_Desc_Text_Align",         null: false
    t.string "rich_fsl_Desc_Bg_Color",           null: false
    t.string "rich_fsl_Desc_Transparency",       null: false
    t.string "rich_fsl_Title_Font_Size",         null: false
    t.string "rich_fsl_Title_Color",             null: false
    t.string "rich_fsl_Title_Text_Shadow",       null: false
    t.string "rich_fsl_Title_Font_Family",       null: false
    t.string "rich_fsl_Title_Text_Align",        null: false
    t.string "rich_fsl_Link_Text",               null: false
    t.string "rich_fsl_Link_Border_Width",       null: false
    t.string "rich_fsl_Link_Border_Style",       null: false
    t.string "rich_fsl_Link_Border_Color",       null: false
    t.string "rich_fsl_Link_Font_Size",          null: false
    t.string "rich_fsl_Link_Color",              null: false
    t.string "rich_fsl_Link_Font_Family",        null: false
    t.string "rich_fsl_Link_Bg_Color",           null: false
    t.string "rich_fsl_Link_Transparency",       null: false
    t.string "rich_fsl_Link_Hover_Border_Color", null: false
    t.string "rich_fsl_Link_Hover_Bg_Color",     null: false
    t.string "rich_fsl_Link_Hover_Color",        null: false
    t.string "rich_fsl_Link_Hover_Transparency", null: false
    t.string "rich_fsl_Icon_Size",               null: false
    t.string "rich_fsl_Icon_Type",               null: false
    t.string "rich_fsl_Hover_Icon_Type",         null: false
  end

  create_table "bfi_rich_web_slider_effect4", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rich_web_slider_ID",      null: false
    t.string "rich_web_slider_name",    null: false
    t.string "rich_web_slider_type",    null: false
    t.string "Rich_Web_Sl_CT_W",        null: false
    t.string "Rich_Web_Sl_CT_H",        null: false
    t.string "Rich_Web_Sl_CT_BW",       null: false
    t.string "Rich_Web_Sl_CT_BS",       null: false
    t.string "Rich_Web_Sl_CT_BC",       null: false
    t.string "Rich_Web_Sl_CT_BxSShow",  null: false
    t.string "Rich_Web_Sl_CT_BxSType",  null: false
    t.string "Rich_Web_Sl_CT_BxS",      null: false
    t.string "Rich_Web_Sl_CT_BxC",      null: false
    t.string "Rich_Web_Sl_CT_TDABgC",   null: false
    t.string "Rich_Web_Sl_CT_TDAPos",   null: false
    t.string "Rich_Web_Sl_CT_LBgC",     null: false
    t.string "Rich_Web_Sl_CT_TFS",      null: false
    t.string "Rich_Web_Sl_CT_TFF",      null: false
    t.string "Rich_Web_Sl_CT_TCC",      null: false
    t.string "Rich_Web_Sl_CT_TC",       null: false
    t.string "Rich_Web_Sl_CT_ArBgC",    null: false
    t.string "Rich_Web_Sl_CT_ArBR",     null: false
    t.string "Rich_Web_Sl_CT_ArType",   null: false
    t.string "Rich_Web_Sl_CT_ArHBC",    null: false
    t.string "Rich_Web_Sl_CT_ArHBR",    null: false
    t.string "Rich_Web_Sl_CT_ArText",   null: false
    t.string "Rich_Web_Sl_CT_ArLeft",   null: false
    t.string "Rich_Web_Sl_CT_ArRight",  null: false
    t.string "Rich_Web_Sl_CT_ArTextC",  null: false
    t.string "Rich_Web_Sl_CT_ArTextFS", null: false
    t.string "Rich_Web_Sl_CT_ArTextFF", null: false
  end

  create_table "bfi_rich_web_slider_effect5", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rich_web_slider_ID",           null: false
    t.string "rich_web_slider_name",         null: false
    t.string "rich_web_slider_type",         null: false
    t.string "Rich_Web_Sl_SC_BW",            null: false
    t.string "Rich_Web_Sl_SC_BS",            null: false
    t.string "Rich_Web_Sl_SC_BC",            null: false
    t.string "Rich_Web_Sl_SC_BoxShShow",     null: false
    t.string "Rich_Web_Sl_SC_BoxShType",     null: false
    t.string "Rich_Web_Sl_SC_BoxSh",         null: false
    t.string "Rich_Web_Sl_SC_BoxShC",        null: false
    t.string "Rich_Web_Sl_SC_IW",            null: false
    t.string "Rich_Web_Sl_SC_IH",            null: false
    t.string "Rich_Web_Sl_SC_IBW",           null: false
    t.string "Rich_Web_Sl_SC_IBS",           null: false
    t.string "Rich_Web_Sl_SC_IBC",           null: false
    t.string "Rich_Web_Sl_SC_IBR",           null: false
    t.string "Rich_Web_Sl_SC_ICBW",          null: false
    t.string "Rich_Web_Sl_SC_ICBS",          null: false
    t.string "Rich_Web_Sl_SC_ICBC",          null: false
    t.string "Rich_Web_Sl_SC_TBgC",          null: false
    t.string "Rich_Web_Sl_SC_TC",            null: false
    t.string "Rich_Web_Sl_SC_TFS",           null: false
    t.string "Rich_Web_Sl_SC_TFF",           null: false
    t.string "Rich_Web_Sl_SC_THBgC",         null: false
    t.string "Rich_Web_Sl_SC_THC",           null: false
    t.string "Rich_Web_Sl_SC_Pop_OC",        null: false
    t.string "Rich_Web_Sl_SC_Pop_BW",        null: false
    t.string "Rich_Web_Sl_SC_Pop_BC",        null: false
    t.string "Rich_Web_Sl_SC_Pop_BoxShShow", null: false
    t.string "Rich_Web_Sl_SC_Pop_BoxShType", null: false
    t.string "Rich_Web_Sl_SC_Pop_BoxSh",     null: false
    t.string "Rich_Web_Sl_SC_Pop_BoxShC",    null: false
    t.string "Rich_Web_Sl_SC_L_BgC",         null: false
    t.string "Rich_Web_Sl_SC_L_C",           null: false
    t.string "Rich_Web_Sl_SC_L_FS",          null: false
    t.string "Rich_Web_Sl_SC_L_BW",          null: false
    t.string "Rich_Web_Sl_SC_L_BS",          null: false
    t.string "Rich_Web_Sl_SC_L_BC",          null: false
    t.string "Rich_Web_Sl_SC_L_BR",          null: false
    t.string "Rich_Web_Sl_SC_L_HBgC",        null: false
    t.string "Rich_Web_Sl_SC_L_HC",          null: false
    t.string "Rich_Web_Sl_SC_L_Type",        null: false
    t.string "Rich_Web_Sl_SC_L_Text",        null: false
    t.string "Rich_Web_Sl_SC_L_IType",       null: false
    t.string "Rich_Web_Sl_SC_L_FF",          null: false
    t.string "Rich_Web_Sl_SC_PI_BgC",        null: false
    t.string "Rich_Web_Sl_SC_PI_C",          null: false
    t.string "Rich_Web_Sl_SC_PI_FS",         null: false
    t.string "Rich_Web_Sl_SC_PI_BW",         null: false
    t.string "Rich_Web_Sl_SC_PI_BS",         null: false
    t.string "Rich_Web_Sl_SC_PI_BC",         null: false
    t.string "Rich_Web_Sl_SC_PI_BR",         null: false
    t.string "Rich_Web_Sl_SC_PI_HBgC",       null: false
    t.string "Rich_Web_Sl_SC_PI_HC",         null: false
    t.string "Rich_Web_Sl_SC_PI_Type",       null: false
    t.string "Rich_Web_Sl_SC_PI_Text",       null: false
    t.string "Rich_Web_Sl_SC_PI_IType",      null: false
    t.string "Rich_Web_Sl_SC_PI_FF",         null: false
    t.string "Rich_Web_Sl_SC_Arr_BgC",       null: false
    t.string "Rich_Web_Sl_SC_Arr_C",         null: false
    t.string "Rich_Web_Sl_SC_Arr_FS",        null: false
    t.string "Rich_Web_Sl_SC_Arr_BW",        null: false
    t.string "Rich_Web_Sl_SC_Arr_BS",        null: false
    t.string "Rich_Web_Sl_SC_Arr_BC",        null: false
    t.string "Rich_Web_Sl_SC_Arr_BR",        null: false
    t.string "Rich_Web_Sl_SC_Arr_HBgC",      null: false
    t.string "Rich_Web_Sl_SC_Arr_HC",        null: false
    t.string "Rich_Web_Sl_SC_Arr_Type",      null: false
    t.string "Rich_Web_Sl_SC_Arr_FF",        null: false
    t.string "Rich_Web_Sl_SC_Arr_IType",     null: false
    t.string "Rich_Web_Sl_SC_Arr_Next",      null: false
    t.string "Rich_Web_Sl_SC_Arr_Prev",      null: false
    t.string "Rich_Web_Sl_SC_PCI_FS",        null: false
    t.string "Rich_Web_Sl_SC_PCI_C",         null: false
    t.string "Rich_Web_Sl_SC_PCI_Type",      null: false
  end

  create_table "bfi_rich_web_slider_effect6", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rich_web_slider_ID",         null: false
    t.string "rich_web_slider_name",       null: false
    t.string "rich_web_slider_type",       null: false
    t.string "Rich_Web_Sl_FS_BgC",         null: false
    t.string "Rich_Web_Sl_FS_AP",          null: false
    t.string "Rich_Web_Sl_FS_TS",          null: false
    t.string "Rich_Web_Sl_FS_PT",          null: false
    t.string "Rich_Web_Sl_FS_SS",          null: false
    t.string "Rich_Web_Sl_FS_SVis",        null: false
    t.string "Rich_Web_Sl_FS_CS",          null: false
    t.string "Rich_Web_Sl_FS_SLoop",       null: false
    t.string "Rich_Web_Sl_FS_SSc",         null: false
    t.string "Rich_Web_Sl_FS_SlPos",       null: false
    t.string "Rich_Web_Sl_FS_ShNavBut",    null: false
    t.string "Rich_Web_Sl_FS_I_W",         null: false
    t.string "Rich_Web_Sl_FS_I_H",         null: false
    t.string "Rich_Web_Sl_FS_I_BW",        null: false
    t.string "Rich_Web_Sl_FS_I_BS",        null: false
    t.string "Rich_Web_Sl_FS_I_BC",        null: false
    t.string "Rich_Web_Sl_FS_I_BR",        null: false
    t.string "Rich_Web_Sl_FS_I_BoxShShow", null: false
    t.string "Rich_Web_Sl_FS_I_BoxShType", null: false
    t.string "Rich_Web_Sl_FS_I_BoxSh",     null: false
    t.string "Rich_Web_Sl_FS_I_BoxShC",    null: false
    t.string "Rich_Web_Sl_FS_T_C",         null: false
    t.string "Rich_Web_Sl_FS_T_FF",        null: false
    t.string "Rich_Web_Sl_FS_Nav_Show",    null: false
    t.string "Rich_Web_Sl_FS_Nav_W",       null: false
    t.string "Rich_Web_Sl_FS_Nav_H",       null: false
    t.string "Rich_Web_Sl_FS_Nav_BW",      null: false
    t.string "Rich_Web_Sl_FS_Nav_BS",      null: false
    t.string "Rich_Web_Sl_FS_Nav_BC",      null: false
    t.string "Rich_Web_Sl_FS_Nav_BR",      null: false
    t.string "Rich_Web_Sl_FS_Nav_PB",      null: false
    t.string "Rich_Web_Sl_FS_Nav_CC",      null: false
    t.string "Rich_Web_Sl_FS_Nav_HC",      null: false
    t.string "Rich_Web_Sl_FS_Nav_C",       null: false
    t.string "Rich_Web_Sl_FS_Arr_Show",    null: false
    t.string "Rich_Web_Sl_FS_Arr_Type",    null: false
    t.string "Rich_Web_Sl_FS_Arr_S",       null: false
    t.string "Rich_Web_Sl_FS_Arr_C",       null: false
  end

  create_table "bfi_rich_web_slider_effect7", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rich_web_slider_ID",      null: false
    t.string "rich_web_slider_name",    null: false
    t.string "rich_web_slider_type",    null: false
    t.string "Rich_Web_Sl_DS_AP",       null: false
    t.string "Rich_Web_Sl_DS_PT",       null: false
    t.string "Rich_Web_Sl_DS_Tr",       null: false
    t.string "Rich_Web_Sl_DS_H",        null: false
    t.string "Rich_Web_Sl_DS_BW",       null: false
    t.string "Rich_Web_Sl_DS_BS",       null: false
    t.string "Rich_Web_Sl_DS_BC",       null: false
    t.string "Rich_Web_Sl_DS_TFS",      null: false
    t.string "Rich_Web_Sl_DS_TFF",      null: false
    t.string "Rich_Web_Sl_DS_TC",       null: false
    t.string "Rich_Web_Sl_DS_DFS",      null: false
    t.string "Rich_Web_Sl_DS_DFF",      null: false
    t.string "Rich_Web_Sl_DS_DC",       null: false
    t.string "Rich_Web_Sl_DS_LFS",      null: false
    t.string "Rich_Web_Sl_DS_LFF",      null: false
    t.string "Rich_Web_Sl_DS_LC",       null: false
    t.string "Rich_Web_Sl_DS_LBgC",     null: false
    t.string "Rich_Web_Sl_DS_LBW",      null: false
    t.string "Rich_Web_Sl_DS_LBS",      null: false
    t.string "Rich_Web_Sl_DS_LBC",      null: false
    t.string "Rich_Web_Sl_DS_LBR",      null: false
    t.string "Rich_Web_Sl_DS_LHC",      null: false
    t.string "Rich_Web_Sl_DS_LHBgC",    null: false
    t.string "Rich_Web_Sl_DS_LT",       null: false
    t.string "Rich_Web_Sl_DS_Arr_Show", null: false
    t.string "Rich_Web_Sl_DS_Arr_LT",   null: false
    t.string "Rich_Web_Sl_DS_Arr_RT",   null: false
    t.string "Rich_Web_Sl_DS_Arr_C",    null: false
    t.string "Rich_Web_Sl_DS_Arr_BgC",  null: false
    t.string "Rich_Web_Sl_DS_Arr_BW",   null: false
    t.string "Rich_Web_Sl_DS_Arr_BS",   null: false
    t.string "Rich_Web_Sl_DS_Arr_BC",   null: false
    t.string "Rich_Web_Sl_DS_Arr_BR",   null: false
    t.string "Rich_Web_Sl_DS_Arr_HC",   null: false
    t.string "Rich_Web_Sl_DS_Arr_HBgC", null: false
    t.string "Rich_Web_Sl_DS_Nav_W",    null: false
    t.string "Rich_Web_Sl_DS_Nav_H",    null: false
    t.string "Rich_Web_Sl_DS_Nav_PB",   null: false
    t.string "Rich_Web_Sl_DS_Nav_BW",   null: false
    t.string "Rich_Web_Sl_DS_Nav_BS",   null: false
    t.string "Rich_Web_Sl_DS_Nav_BC",   null: false
    t.string "Rich_Web_Sl_DS_Nav_BR",   null: false
    t.string "Rich_Web_Sl_DS_Nav_C",    null: false
    t.string "Rich_Web_Sl_DS_Nav_HC",   null: false
    t.string "Rich_Web_Sl_DS_Nav_CC",   null: false
  end

  create_table "bfi_rich_web_slider_effects_data", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "slider_name", null: false
    t.string "slider_type", null: false
  end

  create_table "bfi_rich_web_slider_font_family", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "Font_family", null: false
  end

  create_table "bfi_rich_web_slider_id", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "Slider_ID", null: false
  end

  create_table "bfi_statistics_exclusions", primary_key: "ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date   "date",   null: false
    t.string "reason"
    t.bigint "count",  null: false
    t.index ["date"], name: "date", using: :btree
    t.index ["reason"], name: "reason", using: :btree
  end

  create_table "bfi_statistics_historical", primary_key: "ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "category", limit: 25, null: false
    t.bigint "page_id",             null: false
    t.string "uri",                 null: false
    t.bigint "value",               null: false
    t.index ["category"], name: "category", using: :btree
    t.index ["page_id"], name: "page_id", unique: true, using: :btree
    t.index ["uri"], name: "uri", unique: true, using: :btree
  end

  create_table "bfi_statistics_pages", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "uri",   null: false
    t.date    "date",  null: false
    t.integer "count", null: false
    t.integer "id",    null: false
    t.index ["date", "uri"], name: "date_2", unique: true, using: :btree
    t.index ["date"], name: "date", using: :btree
    t.index ["id"], name: "id", using: :btree
    t.index ["uri"], name: "url", using: :btree
  end

  create_table "bfi_statistics_search", primary_key: "ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date   "last_counter",            null: false
    t.string "engine",       limit: 64, null: false
    t.string "host"
    t.string "words"
    t.bigint "visitor"
    t.index ["engine"], name: "engine", using: :btree
    t.index ["host"], name: "host", using: :btree
    t.index ["last_counter"], name: "last_counter", using: :btree
  end

  create_table "bfi_statistics_useronline", primary_key: "ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ip",        limit: 60,    null: false
    t.integer  "created"
    t.integer  "timestamp",               null: false
    t.datetime "date",                    null: false
    t.text     "referred",  limit: 65535, null: false
    t.string   "agent",                   null: false
    t.string   "platform"
    t.string   "version"
    t.string   "location",  limit: 10
  end

  create_table "bfi_statistics_visit", primary_key: "ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "last_visit",   null: false
    t.date     "last_counter", null: false
    t.integer  "visit",        null: false
    t.index ["last_counter"], name: "unique_date", unique: true, using: :btree
  end

  create_table "bfi_statistics_visitor", primary_key: "ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date    "last_counter",               null: false
    t.text    "referred",     limit: 65535, null: false
    t.string  "agent",                      null: false
    t.string  "platform"
    t.string  "version"
    t.string  "UAString"
    t.string  "ip",           limit: 60,    null: false
    t.string  "location",     limit: 10
    t.integer "hits"
    t.integer "honeypot"
    t.index ["agent"], name: "agent", using: :btree
    t.index ["last_counter", "ip", "agent", "platform", "version"], name: "date_ip_agent", unique: true, length: { agent: 75, platform: 75, version: 75 }, using: :btree
    t.index ["location"], name: "location", using: :btree
    t.index ["platform"], name: "platform", using: :btree
    t.index ["version"], name: "version", using: :btree
  end

  create_table "bfi_term_relationships", primary_key: ["object_id", "term_taxonomy_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint  "object_id",        default: 0, null: false, unsigned: true
    t.bigint  "term_taxonomy_id", default: 0, null: false, unsigned: true
    t.integer "term_order",       default: 0, null: false
    t.index ["term_taxonomy_id"], name: "term_taxonomy_id", using: :btree
  end

  create_table "bfi_term_taxonomy", primary_key: "term_taxonomy_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "term_id",                        default: 0,  null: false, unsigned: true
    t.string "taxonomy",    limit: 32,         default: "", null: false
    t.text   "description", limit: 4294967295,              null: false
    t.bigint "parent",                         default: 0,  null: false, unsigned: true
    t.bigint "count",                          default: 0,  null: false
    t.index ["taxonomy"], name: "taxonomy", using: :btree
    t.index ["term_id", "taxonomy"], name: "term_id_taxonomy", unique: true, using: :btree
  end

  create_table "bfi_termmeta", primary_key: "meta_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "term_id",                       default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text   "meta_value", limit: 4294967295
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
    t.index ["term_id"], name: "term_id", using: :btree
  end

  create_table "bfi_terms", primary_key: "term_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name",       limit: 200, default: "", null: false
    t.string "slug",       limit: 200, default: "", null: false
    t.bigint "term_group",             default: 0,  null: false
    t.index ["name"], name: "name", length: { name: 191 }, using: :btree
    t.index ["slug"], name: "slug", length: { slug: 191 }, using: :btree
  end

  create_table "bfi_usermeta", primary_key: "umeta_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.bigint "user_id",                       default: 0, null: false, unsigned: true
    t.string "meta_key"
    t.text   "meta_value", limit: 4294967295
    t.index ["meta_key"], name: "meta_key", length: { meta_key: 191 }, using: :btree
    t.index ["user_id"], name: "user_id", using: :btree
  end

  create_table "bfi_users", primary_key: "ID", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "user_login",          limit: 60,  default: "", null: false
    t.string   "user_pass",                       default: "", null: false
    t.string   "user_nicename",       limit: 50,  default: "", null: false
    t.string   "user_email",          limit: 100, default: "", null: false
    t.string   "user_url",            limit: 100, default: "", null: false
    t.datetime "user_registered",                              null: false
    t.string   "user_activation_key",             default: "", null: false
    t.integer  "user_status",                     default: 0,  null: false
    t.string   "display_name",        limit: 250, default: "", null: false
    t.index ["user_email"], name: "user_email", using: :btree
    t.index ["user_login"], name: "user_login_key", using: :btree
    t.index ["user_nicename"], name: "user_nicename", using: :btree
  end

  create_table "bfi_wpfb_cats", primary_key: "cat_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string  "cat_name",                          default: "",  null: false
    t.text    "cat_description",     limit: 65535
    t.string  "cat_folder",          limit: 300,   default: "",  null: false
    t.string  "cat_path",            limit: 2000,  default: "",  null: false
    t.integer "cat_parent",                        default: 0,   null: false, unsigned: true
    t.integer "cat_num_files",                     default: 0,   null: false, unsigned: true
    t.integer "cat_num_files_total",               default: 0,   null: false, unsigned: true
    t.text    "cat_user_roles",      limit: 65535,               null: false
    t.bigint  "cat_owner",                                                    unsigned: true
    t.string  "cat_icon"
    t.string  "cat_exclude_browser", limit: 1,     default: "0", null: false
    t.integer "cat_order",                         default: 0,   null: false
    t.bigint  "cat_wp_term_id",                    default: 0,   null: false
    t.bigint  "cat_scan_lock",                     default: 0,   null: false, unsigned: true
    t.index ["cat_folder", "cat_parent"], name: "UNIQUE_FOLDER", unique: true, using: :btree
    t.index ["cat_user_roles"], name: "USER_ROLES", type: :fulltext
  end

  create_table "bfi_wpfb_files", primary_key: "file_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "file_name",           limit: 300,   default: "",  null: false
    t.string   "file_name_original",  limit: 300,   default: "",  null: false
    t.string   "file_path",           limit: 2000,  default: "",  null: false
    t.bigint   "file_size",                         default: 0,   null: false, unsigned: true
    t.datetime "file_date",                                       null: false
    t.bigint   "file_mtime",                        default: 0,   null: false, unsigned: true
    t.string   "file_hash",           limit: 32,                  null: false
    t.string   "file_remote_uri",     limit: 2000,  default: "",  null: false
    t.string   "file_thumbnail"
    t.string   "file_display_name",                 default: "",  null: false
    t.text     "file_description",    limit: 65535
    t.string   "file_tags",                         default: "",  null: false
    t.string   "file_requirement"
    t.string   "file_version",        limit: 64
    t.string   "file_author"
    t.string   "file_language"
    t.string   "file_platform"
    t.string   "file_license",                      default: "",  null: false
    t.text     "file_user_roles",     limit: 65535,               null: false
    t.string   "file_offline",        limit: 1,     default: "0", null: false
    t.string   "file_direct_linking", limit: 1,     default: "0", null: false
    t.string   "file_force_download", limit: 1,     default: "0", null: false
    t.integer  "file_category",                     default: 0,   null: false, unsigned: true
    t.string   "file_category_name",  limit: 127,   default: "",  null: false
    t.bigint   "file_update_of",                                               unsigned: true
    t.bigint   "file_post_id",                                                 unsigned: true
    t.integer  "file_attach_order",                 default: 0,   null: false
    t.bigint   "file_wpattach_id",                  default: 0,   null: false
    t.bigint   "file_added_by",                                                unsigned: true
    t.bigint   "file_hits",                         default: 0,   null: false, unsigned: true
    t.bigint   "file_ratings",                      default: 0,   null: false, unsigned: true
    t.bigint   "file_rating_sum",                   default: 0,   null: false, unsigned: true
    t.string   "file_last_dl_ip",     limit: 100,   default: "",  null: false
    t.datetime "file_last_dl_time",                               null: false
    t.integer  "file_rescan_pending", limit: 1,     default: 0,   null: false
    t.bigint   "file_scan_lock",                    default: 0,   null: false, unsigned: true
    t.text     "file_custom_cf1",     limit: 65535,               null: false
    t.text     "file_custom_cf2",     limit: 65535,               null: false
    t.index ["file_description"], name: "DESCRIPTION", type: :fulltext
    t.index ["file_name", "file_category"], name: "UNIQUE_FILE", unique: true, using: :btree
    t.index ["file_user_roles"], name: "USER_ROLES", type: :fulltext
  end

  create_table "bfi_wpfb_files_id3", primary_key: "file_id", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "analyzetime",                    default: 0, null: false
    t.text    "value",       limit: 4294967295
    t.text    "keywords",    limit: 65535,                  null: false
    t.index ["keywords"], name: "KEYWORDS", type: :fulltext
  end

end
