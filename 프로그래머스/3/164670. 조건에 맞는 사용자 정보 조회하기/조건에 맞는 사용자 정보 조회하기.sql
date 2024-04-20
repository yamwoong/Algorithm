SELECT  U.USER_ID
     ,  U.NICKNAME
     ,  U.CITY || ' ' || U.STREET_ADDRESS1 || ' ' || STREET_ADDRESS2 AS "전체주소"
     ,  REGEXP_REPLACE(U.TLNO, '(.{3})(.+)(.{4})', '\1-\2-\3')  AS "전화번호"
  FROM  USED_GOODS_USER     U
     ,  (
            SELECT  WRITER_ID
                 ,  COUNT(WRITER_ID)    AS USER_COUNT
              FROM  USED_GOODS_BOARD
             GROUP BY WRITER_ID
        )    B
 WHERE  U.USER_ID   = B.WRITER_ID
   AND  USER_COUNT >= 3
 ORDER BY U.USER_ID DESC

;