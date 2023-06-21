SELECT  O.YEAR
     ,  O.MONTH     
     ,  COUNT(U.USER_ID)    AS PUCHASED_USERS
     ,  ROUND(COUNT(U.USER_ID) / MAX(U.USER_COUNT), 1)  AS PUCHASED_RATIO
  FROM  (
            SELECT  USER_ID
                 ,  SUM(USER_COUNT) OVER(PARTITION BY USER_COUNT)   AS USER_COUNT
              FROM  (
                        SELECT  USER_ID
                             ,  COUNT(USER_ID) OVER(PARTITION BY USER_ID)   AS USER_COUNT
                             ,  TO_CHAR(JOINED, 'YYYYMM')                   AS JOINED
                          FROM  USER_INFO
                         WHERE  TO_CHAR(JOINED, 'YYYY') LIKE '2021'
                    )
        )       U
     ,  (
            SELECT  YEAR
                 ,  MONTH
                 ,  USER_ID
              FROM  (
                        SELECT  MAX(SUBSTR(TO_CHAR(SALES_DATE, 'YYYYMM'), 0, 4))        AS YEAR
                             ,  TO_NUMBER(SUBSTR(TO_CHAR(SALES_DATE, 'YYYYMM'), 5, 2))  AS MONTH
                             ,  USER_ID
                          FROM  ONLINE_SALE
                         GROUP BY SUBSTR(TO_CHAR(SALES_DATE, 'YYYYMM'), 5, 2), USER_ID
                         ORDER BY SUBSTR(TO_CHAR(SALES_DATE, 'YYYYMM'), 5, 2), USER_ID
                    )
        )       O
 WHERE  U.USER_ID       = O.USER_ID
 GROUP BY O.YEAR, O.MONTH
 ORDER BY O.YEAR, O.MONTH