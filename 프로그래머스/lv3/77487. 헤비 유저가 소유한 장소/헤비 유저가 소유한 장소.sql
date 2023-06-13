-- 코드를 입력하세요
SELECT  ID
     ,  NAME
     ,  HOST_ID
  FROM  (
            SELECT  ID
                 ,  NAME
                 ,  HOST_ID
                 ,  COUNT(HOST_ID) OVER(PARTITION BY HOST_ID)   HOST_COUNT
              FROM  PLACES
        )
 WHERE  HOST_COUNT >= 2
 ORDER BY ID
;