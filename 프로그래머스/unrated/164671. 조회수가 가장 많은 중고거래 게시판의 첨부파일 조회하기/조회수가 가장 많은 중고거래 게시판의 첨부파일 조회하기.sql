-- 코드를 입력하세요
SELECT  U.FILE_PATH || B.BOARD_ID || '/' || FILE_ID || FILE_NAME || FILE_EXT    AS FILE_PATH
  FROM  USED_GOODS_BOARD    B
     ,  USED_GOODS_FILE     F
     ,  (
            SELECT  MAX(VIEWS)              AS MAX_VIEWS
                 ,  MAX('/home/grep/src/')  AS FILE_PATH
              FROM  USED_GOODS_BOARD
        )   U
 WHERE  B.BOARD_ID      = F.BOARD_ID
   AND  B.VIEWS         = U.MAX_VIEWS
 ORDER BY F.FILE_ID DESC
;