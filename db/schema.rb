# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140107164756) do

  create_table "addresses", force: true do |t|
    t.string   "street_line1"
    t.string   "street_line2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ads", force: true do |t|
    t.string   "ad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ads_applicants", id: false, force: true do |t|
    t.integer  "applicant_id"
    t.integer  "ad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ads_applicants", ["ad_id"], name: "index_ads_applicants_on_ad_id", using: :btree
  add_index "ads_applicants", ["applicant_id"], name: "index_ads_applicants_on_applicant_id", using: :btree

  create_table "ads_cycle_applications", id: false, force: true do |t|
    t.integer  "cycle_application_id"
    t.integer  "ad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ads_cycle_applications", ["ad_id"], name: "index_ads_cycle_applications_on_ad_id", using: :btree
  add_index "ads_cycle_applications", ["cycle_application_id"], name: "index_ads_cycle_applications_on_cycle_application_id", using: :btree

  create_table "applicant_password_reset_requests", force: true do |t|
    t.string   "key",                     null: false
    t.datetime "used_at"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "persistent_applicant_id"
  end

  add_index "applicant_password_reset_requests", ["key"], name: "index_applicant_password_reset_requests_on_key", using: :btree

  create_table "applicants", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "other_name"
    t.string   "resident_state"
    t.string   "email"
    t.string   "citizen"
    t.string   "selective_service"
    t.boolean  "veteran"
    t.string   "birth_city"
    t.string   "birth_state"
    t.string   "birth_country"
    t.date     "birth_date"
    t.boolean  "decline_dob"
    t.string   "gender"
    t.string   "ethnicity"
    t.string   "disability"
    t.string   "crypted_password"
    t.boolean  "same_as_addr_1"
    t.string   "telephone_1"
    t.string   "telephone_2"
    t.string   "telephone_3"
    t.boolean  "privacy"
    t.string   "salt"
    t.boolean  "sharing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "no_patents"
    t.boolean  "no_leaderships"
    t.boolean  "no_teamworks"
    t.boolean  "no_researches"
    t.boolean  "no_memberships"
    t.boolean  "no_publications"
    t.boolean  "no_awards"
    t.boolean  "no_professionals"
    t.boolean  "no_volunteers"
    t.boolean  "no_gres"
    t.boolean  "no_certifications"
    t.boolean  "no_explanation"
    t.boolean  "no_leadership"
    t.boolean  "no_teamwork"
    t.boolean  "no_research"
    t.boolean  "no_membership"
    t.boolean  "no_volunteer"
    t.integer  "resource_applicant_id"
    t.boolean  "submitted"
    t.datetime "submitted_at"
    t.boolean  "withdrawn"
    t.datetime "withdrawn_at"
    t.integer  "primary_address_id"
    t.integer  "secondary_address_id"
  end

  add_index "applicants", ["created_at"], name: "index_applicants_on_created_at", using: :btree
  add_index "applicants", ["ethnicity"], name: "index_applicants_on_ethnicity", using: :btree
  add_index "applicants", ["gender"], name: "index_applicants_on_gender", using: :btree
  add_index "applicants", ["submitted"], name: "index_applicants_on_submitted", using: :btree
  add_index "applicants", ["updated_at"], name: "index_applicants_on_updated_at", using: :btree
  add_index "applicants", ["withdrawn"], name: "index_applicants_on_withdrawn", using: :btree

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_applicants", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`applicants` 
    WHERE (`#{applicants_database_name}`.`applicants`.`program_id` = #{applicants_program_id})
  }, :force => true

else

  create_table "applicants_applicants", id: false, force: true do |t|
    t.integer  "id",               default: 0,     null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "other_name"
    t.date     "birth_date"
    t.string   "email"
    t.boolean  "submitted",        default: false
    t.integer  "person_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_cycle_id"
    t.integer  "program_id"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_comments", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`comments` 
    WHERE (`#{applicants_database_name}`.`comments`.`program_id` = #{applicants_program_id})
  }, :force => true

else

  create_table "applicants_comments", id: false, force: true do |t|
    t.integer  "id",               default: 0, null: false
    t.integer  "applicant_id"
    t.text     "body"
    t.string   "created_by"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_gpa_checks", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`gpa_checks` 
    WHERE (`#{applicants_database_name}`.`gpa_checks`.`program_id` = #{applicants_program_id})
  }, :force => true

