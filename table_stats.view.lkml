view: table_stats {
  sql_table_name: dbo.TableStats ;;

  dimension: delivery_name {
    type: string
    sql: ${TABLE}.DeliveryName ;;
  }

  dimension: row_cnt {
    type: number
    sql: ${TABLE}.RowCnt ;;
  }

  measure: count {
    type: count
    drill_fields: [delivery_name]
  }
}
