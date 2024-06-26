SELECT  USER_ID
     ,  PRODUCT_ID
  FROM  (
            SELECT  USER_ID
                 ,  PRODUCT_ID
                 ,  COUNT(*)        AS CNT
              FROM  ONLINE_SALE 
             GROUP BY USER_ID, PRODUCT_ID
             ORDER BY USER_ID
        )
 WHERE  CNT <> 1
 ORDER BY USER_ID, PRODUCT_ID DESC
;
 