else

  create_table "applicants_gpa_checks", id: false, force: true do |t|
    t.integer  "id",                                     default: 0,     null: false
    t.integer  "school_id"
    t.decimal  "gpa_check_1",    precision: 8, scale: 2
    t.boolean  "checked",                                default: false
    t.integer  "checked_by"
    t.string   "checker_name"
    t.text     "notes"
    t.boolean  "recheck"
    t.boolean  "follow_up"
    t.integer  "credit_check_1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_gres", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`gres` 
    WHERE (`#{applicants_database_name}`.`gres`.`program_id` = #{applicants_program_id})
  }, :force => true

else

  create_table "applicants_gres", id: false, force: true do |t|
    t.integer  "id",                 default: 0, null: false
    t.integer  "applicant_id"
    t.string   "reg_number"
    t.date     "test_date"
    t.string   "test_type"
    t.integer  "score_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequence_number"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "first_name_matcher"
    t.string   "last_name_matcher"
    t.boolean  "manually_matched"
    t.integer  "program_id"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_people", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`people`
  }, :force => true

else

  create_table "applicants_people", id: false, force: true do |t|
    t.integer  "id",                        default: 0, null: false
    t.boolean  "active"
    t.string   "key",            limit: 50
    t.integer  "asee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "merged_into_id"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_program_cycles", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`program_cycles` 
    WHERE (`#{applicants_database_name}`.`program_cycles`.`program_id` = #{applicants_program_id})
  }, :force => true

else

  create_table "applicants_program_cycles", id: false, force: true do |t|
    t.integer  "id",                default: 0, null: false
    t.integer  "year"
    t.boolean  "match_scores"
    t.boolean  "match_transcripts"
    t.integer  "program_id"
    t.boolean  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_programs", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`programs` 
    WHERE (`#{applicants_database_name}`.`programs`.`name` = 'Rails_4_Test_App')
  }, :force => true

else

  create_table "applicants_programs", id: false, force: true do |t|
    t.integer  "id",         default: 0, null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

  create_table "applicants_races", id: false, force: true do |t|
    t.integer  "applicant_id"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicants_races", ["applicant_id"], name: "applicant_id", using: :btree
  add_index "applicants_races", ["race_id", "applicant_id"], name: "index_applicants_races_on_race_id_and_applicant_id", using: :btree

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_schools", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`schools` 
    WHERE (`#{applicants_database_name}`.`schools`.`program_id` = #{applicants_program_id})
  }, :force => true

else

  create_table "applicants_schools", id: false, force: true do |t|
    t.integer  "id",                                                 default: 0, null: false
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "degree"
    t.date     "degree_date"
    t.integer  "transcript_id"
    t.integer  "applicant_id"
    t.string   "application_id"
    t.integer  "discrepancy",                                        default: 0
    t.text     "signature"
    t.boolean  "auto_waived"
    t.boolean  "hand_waived"
    t.text     "waive_comment"
    t.datetime "waive_date"
    t.boolean  "bacc_inst"
    t.integer  "credits"
    t.string   "credit_type"
    t.decimal  "gpa",                        precision: 8, scale: 2
    t.string   "major"
    t.string   "gpa_base"
    t.string   "degree_status"
    t.integer  "sequence_number"
    t.boolean  "deleted_from_fastlane"
    t.boolean  "manually_unwaived"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "full_time"
    t.string   "fastlane_inst_id"
    t.boolean  "current"
    t.integer  "field_id"
    t.string   "field_detail"
    t.boolean  "graduate_courses"
    t.string   "dept"
    t.integer  "grad_semester_hours"
    t.integer  "grad_quarter_hours"
    t.string   "enrollment_level"
    t.string   "enrollment_status"
    t.integer  "resource_university_id"
    t.decimal  "gpa_for_major",              precision: 8, scale: 2
    t.integer  "university_id"
    t.integer  "fall_transcript_id"
    t.integer  "program_id"
    t.integer  "transcript_uploaded_pdf_id"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_scores", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`scores`
  }, :force => true

