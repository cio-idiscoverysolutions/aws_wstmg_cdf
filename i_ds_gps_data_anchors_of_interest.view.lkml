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
      year
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
      year
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
    drill_fields: [full_name]
  }
}
