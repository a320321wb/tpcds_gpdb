DROP EXTERNAL TABLE IF EXISTS ext_make_space;
CREATE EXTERNAL WEB TABLE ext_make_space ( result TEXT ) EXECUTE 'mkdir -p $GP_SEG_DATADIR/TPCDS' FORMAT 'TEXT';

DROP EXTERNAL TABLE IF EXISTS ext_get_dsdgen;
CREATE EXTERNAL WEB TABLE ext_get_dsdgen ( result TEXT ) EXECUTE 'curl -o $GP_SEG_DATADIR/TPCDS/dsdgen http://$GP_MASTER_HOST:7000/assets/dsdgen' FORMAT 'TEXT';

DROP EXTERNAL TABLE IF EXISTS ext_get_dsdgen_do;
CREATE EXTERNAL WEB TABLE ext_get_dsdgen_do ( result TEXT ) EXECUTE 'curl -o $GP_SEG_DATADIR/TPCDS/dsdgen_do http://$GP_MASTER_HOST:7000/assets/dsdgen_do' FORMAT 'TEXT';

DROP EXTERNAL TABLE IF EXISTS ext_get_tpcdsidx;
CREATE EXTERNAL WEB TABLE ext_get_tpcdsidx ( result TEXT ) EXECUTE 'curl -o $GP_SEG_DATADIR/TPCDS/tpcds.idx http://$GP_MASTER_HOST:7000/assets/tpcds.idx' FORMAT 'TEXT';

DROP EXTERNAL TABLE IF EXISTS ext_chmod_dsdgen;
CREATE EXTERNAL WEB TABLE ext_chmod_dsdgen ( result TEXT ) EXECUTE 'chmod u+x $GP_SEG_DATADIR/TPCDS/dsdgen' FORMAT 'TEXT';

DROP EXTERNAL TABLE IF EXISTS ext_chmod_dsdgen_do;
CREATE EXTERNAL WEB TABLE ext_chmod_dsdgen_do ( result TEXT ) EXECUTE 'chmod u+x $GP_SEG_DATADIR/TPCDS/dsdgen_do' FORMAT 'TEXT';

DROP EXTERNAL TABLE ext_file_list;
CREATE EXTERNAL WEB TABLE ext_file_list ( result TEXT ) EXECUTE 'ls -1 $GP_SEG_DATADIR/TPCDS/' FORMAT 'TEXT';