else

  create_table "applicants_scores", id: false, force: true do |t|
    t.integer  "id",                                 default: 0, null: false
    t.string   "ctype"
    t.date     "test_date"
    t.string   "v_score"
    t.string   "v_percent"
    t.string   "q_score"
    t.string   "q_percent"
    t.string   "a_score"
    t.string   "a_percent"
    t.string   "reg_number"
    t.string   "s_code"
    t.string   "s_score"
    t.string   "s_percent"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "gender",                   limit: 1
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "transfer_code"
    t.boolean  "nsf"
    t.integer  "gre_import_run_id"
    t.integer  "program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_id"
    t.string   "telephone"
    t.string   "email"
    t.integer  "examinee_sequence_number"
    t.string   "ets_file_name"
    t.string   "v_estimated"
    t.string   "q_estimated"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "applicants_transcripts", %{
    SELECT * 
    FROM `#{applicants_database_name}`.`transcripts` 
    WHERE (`#{applicants_database_name}`.`transcripts`.`program_id` = #{applicants_program_id})
  }, :force => true

else

  create_table "applicants_transcripts", id: false, force: true do |t|
    t.integer  "id",                              default: 0,     null: false
    t.datetime "received_at"
    t.datetime "scanned_at"
    t.string   "filename"
    t.string   "scan_batch"
    t.string   "gpa_check_1"
    t.string   "gpa_check_2"
    t.boolean  "gpa_reject"
    t.string   "gpa_resolve"
    t.boolean  "checked",                         default: false
    t.boolean  "rejected"
    t.text     "rejected_reason"
    t.string   "checker_name"
    t.integer  "checked_by"
    t.string   "created_by"
    t.integer  "previously_associated_school_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.boolean  "relabeled"
    t.string   "relabled_comment"
    t.string   "type"
    t.integer  "program_id"
    t.integer  "person_id"
  end

end

  create_table "apply_schools", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "degree"
    t.date     "degree_date"
    t.integer  "discrepancy"
    t.text     "signature"
    t.boolean  "auto_waived"
    t.boolean  "hand_waived"
    t.text     "waive_comment"
    t.datetime "waive_date"
    t.boolean  "bacc_inst"
    t.integer  "credits"
    t.string   "credit_type"
    t.decimal  "gpa",                        precision: 8, scale: 2
    t.string   "major"
    t.string   "gpa_base"
    t.string   "degree_status"
    t.integer  "sequence_number"
    t.boolean  "deleted_from_fastlane"
    t.boolean  "manually_unwaived"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "full_time"
    t.string   "fastlane_inst_id"
    t.boolean  "current"
    t.integer  "field_id"
    t.string   "field_detail"
    t.boolean  "graduate_courses"
    t.string   "dept"
    t.integer  "grad_semester_hours"
    t.integer  "grad_quarter_hours"
    t.string   "enrollment_level"
    t.string   "enrollment_status"
    t.integer  "resource_university_id"
    t.decimal  "gpa_for_major",              precision: 8, scale: 2
    t.integer  "university_id"
    t.integer  "fall_transcript_id"
    t.integer  "program_id"
    t.integer  "transcript_uploaded_pdf_id"
    t.integer  "cycle_application_id"
    t.string   "transcript"
    t.boolean  "transcript_verified",                                default: false
  end

  add_index "apply_schools", ["cycle_application_id"], name: "index_apply_schools_on_cycle_application_id", using: :btree

  create_table "awardee_password_reset_requests", force: true do |t|
    t.string   "key",                     default: "", null: false
    t.integer  "persistent_applicant_id"
    t.datetime "used_at"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "awardee_password_reset_requests", ["key"], name: "index_awardee_password_reset_requests_on_key", using: :btree

  create_table "awards", force: true do |t|
    t.string   "name"
    t.date     "received_date"
    t.boolean  "federal"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cycle_application_id"
  end

  add_index "awards", ["cycle_application_id"], name: "index_awards_on_cycle_application_id", using: :btree

  create_table "circumstances", force: true do |t|
    t.string "circumstance"
  end

  create_table "circumstances_references", id: false, force: true do |t|
    t.integer  "circumstance_id"
    t.integer  "reference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "body"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "countries", force: true do |t|
    t.string  "country"
    t.integer "display_order", default: 9999999
  end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "current_cycle_applications", %{
    SELECT * 
    FROM `rails4_testapp_development`.`applicants_program_cycles` 
    WHERE (`applicants_program_cycles`.`current` is true))
  }, :force => true

