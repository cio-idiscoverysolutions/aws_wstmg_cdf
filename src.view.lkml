view: src {
  sql_table_name: dim.SRC ;;

  dimension: src_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.SRC_ID ;;
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

  dimension_group: date_lastmodified {
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
    sql: ${TABLE}.DATE_LASTMODIFIED ;;
  }

  dimension_group: date_source {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATE_SOURCE ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: disp_name {
    type: string
    sql: ${TABLE}.DISP_NAME ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.TYPE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [src_id, name, disp_name, udf.count]
  }
}
