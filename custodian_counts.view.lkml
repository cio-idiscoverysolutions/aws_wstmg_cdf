view: custodian_counts {
  sql_table_name: dbo.CustodianCounts ;;

  dimension: col_nm {
    type: string
    sql: ${TABLE}.colNm ;;
  }

  dimension: rec_count {
    type: number
    sql: ${TABLE}.recCount ;;
  }

  dimension: table_nm {
    type: string
    sql: ${TABLE}.tableNm ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