else

  create_table "current_cycle_applications", id: false, force: true do |t|
    t.integer  "id",                      default: 0,     null: false
    t.integer  "persistent_applicant_id"
    t.integer  "program_cycle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.datetime "pdf_generated_at"
    t.integer  "university_id"
    t.integer  "discipline_id"
    t.boolean  "submitted"
    t.boolean  "reviewed",                default: false
    t.boolean  "awarded",                 default: false
    t.integer  "version"
    t.datetime "submitted_at"
    t.string   "middle_name"
    t.string   "suffix"
    t.string   "other_name"
    t.string   "resident_state"
    t.string   "citizen"
    t.string   "selective_service"
    t.boolean  "veteran"
    t.string   "birth_city"
    t.string   "birth_state"
    t.string   "birth_country"
    t.date     "birth_date"
    t.boolean  "decline_dob"
    t.string   "gender"
    t.string   "ethnicity"
    t.string   "disability"
    t.boolean  "same_as_addr_1"
    t.string   "telephone_1"
    t.string   "telephone_2"
    t.string   "telephone_3"
    t.boolean  "privacy"
    t.boolean  "sharing"
    t.boolean  "no_patents"
    t.boolean  "no_leaderships"
    t.boolean  "no_teamworks"
    t.boolean  "no_researches"
    t.boolean  "no_memberships"
    t.boolean  "no_publications"
    t.boolean  "no_awards"
    t.boolean  "no_professionals"
    t.boolean  "no_volunteers"
    t.boolean  "no_gres"
    t.boolean  "no_certifications"
    t.boolean  "no_explanation"
    t.boolean  "no_leadership"
    t.boolean  "no_teamwork"
    t.boolean  "no_research"
    t.boolean  "no_membership"
    t.boolean  "no_volunteer"
    t.boolean  "withdrawn"
    t.datetime "withdrawn_at"
    t.integer  "primary_address_id"
    t.integer  "secondary_address_id"
    t.boolean  "complete",                default: false
  end

