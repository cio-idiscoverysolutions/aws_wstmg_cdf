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

explore: evt {}

explore: loc {}

explore: obj {}

explore: ppl {}

explore: cda {}

explore: cda_results {
  join: cda{
    type: inner
    sql_on: ${cda.cda_id} = ${cda.cda_id};;
    relationship: many_to_one
    view_label: "CDA Results"

  }
}


explore: udf {
  label: "Universal Data Format"
  join: ppl{
    type: left_outer
    sql_on: ${udf.ppl_id} = ${ppl.ppl_id} ;;
    relationship: one_to_many
    view_label: "People"

  }

  join: obj{
    type: left_outer
    sql_on: ${udf.obj_id} = ${obj.obj_id} ;;
    relationship: one_to_many
    view_label: "Object"
  }
  join: loc{
    type: left_outer
    sql_on: ${udf.loc_id} = ${loc.loc_id} ;;
    relationship: one_to_many
  }
  join: evt{
    type: left_outer
    sql_on: ${udf.evt_id} = ${evt.evt_id} ;;
    relationship: one_to_many
  }
  join: src{
    type: left_outer
    sql_on: ${udf.src_id} = ${src.src_id} ;;
    relationship: one_to_many
  }
  join: cda_results{
    type: left_outer
    sql_on: ${udf.udf_id} = ${cda_results.udf_id} ;;
    relationship: many_to_many
  }
  join: cda{
    type: left_outer
    sql_on: ${udf.udf_id} = ${cda_results.udf_id} AND ${cda_results.cda_id} = ${cda.cda_id} ;;
    relationship: many_to_many
  }
}
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
