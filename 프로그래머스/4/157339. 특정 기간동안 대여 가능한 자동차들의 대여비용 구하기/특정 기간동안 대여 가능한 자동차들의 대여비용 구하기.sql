SELECT  *
  FROM  (
            SELECT  CC.CAR_ID
                 ,  CC.CAR_TYPE
                 ,  (CC.DAILY_FEE * 30) - (CC.DAILY_FEE * 30 * CD.DISCOUNT_RATE / 100) AS FEE

              FROM  CAR_RENTAL_COMPANY_CAR              CC
                 ,  (
                        SELECT  CAR_ID
                             ,  TO_CHAR(MIN(START_DATE), 'YYYYMMDD')    AS START_DATE
                             ,  TO_CHAR(MAX(END_DATE)  , 'YYYYMMDD')    AS END_DATE
                          FROM  CAR_RENTAL_COMPANY_RENTAL_HISTORY
                         GROUP BY CAR_ID
                    )                                   CR
                 ,  CAR_RENTAL_COMPANY_DISCOUNT_PLAN    CD
             WHERE  CC.CAR_ID   = CR.CAR_ID
               AND  CC.CAR_TYPE = CD.CAR_TYPE
               AND  CC.CAR_TYPE IN ('세단', 'SUV')
               AND  CR.START_DATE < '20221101'
               AND  CR.END_DATE   < '20221101'
               AND  CD.DURATION_TYPE IN ('30일 이상')
        )
 WHERE  FEE BETWEEN '500000' AND '2000000'
 ORDER BY FEE DESC, CAR_TYPE
;