end

  create_table "cycle_application_versions", force: true do |t|
    t.integer  "cycle_application_id"
    t.integer  "version"
    t.integer  "persistent_applicant_id"
    t.integer  "program_cycle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_cycle_application_id"
    t.string   "pdf_file_name"
    t.datetime "pdf_generated_at"
    t.integer  "university_id"
    t.integer  "discipline_id"
    t.boolean  "submitted"
    t.boolean  "reviewed",                     default: false
    t.boolean  "awarded",                      default: false
    t.datetime "submitted_at"
    t.string   "middle_name"
    t.string   "suffix"
    t.string   "other_name"
    t.string   "resident_state"
    t.string   "citizen"
    t.string   "selective_service"
    t.boolean  "veteran"
    t.string   "birth_city"
    t.string   "birth_state"
    t.string   "birth_country"
    t.date     "birth_date"
    t.boolean  "decline_dob"
    t.string   "gender"
    t.string   "ethnicity"
    t.string   "disability"
    t.boolean  "same_as_addr_1"
    t.string   "telephone_1"
    t.string   "telephone_2"
    t.string   "telephone_3"
    t.boolean  "privacy"
    t.boolean  "sharing"
    t.boolean  "no_patents"
    t.boolean  "no_leaderships"
    t.boolean  "no_teamworks"
    t.boolean  "no_researches"
    t.boolean  "no_memberships"
    t.boolean  "no_publications"
    t.boolean  "no_awards"
    t.boolean  "no_professionals"
    t.boolean  "no_volunteers"
    t.boolean  "no_gres"
    t.boolean  "no_certifications"
    t.boolean  "no_explanation"
    t.boolean  "no_leadership"
    t.boolean  "no_teamwork"
    t.boolean  "no_research"
    t.boolean  "no_membership"
    t.boolean  "no_volunteer"
    t.boolean  "withdrawn"
    t.datetime "withdrawn_at"
    t.integer  "primary_address_id"
    t.integer  "secondary_address_id"
    t.boolean  "complete",                     default: false
  end

  add_index "cycle_application_versions", ["cycle_application_id"], name: "index_cycle_application_versions_on_cycle_application_id", using: :btree

  create_table "cycle_applications", force: true do |t|
    t.integer  "persistent_applicant_id"
    t.integer  "program_cycle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_name"
    t.datetime "pdf_generated_at"
    t.integer  "university_id"
    t.integer  "discipline_id"
    t.boolean  "submitted"
    t.boolean  "reviewed",                default: false
    t.boolean  "awarded",                 default: false
    t.integer  "version"
    t.datetime "submitted_at"
    t.string   "middle_name"
    t.string   "suffix"
    t.string   "other_name"
    t.string   "resident_state"
    t.string   "citizen"
    t.string   "selective_service"
    t.boolean  "veteran"
    t.string   "birth_city"
    t.string   "birth_state"
    t.string   "birth_country"
    t.date     "birth_date"
    t.boolean  "decline_dob"
    t.string   "gender"
    t.string   "ethnicity"
    t.string   "disability"
    t.boolean  "same_as_addr_1"
    t.string   "telephone_1"
    t.string   "telephone_2"
    t.string   "telephone_3"
    t.boolean  "privacy"
    t.boolean  "sharing"
    t.boolean  "no_patents"
    t.boolean  "no_leaderships"
    t.boolean  "no_teamworks"
    t.boolean  "no_researches"
    t.boolean  "no_memberships"
    t.boolean  "no_publications"
    t.boolean  "no_awards"
    t.boolean  "no_professionals"
    t.boolean  "no_volunteers"
    t.boolean  "no_gres"
    t.boolean  "no_certifications"
    t.boolean  "no_explanation"
    t.boolean  "no_leadership"
    t.boolean  "no_teamwork"
    t.boolean  "no_research"
    t.boolean  "no_membership"
    t.boolean  "no_volunteer"
    t.boolean  "withdrawn"
    t.datetime "withdrawn_at"
    t.integer  "primary_address_id"
    t.integer  "secondary_address_id"
    t.boolean  "complete",                default: false
  end

  add_index "cycle_applications", ["awarded"], name: "index_cycle_applications_on_awarded", using: :btree
  add_index "cycle_applications", ["complete"], name: "index_cycle_applications_on_complete", using: :btree
  add_index "cycle_applications", ["ethnicity"], name: "index_cycle_applications_on_ethnicity", using: :btree
  add_index "cycle_applications", ["gender"], name: "index_cycle_applications_on_gender", using: :btree
  add_index "cycle_applications", ["persistent_applicant_id"], name: "index_cycle_applications_on_persistent_applicant_id", using: :btree
  add_index "cycle_applications", ["primary_address_id"], name: "index_cycle_applications_on_primary_address_id", using: :btree
  add_index "cycle_applications", ["program_cycle_id"], name: "index_cycle_applications_on_program_cycle_id", using: :btree
  add_index "cycle_applications", ["reviewed"], name: "index_cycle_applications_on_reviewed", using: :btree
  add_index "cycle_applications", ["secondary_address_id"], name: "index_cycle_applications_on_secondary_address_id", using: :btree
  add_index "cycle_applications", ["withdrawn"], name: "index_cycle_applications_on_withdrawn", using: :btree

  create_table "cycle_applications_races", id: false, force: true do |t|
    t.integer  "cycle_application_id"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cycle_applications_races", ["cycle_application_id"], name: "index_cycle_applications_races_on_cycle_application_id", using: :btree
  add_index "cycle_applications_races", ["race_id"], name: "index_cycle_applications_races_on_race_id", using: :btree

  create_table "disciplines", force: true do |t|
    t.string  "discipline"
    t.integer "order_by"
  end

  create_table "essays", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cycle_application_id"
  end

  add_index "essays", ["cycle_application_id"], name: "index_essays_on_cycle_application_id", using: :btree

  create_table "fellowship_locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true
  end

  create_table "fellowships", force: true do |t|
    t.integer  "location_id"
    t.string   "discipline"
    t.string   "institution"
    t.integer  "amount"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "response"
    t.text     "response_notes"
    t.datetime "responded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
    t.integer  "cycle_application_id"
    t.string   "status"
    t.string   "sub_status"
  end

  add_index "fellowships", ["cycle_application_id"], name: "index_fellowships_on_cycle_application_id", using: :btree
  add_index "fellowships", ["location_id"], name: "index_fellowships_on_location_id", using: :btree
  add_index "fellowships", ["response"], name: "index_fellowships_on_response", using: :btree
  add_index "fellowships", ["status"], name: "index_fellowships_on_status", using: :btree
  add_index "fellowships", ["sub_status"], name: "index_fellowships_on_sub_status", using: :btree
  add_index "fellowships", ["university_id"], name: "index_fellowships_on_university_id", using: :btree

  create_table "interactions", force: true do |t|
    t.string   "interaction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interactions_references", id: false, force: true do |t|
    t.integer  "interaction_id"
    t.integer  "reference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legacy_applicant_counts", force: true do |t|
    t.string  "application_year"
    t.integer "number_started"
    t.integer "number_submitted"
    t.integer "year"
    t.integer "month"
  end

  create_table "notification_requests", force: true do |t|
    t.string   "email_address", limit: 500
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patents", force: true do |t|
    t.string   "patent_type"
    t.string   "title"
    t.string   "patent_number"
    t.text     "description"
    t.string   "inventors"
    t.date     "submission_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cycle_application_id"
  end

  add_index "patents", ["cycle_application_id"], name: "index_patents_on_cycle_application_id", using: :btree

  create_table "permissive_permissions", force: true do |t|
    t.integer "permitted_object_id"
    t.string  "permitted_object_type", limit: 32
    t.integer "scoped_object_id"
    t.string  "scoped_object_type",    limit: 32
    t.integer "mask",                             default: 0
    t.integer "grant_mask",                       default: 0
  end

  add_index "permissive_permissions", ["grant_mask"], name: "permissive_grant_masks", using: :btree
  add_index "permissive_permissions", ["mask"], name: "permissive_masks", using: :btree
  add_index "permissive_permissions", ["permitted_object_id", "permitted_object_type"], name: "permissive_permitted", using: :btree
  add_index "permissive_permissions", ["scoped_object_id", "scoped_object_type"], name: "permissive_scoped", using: :btree

  create_table "permissive_templates", force: true do |t|
    t.integer "parent_id"
    t.string  "name"
    t.integer "mask",      default: 0
  end

  add_index "permissive_templates", ["parent_id"], name: "index_permissive_templates_on_parent_id", using: :btree

  create_table "persistent_applicant_password_reset_requests", force: true do |t|
    t.string   "key",                     default: "", null: false
    t.integer  "persistent_applicant_id"
    t.datetime "used_at"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "persistent_applicant_password_reset_requests", ["key"], name: "index_pa_password_reset_requests_on_key", using: :btree
  add_index "persistent_applicant_password_reset_requests", ["persistent_applicant_id"], name: "index_pa_password_reset_requests_on_pa_id", using: :btree

  create_table "persistent_applicant_versions", force: true do |t|
    t.integer  "persistent_applicant_id"
    t.integer  "version"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "other_name"
    t.string   "resident_state"
    t.string   "email"
    t.string   "citizen"
    t.string   "selective_service"
    t.boolean  "veteran"
    t.string   "birth_city"
    t.string   "birth_state"
    t.string   "birth_country"
    t.date     "birth_date"
    t.boolean  "decline_dob"
    t.string   "gender"
    t.string   "ethnicity"
    t.string   "disability"
    t.string   "crypted_password"
    t.integer  "primary_address_id"
    t.integer  "secondary_address_id"
    t.string   "telephone_1"
    t.string   "telephone_2"
    t.string   "telephone_3"
    t.boolean  "privacy"
    t.string   "salt"
    t.boolean  "sharing"
    t.boolean  "deferral"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "merged_into_id"
    t.string   "alternate_email"
  end

  add_index "persistent_applicant_versions", ["persistent_applicant_id"], name: "index_persistent_applicant_versions_on_persistent_applicant_id", using: :btree

  create_table "persistent_applicants", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "other_name"
    t.string   "resident_state"
    t.string   "email"
    t.string   "citizen"
    t.string   "selective_service"
    t.boolean  "veteran"
    t.string   "birth_city"
    t.string   "birth_state"
    t.string   "birth_country"
    t.date     "birth_date"
    t.boolean  "decline_dob"
    t.string   "gender"
    t.string   "ethnicity"
    t.string   "disability"
    t.string   "crypted_password"
    t.integer  "primary_address_id"
    t.integer  "secondary_address_id"
    t.string   "telephone_1"
    t.string   "telephone_2"
    t.string   "telephone_3"
    t.boolean  "privacy"
    t.string   "salt"
    t.boolean  "sharing"
    t.boolean  "deferral"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "merged_into_id"
    t.integer  "version"
    t.string   "alternate_email"
  end

  add_index "persistent_applicants", ["email"], name: "index_persistent_applicants_on_email", using: :btree
  add_index "persistent_applicants", ["last_name"], name: "index_persistent_applicants_on_last_name", using: :btree
  add_index "persistent_applicants", ["primary_address_id"], name: "index_persistent_applicants_on_primary_address_id", using: :btree
  add_index "persistent_applicants", ["secondary_address_id"], name: "index_persistent_applicants_on_secondary_address_id", using: :btree

  create_table "persistent_applicants_races", id: false, force: true do |t|
    t.integer  "persistent_applicant_id"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "persistent_applicants_races", ["persistent_applicant_id"], name: "awardee_id", using: :btree
  add_index "persistent_applicants_races", ["race_id"], name: "index_persistent_applicants_races_on_race_id", using: :btree

  create_table "positions", force: true do |t|
    t.string "position"
  end

  create_table "professionals", force: true do |t|
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "agency"
    t.string   "other_agency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume"
    t.integer  "cycle_application_id"
  end

  add_index "professionals", ["cycle_application_id"], name: "index_professionals_on_cycle_application_id", using: :btree

  create_table "publications", force: true do |t|
    t.string   "authors"
    t.string   "title"
    t.string   "present_at"
    t.date     "present_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cycle_application_id"
  end

  add_index "publications", ["cycle_application_id"], name: "index_publications_on_cycle_application_id", using: :btree

  create_table "races", force: true do |t|
    t.string   "race"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", force: true do |t|
    t.string "rank"
  end

  create_table "references", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "institution"
    t.string   "department"
    t.string   "email"
    t.boolean  "active"
    t.string   "password"
    t.boolean  "notified"
    t.datetime "submitted_at"
    t.string   "time_known"
    t.boolean  "confidential"
    t.string   "environment_other"
    t.string   "interaction_other"
    t.string   "peer_education"
    t.string   "peer_major"
    t.string   "peer_institution"
    t.integer  "creativity_id"
    t.integer  "scholarly_promise_id"
    t.integer  "research_ability_id"
    t.integer  "initiative_id"
    t.integer  "leadership_potential_id"
    t.integer  "overall_scientific_ability_id"
    t.string   "letter"
    t.boolean  "complete"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "scrubbed"
    t.integer  "cycle_application_id"
    t.string   "other_position"
  end

  add_index "references", ["cycle_application_id"], name: "index_references_on_cycle_application_id", using: :btree

  create_table "states", force: true do |t|
    t.string "state"
    t.string "full_name"
  end

  create_table "studies", force: true do |t|
    t.integer  "discipline_id"
    t.string   "specialization"
    t.boolean  "comp_sci"
    t.string   "proposed_school_name"
    t.string   "proposed_school_city"
    t.string   "proposed_school_state"
    t.string   "proposed_school_country"
    t.string   "academic_status"
    t.string   "academic_advisor"
    t.boolean  "five_year_masters"
    t.boolean  "four_year_masters"
    t.boolean  "undecided"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "proposed_start_date"
    t.date     "proposed_grad_date"
    t.string   "proposed_degree"
    t.boolean  "degree_enrolled"
    t.boolean  "inst_enrolled"
    t.string   "other_discipline"
    t.integer  "university_id"
    t.integer  "cycle_application_id"
  end

  add_index "studies", ["cycle_application_id"], name: "index_studies_on_cycle_application_id", using: :btree
  add_index "studies", ["discipline_id"], name: "index_studies_on_discipline_id", using: :btree
  add_index "studies", ["university_id"], name: "index_studies_on_university_id", using: :btree

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "universities_aliases", %{
    SELECT * 
    FROM `#{universities_database_name}`.`aliases`
  }, :force => true

