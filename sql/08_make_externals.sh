#!/bin/bash

TABLES=( dbgen_version call_center catalog_page catalog_returns catalog_sales customer customer_address customer_demographics date_dim household_demographics income_band inventory item promotion reason ship_mode store store_returns store_sales time_dim warehouse web_page web_returns web_sales web_site )



for TABLENAME in "${TABLES[@]}"
  do
  TABLECOUNT=($(psql -t -c "select count(1) from ext_file_list where result ~ '${TABLENAME}_[0-9]+_[0-9]+.psv' order by 1" tpcds))
  if [ $TABLECOUNT -eq 1 ]
  then
    DISTLOCATIONS=($(psql -t -c "select 'gpfdist://' || hostname || ':' || (content + 7001) || '/${TABLENAME}_' || (content + 1 ) || '_' || ( SELECT COUNT(1) FROM gp_segment_configuration WHERE content > -1 AND role = 'p' ) || '.psv' from gp_segment_configuration where content > -1 and role = 'p' ORDER BY content ASC LIMIT 1;"))
    COMBINED=${DISTLOCATIONS[*]}

    COMBINED=$(echo "$COMBINED" | sed "s/^/LOCATION ('/" | sed "s/$/')/g" | sed "s/.psv /.psv','/g")

    echo "DROP EXTERNAL TABLE IF EXISTS ext_${TABLENAME};" >> 09_externals.sql
    echo "CREATE EXTERNAL TABLE ext_${TABLENAME} ( LIKE ${TABLENAME} ) $COMBINED FORMAT 'TEXT' (DELIMITER '|' NULL AS '') ENCODING 'LATIN1';" >> 09_externals.sql
  else
    DISTLOCATIONS=($(psql -t -c "select 'gpfdist://' || hostname || ':' || (content + 7001) || '/${TABLENAME}_' || (content + 1 ) || '_' || ( SELECT COUNT(1) FROM gp_segment_configuration WHERE content > -1 AND role = 'p' ) || '.psv' from gp_segment_configuration where content > -1 and role = 'p';"))
    COMBINED=${DISTLOCATIONS[*]}

    COMBINED=$(echo "$COMBINED" | sed "s/^/LOCATION ('/" | sed "s/$/')/g" | sed "s/\.psv /\.psv','/g")

    echo "DROP EXTERNAL TABLE IF EXISTS ext_${TABLENAME};" >> 09_externals.sql
    echo "CREATE EXTERNAL TABLE ext_${TABLENAME} ( LIKE ${TABLENAME} ) $COMBINED FORMAT 'TEXT' (DELIMITER '|' NULL AS '') ENCODING 'LATIN1';" >> 09_externals.sql
  fi
  done

exit
