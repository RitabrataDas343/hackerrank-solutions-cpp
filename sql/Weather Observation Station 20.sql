WITH C AS(
SELECT ROUND(LAT_N, 4) as LAT, RNK,
    (CASE 
        WHEN (N % 2 = 0) THEN (N / 2) 
        ELSE ((N + 1)/2) 
     END) AS VAL
FROM(
    SELECT LAT_N, ROW_NUMBER() OVER(
        ORDER BY LAT_N) as RNK,
        COUNT(*) OVER() as N
    FROM STATION) 
AS BASE)

SELECT ROUND(LAT, 4)
FROM C
WHERE (RNK = VAL);