else

  create_table "universities_aliases", id: false, force: true do |t|
    t.integer "university_id"
    t.string  "incorrect_name", limit: 150
    t.string  "city",           limit: 150
    t.integer "id",                         default: 0, null: false
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "universities_bursars", %{
    SELECT * 
    FROM `#{universities_database_name}`.`bursars`
  }, :force => true

else

  create_table "universities_bursars", id: false, force: true do |t|
    t.integer  "id",            default: 0, null: false
    t.integer  "university_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.string   "payment_type"
    t.boolean  "undergrad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "universities_msi_classification_types", %{
    SELECT * 
    FROM `#{universities_database_name}`.`msi_classification_types`
  }, :force => true

else

  create_table "universities_msi_classification_types", id: false, force: true do |t|
    t.integer  "id",           default: 0, null: false
    t.string   "name"
    t.string   "abbreviation"
    t.text     "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "universities_msi_data_sets", %{
    SELECT * 
    FROM `#{universities_database_name}`.`msi_data_sets`
  }, :force => true

else

  create_table "universities_msi_data_sets", id: false, force: true do |t|
    t.integer  "id",                         default: 0, null: false
    t.text     "notes"
    t.string   "imported_by"
    t.datetime "imported_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "msi_classification_type_id"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "universities_universities", %{
    SELECT * 
    FROM `#{universities_database_name}`.`universities`
  }, :force => true

