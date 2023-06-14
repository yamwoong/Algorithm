SELECT  R.HISTORY_ID
     ,  NVL(R.FEE - (R.FEE * P.DISCOUNT_RATE / 100), R.FEE) AS FEE
  FROM  (
            SELECT  C.CAR_ID
                 ,  H.HISTORY_ID
                 ,  C.CAR_TYPE
                 ,  C.DAILY_FEE
                 ,  H.END_DATE - H.START_DATE + 1   AS  DAY
                 ,  C.DAILY_FEE * (H.END_DATE - H.START_DATE + 1)   AS FEE
                 ,  CASE WHEN TO_NUMBER(H.END_DATE - H.START_DATE) > 5  AND TO_NUMBER(H.END_DATE - H.START_DATE) < 30 THEN 10
                         WHEN TO_NUMBER(H.END_DATE - H.START_DATE) > 29 AND TO_NUMBER(H.END_DATE - H.START_DATE) < 90 THEN 11
                         WHEN TO_NUMBER(H.END_DATE - H.START_DATE) > 89  THEN 12
                         ELSE 0
                    END     AS TRUCK_PLAN_ID
              FROM  CAR_RENTAL_COMPANY_CAR              C
                 ,  CAR_RENTAL_COMPANY_RENTAL_HISTORY   H
             WHERE  C.CAR_ID        = H.CAR_ID
               AND  C.CAR_TYPE      = '트럭'
        )                                   R
     ,  CAR_RENTAL_COMPANY_DISCOUNT_PLAN    P
 WHERE  R.CAR_TYPE      = P.CAR_TYPE(+)
   AND  R.TRUCK_PLAN_ID = P.PLAN_ID(+)
 ORDER BY NVL(R.FEE - (R.FEE * P.DISCOUNT_RATE / 100), R.FEE) DESC, HISTORY_ID DESC
;