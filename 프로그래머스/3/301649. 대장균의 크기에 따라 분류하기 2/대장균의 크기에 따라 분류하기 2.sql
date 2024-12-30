SELECT 
    ID,
    CASE 
        WHEN RANK_VAL <= TOTAL_COUNT * 0.25 THEN 'CRITICAL'
        WHEN RANK_VAL <= TOTAL_COUNT * 0.50 THEN 'HIGH'
        WHEN RANK_VAL <= TOTAL_COUNT * 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM (
    SELECT 
        ID,
        RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS RANK_VAL,
        COUNT(*) OVER () AS TOTAL_COUNT
    FROM ECOLI_DATA
) RANKED_DATA
ORDER BY ID ASC;