else

  create_table "universities_universities", id: false, force: true do |t|
    t.integer  "id",                                                                             default: 0,     null: false
    t.integer  "unit_id"
    t.integer  "fice"
    t.string   "name"
    t.string   "sort_name"
    t.string   "city"
    t.string   "state"
    t.string   "country",                                    limit: 2,                           default: "US"
    t.integer  "control"
    t.integer  "cc_2000"
    t.integer  "cc_1994"
    t.decimal  "gpa_basis",                                              precision: 8, scale: 2
    t.boolean  "uniform_basis",                                                                  default: true,  null: false
    t.boolean  "carnegie",                                                                       default: false, null: false
    t.string   "gpa_notes",                                  limit: 200
    t.boolean  "has_back",                                                                       default: false, null: false
    t.string   "filename",                                   limit: 50
    t.boolean  "hbcu",                                                                           default: false, null: false
    t.string   "scan_date",                                  limit: 50
    t.string   "scan_batch",                                 limit: 50
    t.boolean  "research_schools"
    t.boolean  "university",                                                                     default: false
    t.integer  "nsf_top_research_school"
    t.boolean  "his",                                                                            default: false
    t.integer  "cc_2006_undergrad"
    t.integer  "cc_2006_grad"
    t.integer  "cc_2006_basic"
    t.datetime "updated_at"
    t.boolean  "has_gpa_basis"
    t.boolean  "smart_minority"
    t.boolean  "nsfgrfp_top_40",                                                                 default: false
    t.boolean  "nsfgrfp_benefitting_most_from_awards",                                           default: false
    t.string   "transcript_back_filename"
    t.boolean  "community_college"
    t.integer  "carnegie_classifications_2010_basic_id"
    t.integer  "carnegie_classifications_2010_undergrad_id"
    t.integer  "carnegie_classifications_2010_grad_id"
    t.boolean  "onr_minority"
    t.string   "accounting_name"
  end

end

if ViewsInMigrations.use_views?(current_database)
  #############################################################
  # Warning: SchemaDumper cannot determine view dependencies! #
  #   You may have to manually reorder your views to run      #
  # `rake db:schema:load` successfully.                       #
  #############################################################

  create_view "universities_university_msi_classifications", %{
    SELECT * 
    FROM `#{universities_database_name}`.`university_msi_classifications`
  }, :force => true

else

  create_table "universities_university_msi_classifications", id: false, force: true do |t|
    t.integer  "id",              default: 0, null: false
    t.integer  "university_id"
    t.integer  "msi_data_set_id"
    t.datetime "enabled_at"
    t.datetime "disabled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

end
