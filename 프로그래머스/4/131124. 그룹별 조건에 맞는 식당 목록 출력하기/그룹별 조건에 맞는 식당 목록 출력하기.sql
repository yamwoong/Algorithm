SELECT  M.MEMBER_NAME
     ,  R.REVIEW_TEXT	
     ,  TO_CHAR(R.REVIEW_DATE, 'YYYY-MM-DD')    AS REVIEW_DATE
  FROM  MEMBER_PROFILE  M
     ,  REST_REVIEW     R
     ,  (
            SELECT  MEMBER_ID
                 ,  RANK() OVER (ORDER BY COUNT(MEMBER_ID) DESC) AS MEMBER_RANK
              FROM  REST_REVIEW
            GROUP BY MEMBER_ID
        )   V
 WHERE  M.MEMBER_ID = V.MEMBER_ID
   AND  M.MEMBER_ID = R.MEMBER_ID
   AND  V.MEMBER_RANK = 1
 ORDER BY R.REVIEW_DATE, R.REVIEW_TEXT
;