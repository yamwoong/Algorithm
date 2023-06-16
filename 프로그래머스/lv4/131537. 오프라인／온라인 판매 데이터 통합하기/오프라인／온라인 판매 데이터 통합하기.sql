SELECT  *
  FROM  (
            SELECT  TO_CHAR(SALES_DATE, 'YYYY-MM-DD')   AS SALES_DATE
                 ,  PRODUCT_ID
                 ,  USER_ID
                 ,  SALES_AMOUNT
              FROM  ONLINE_SALE
             WHERE  TO_CHAR(SALES_DATE, 'YYYYMMDD') LIKE '202203%'

            UNION ALL

            SELECT  TO_CHAR(SALES_DATE, 'YYYY-MM-DD')   AS SALES_DATE
                 ,  PRODUCT_ID
                 ,  TO_NUMBER('')                                  AS USER_ID
                 ,  SALES_AMOUNT
              FROM  OFFLINE_SALE
             WHERE  TO_CHAR(SALES_DATE, 'YYYYMMDD') LIKE '202203%'
        )
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID