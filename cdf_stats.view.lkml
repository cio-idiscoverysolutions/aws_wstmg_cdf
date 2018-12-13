view: cdf_stats {
  sql_table_name: dbo.CDF_STATS ;;

  dimension: cdf_statid {
    primary_key: yes
    type: number
    sql: ${TABLE}.CDF_STATID ;;
  }

  dimension: cdf_tablename {
    type: string
    sql: ${TABLE}.CDF_TABLENAME ;;
  }

  dimension: cnt {
    type: number
    sql: ${TABLE}.CNT ;;
  }

  dimension_group: dt_stats_updated {
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
    sql: ${TABLE}.DT_STATS_UPDATED ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.MONTH ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.YEAR ;;
  }

  measure: count {
    type: count
    drill_fields: [cdf_statid, cdf_tablename]
  }
}
