set client_encoding to 'latin1'

INSERT INTO dbgen_version SELECT * FROM ext_dbgen_version;
INSERT INTO customer_address SELECT * FROM ext_customer_address;
INSERT INTO customer_demographics SELECT * FROM ext_customer_demographics;
INSERT INTO date_dim SELECT * FROM ext_date_dim;
INSERT INTO warehouse SELECT * FROM ext_warehouse;
INSERT INTO ship_mode SELECT * FROM ext_ship_mode;
INSERT INTO time_dim SELECT * FROM ext_time_dim;
INSERT INTO reason SELECT * FROM ext_reason;
INSERT INTO income_band SELECT * FROM ext_income_band;
INSERT INTO item SELECT * FROM ext_item;
INSERT INTO store SELECT * FROM ext_store;
INSERT INTO call_center SELECT * FROM ext_call_center;
INSERT INTO customer SELECT * FROM ext_customer;
INSERT INTO web_site SELECT * FROM ext_web_site;
INSERT INTO store_returns SELECT * FROM ext_store_returns;
INSERT INTO household_demographics SELECT * FROM ext_household_demographics;
INSERT INTO web_page SELECT * FROM ext_web_page;
INSERT INTO promotion SELECT * FROM ext_promotion;
INSERT INTO catalog_page SELECT * FROM ext_catalog_page;
INSERT INTO inventory SELECT * FROM ext_inventory;
INSERT INTO catalog_returns SELECT * FROM ext_catalog_returns;
INSERT INTO web_returns SELECT * FROM ext_web_returns;
INSERT INTO web_sales SELECT * FROM ext_web_sales;
INSERT INTO catalog_sales SELECT * FROM ext_catalog_sales;
INSERT INTO store_sales SELECT * FROM ext_store_sales;
