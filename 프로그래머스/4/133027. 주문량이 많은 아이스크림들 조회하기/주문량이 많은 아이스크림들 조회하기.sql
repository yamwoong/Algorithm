SELECT  FLAVOR
  FROM  (
            SELECT  H.FLAVOR
                 ,  H.TOTAL_ORDER + J.ORDER_SUM AS TOTAL_SUM
              FROM  FIRST_HALF  H
                 ,  (
                        SELECT  FLAVOR
                             ,  SUM(TOTAL_ORDER) AS ORDER_SUM
                          FROM  JULY
                         GROUP BY FLAVOR
                         ORDER BY FLAVOR
                    )           J
             WHERE  H.FLAVOR    = J.FLAVOR
             ORDER BY TOTAL_SUM DESC
        )
 WHERE  ROWNUM <= 3
;