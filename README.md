# tpcds_gpdb

TPCDS Data generation powered by SQL and gpfdist.

The goals are to create a easily runnable and editable set of tools that will create and import TPCDS data.

In short the scripts will setup a gpfdist on the master to help distribute files to the segments.
It will then dynamically determine the number of segments and run a parallel TPCDS data generation
equal to the number of segments in the system and create gpfdist instances for each of these data
sets. 

Needed:
-- GPDB
-- gcc ( on Master to build tpcds tools )
-- greenplum or hawq installation
-- system with 4x capacity of the target data size ( see note 1 )

Todo:
-- Scale factore needs to be manually set. Need to make this dynamic
-- Verification Scripts
-- Cleanup Scripts

Executing:
  cd assets
  ./prep.sh
  cd ..
  cd sql
  psql -c "CREATE DATABASE tpcds"
  vim 03_create_generate_data_external_table.sql # Edit the number to represent the scale you wish to run at
  psql -f 01_create_external_tables.sql tpcds
  psql -f 02_execute_prep_queries.sql tpcds
  psql -f 03_create_generate_data_external_table.sql tpcds
  psql -f 04_generate_data.sql tpcds
  psql -f 05_create_gpfdist_init_external_table.sql tpcds
  psql -f 06_start_seg_gpfdist.sql tpcds
  psql -f 07_internal_tables.sql tpcds
  bash 08_make_externals.sh
  psql -f 09_externals.sql tpcds
  psql -f 10_insert.sql tpcds
  psql -f 11_analyze.sql tpcds

Notes:
  1 - 4x capacity is recommended. 1x - The data itself, 2+3x - In database primary + mirror, 4x scratch space and other files
 
