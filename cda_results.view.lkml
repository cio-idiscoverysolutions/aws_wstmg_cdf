view: cda_results {
  sql_table_name: cda.CDA_RESULTS ;;

  dimension: cda_results_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.CDA_RESULTS_ID ;;
  }

  dimension: cda_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.CDA_ID ;;
  }

  dimension_group: date_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATE_CREATED ;;
  }

  dimension: results_bool_value {
    type: string
    sql: ${TABLE}.RESULTS_BOOL_VALUE ;;
  }

  dimension_group: results_date_value {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.RESULTS_DATE_VALUE ;;
  }

  dimension: results_notes {
    type: string
    sql: ${TABLE}.RESULTS_NOTES ;;
  }

  dimension: results_num_value {
    type: number
    sql: ${TABLE}.RESULTS_NUM_VALUE ;;
  }

  dimension: results_text_value {
    type: string
    sql: ${TABLE}.RESULTS_TEXT_VALUE ;;
  }

  dimension: udf_id {
    type: number
    sql: ${TABLE}.UDF_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [cda_results_id, cda.cda_id, cda.name]
  }
}
