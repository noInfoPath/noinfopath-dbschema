CREATE
    ALGORITHM = UNDEFINED
    DEFINER = CURRENT_USER @`%` 
    SQL SECURITY DEFINER
VIEW `vw_noinfopath_dbschema` AS
    SELECT
        `information_schema`.`COLUMNS`.`TABLE_CATALOG` AS `TABLE_CATALOG`,
        `information_schema`.`COLUMNS`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,
        `information_schema`.`COLUMNS`.`TABLE_NAME` AS `TABLE_NAME`,
        `information_schema`.`TABLES`.`TABLE_TYPE` AS `TABLE_TYPE`,
        `information_schema`.`COLUMNS`.`COLUMN_NAME` AS `COLUMN_NAME`,
        `information_schema`.`COLUMNS`.`ORDINAL_POSITION` AS `ORDINAL_POSITION`,
        `information_schema`.`COLUMNS`.`COLUMN_DEFAULT` AS `COLUMN_DEFAULT`,
        `information_schema`.`COLUMNS`.`IS_NULLABLE` AS `IS_NULLABLE`,
        `information_schema`.`COLUMNS`.`DATA_TYPE` AS `DATA_TYPE`,
        `information_schema`.`COLUMNS`.`CHARACTER_MAXIMUM_LENGTH` AS `CHARACTER_MAXIMUM_LENGTH`,
        `information_schema`.`COLUMNS`.`CHARACTER_OCTET_LENGTH` AS `CHARACTER_OCTET_LENGTH`,
        `information_schema`.`COLUMNS`.`NUMERIC_PRECISION` AS `NUMERIC_PRECISION`,
        `information_schema`.`COLUMNS`.`NUMERIC_SCALE` AS `NUMERIC_SCALE`,
        `information_schema`.`COLUMNS`.`DATETIME_PRECISION` AS `DATETIME_PRECISION`,
        `information_schema`.`COLUMNS`.`CHARACTER_SET_NAME` AS `CHARACTER_SET_NAME`,
        `information_schema`.`COLUMNS`.`COLLATION_NAME` AS `COLLATION_NAME`,
        `information_schema`.`COLUMNS`.`COLUMN_TYPE` AS `COLUMN_TYPE`,
        `information_schema`.`COLUMNS`.`COLUMN_KEY` AS `COLUMN_KEY`,
        `information_schema`.`COLUMNS`.`EXTRA` AS `EXTRA`,
        `information_schema`.`COLUMNS`.`PRIVILEGES` AS `PRIVILEGES`,
        `information_schema`.`COLUMNS`.`COLUMN_COMMENT` AS `COLUMN_COMMENT`,
        `information_schema`.`COLUMNS`.`GENERATION_EXPRESSION` AS `GENERATION_EXPRESSION`
    FROM
        (`information_schema`.`TABLES`
        JOIN `information_schema`.`COLUMNS` ON (((`information_schema`.`TABLES`.`TABLE_SCHEMA` = `information_schema`.`COLUMNS`.`TABLE_SCHEMA`)
            AND (`information_schema`.`TABLES`.`TABLE_NAME` = `information_schema`.`COLUMNS`.`TABLE_NAME`))))
    WHERE
        ((`information_schema`.`TABLES`.`TABLE_TYPE` IN ('BASE TABLE' , 'VIEW'))
            AND (`information_schema`.`COLUMNS`.`TABLE_SCHEMA` = 'HSLSOPDB_V1')
            AND (`information_schema`.`COLUMNS`.`TABLE_NAME` <> 'security'))
