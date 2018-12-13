view: i_ds_gps_data_anchors_of_interest {
  sql_table_name: dbo.iDS_GPS_DATA_AnchorsOfInterest ;;

  dimension: anc_id {
    type: number
    sql: ${TABLE}.ANC_ID ;;
  }

  dimension_group: from {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour_of_day
    ]
    sql: ${TABLE}."From" ;;
  }
  dimension: anc_lat {
    type: number
    sql: ${TABLE}.ANC_LAT ;;
  }

  dimension: anc_lon {
    type: number
    sql: ${TABLE}.ANC_LON ;;
  }
  dimension: full_name {
    type: string
    sql: ${TABLE}.FULL_NAME ;;
  }

  dimension: ss {
    type: number
    sql: ${TABLE}.ss ;;
    label: "Duration (Minutes)"
  }

  dimension: target_id {
    type: number
    sql: ${TABLE}.TARGET_ID ;;
  }

  dimension_group: to {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour_of_day
    ]
    sql: ${TABLE}."To" ;;
  }
  dimension: anc_location {
    type: location
    sql_latitude: ${anc_lat} ;;
    sql_longitude: ${anc_lon} ;;
  }
  measure: count {
    type: count
    drill_fields: [full_name, anc_id, from_time, to_time, ss]
  }
  measure: sum {
    type: sum
    sql: ${ss} ;;
    drill_fields: [full_name, anc_id, from_time, to_time, ss]
    view_label: "Total Minutes Spent"
  }
}
