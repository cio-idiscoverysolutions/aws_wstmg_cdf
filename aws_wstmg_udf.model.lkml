connection: "aws_wstmg-udf"

# include all the views
include: "*.view"

datagroup: aws_wstmg_cdf_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aws_wstmg_cdf_default_datagroup

explore: i_ds_gps_data_anchors_of_interest {}

# - explore: db_settings

# - explore: gps_temp

explore: i_ds_gps_data {}

explore: cdf_stats {}
# - explore: primary_audit

# - explore: relationship

# - explore: script
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${script.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: seq_results_temp

# - explore: user_saves
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${user_saves.user_id} = ${users.user_id}
#       relationship: many_to_one


# - explore: users
