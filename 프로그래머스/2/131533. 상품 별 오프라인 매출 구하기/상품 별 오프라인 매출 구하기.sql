SELECT  P.PRODUCT_CODE
     ,  P.PRICE * O.SALE_CNT    AS SALES
  FROM  PRODUCT P
     ,  (
            SELECT  PRODUCT_ID
                 ,  SUM(SALES_AMOUNT)   AS SALE_CNT
              FROM  OFFLINE_SALE
             GROUP BY PRODUCT_ID
        )       O
 WHERE  P.PRODUCT_ID    = O.PRODUCT_ID
 ORDER BY SALES DESC, P.PRODUCT_CODE
;