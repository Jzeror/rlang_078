df_win_count <- dbGetQuery(conn, "SELECT
                        A.WIN aa,
                           COUNT(A.WIN) bb
FROM(SELECT 
                           sc.SCHE_DATE ,
                           CASE
                           WHEN sc.HOME_SCORE > sc.AWAY_SCORE THEN ht.TEAM_NAME
                           WHEN sc.AWAY_SCORE > sc.HOME_SCORE THEN at.TEAM_NAME
                           ELSE '0'
                           END WIN
                           FROM SCHEDULE sc
                           JOIN TEAM ht
                           ON sc.HOMETEAM_ID LIKE ht.TEAM_ID
                           JOIN TEAM at
                           ON sc.AWAYTEAM_ID LIKE at.TEAM_ID
                           WHERE
                           sc.home_score-sc.away_score not like 0
                           )A
                           GROUP BY A.WIN
                           ORDER BY COUNT(A.WIN) DESC"
                        )
df_win_count

barplot(df_win_count[,2],names.arg=df_win_count[,1])


df_seat_count<- dbGetQuery(conn, "SELECT
                           ROWNUM NO,
                           A.*
                           FROM(SELECT
                           STADIUM_NAME STADIUM,
                           SEAT_COUNT NSEAT
                           FROM
                           STADIUM
                           ORDER BY SEAT_COUNT DESC) A
                           ")

pie(df_seat_count$NSEAT,df_seat_count$STADIUM)

df_play_de<-dbGetQuery(conn, " SELECT a.scored diff,count(a.scored) rcount
  FROM (  SELECT CASE
                       WHEN sc.home_score - sc.away_score > 0 THEN ht.team_name
                       WHEN sc.away_score - sc.home_score > 0 THEN at.team_name
                       ELSE NULL
                       END
                       이긴팀,
                       CASE
                       WHEN sc.home_score - sc.away_score > 0
                       THEN
                       sc.home_score - sc.away_score
                       WHEN sc.away_score - sc.home_score > 0
                       THEN
                       sc.away_score - sc.home_score
                       ELSE
                       NULL
                       END
                       scored
                       FROM schedule sc
                       JOIN team ht ON ht.team_id LIKE sc.hometeam_id
                       JOIN team at ON at.team_id LIKE sc.awayteam_id
                       WHERE sc.away_score - sc.home_score NOT LIKE 0
                       ORDER BY CASE
                       WHEN sc.home_score - sc.away_score > 0
                       THEN
                       sc.home_score - sc.away_score
                       WHEN sc.away_score - sc.home_score > 0
                       THEN
                       sc.away_score - sc.home_score
                       END DESC) a
                       GROUP BY a.scored
                       ")
df_play_de
class(df_play_de$DIFF)
hist(df_play_de$DIFF, df_play_de$RCOUNT)



##############
df_gk_height <- dbGetQuery(conn,"
                           
select t.team_name, round(avg(p.height),1)
                           from team t
                           join player p
                           on t.team_id = p.TEAM_ID
                           where p.position like 'GK'
                           group by t.team_name")
df_gk_height
class(df_gk_height$TEAM_NAME)
plot (df_gk_height$ROUND(AVG(P.HEIGHT),1),type=o, xaxt='n')
