SELECT  *
  FROM  (
            SELECT  AI.NAME
                 ,  AI.DATETIME
              FROM  ANIMAL_INS  AI
                 ,  ANIMAL_OUTS AO
             WHERE  AI.ANIMAL_ID    = AO.ANIMAL_ID(+)
               AND  AO.ANIMAL_ID IS NULL
             ORDER BY AI.DATETIME
        )
 WHERE  ROWNUM <= 3
;