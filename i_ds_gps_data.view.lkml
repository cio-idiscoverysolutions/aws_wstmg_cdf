view: i_ds_gps_data {
  sql_table_name: dbo.iDS_GPS_DATA ;;

  dimension: anc_id {
    type: number
    sql: ${TABLE}.ANC_ID ;;
  }

  dimension: anc_lat {
    type: number
    sql: ${TABLE}.ANC_LAT ;;
  }

  dimension: anc_lon {
    type: number
    sql: ${TABLE}.ANC_LON ;;
  }

  dimension_group: date_source {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,day_of_week
    ]
    sql: ${TABLE}.DATE_SOURCE ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.FULL_NAME ;;
  }

  dimension: gps_id {
    type: number
    sql: ${TABLE}.GPS_ID ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.LAT ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.LON ;;
  }

  dimension: nx_delta_ft {
    type: number
    sql: ${TABLE}.NX_DELTA_FT ;;
  }

  dimension: nx_delta_secs {
    type: number
    sql: ${TABLE}.NX_DELTA_SECS ;;
  }

  dimension: target_id {
    type: number
    sql: ${TABLE}.TARGET_ID ;;
  }
  dimension: gps_location {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${lon} ;;
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
