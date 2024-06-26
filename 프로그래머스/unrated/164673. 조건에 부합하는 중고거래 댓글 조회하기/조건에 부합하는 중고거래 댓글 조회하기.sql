SELECT  GB.TITLE
     ,  GB.BOARD_ID
     ,  GP.REPLY_ID
     ,  GP.WRITER_ID
     ,  GP.CONTENTS
     ,  TO_CHAR(GP.CREATED_DATE, 'YYYY-MM-DD') AS CREATED_DATE
  FROM  USED_GOODS_BOARD    GB
     ,  USED_GOODS_REPLY    GP
 WHERE  GB.BOARD_ID     = GP.BOARD_ID
   AND  TO_CHAR(GB.CREATED_DATE, 'YYYYMMDD') LIKE '202210%'
 ORDER BY GP.CREATED_DATE, GB.TITLE 
;