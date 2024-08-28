SELECT art.level_1_code                                                                    AS KODE_PROV,
       art.level_1_name                                                                    AS PROV,
       art.level_2_code                                                                    AS KODE_KAB,
       art.level_2_name                                                                    AS KAB,
       art.level_3_code                                                                    AS KODE_KEC,
       art.level_3_name                                                                    AS KEC,
       art.level_4_code                                                                    AS KODE_DESA,
       art.level_4_name                                                                    AS DESA,
       art.level_5_code                                                                    AS BS,
       art.level_6_code                                                                    AS NKS,
       r_root.no_dsrt                                                                      AS DSRT,
       art.index1                                                                          AS NO_ART,
       art.b4k2                                                                            AS NAMA_ART,
       CONCAT(
        -- Anomali 36
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r52.b5r33a_value >= 64110 AND r52.b5r33a_value <= 64132) OR
                (r52.b5r33a_value >= 84111 AND r52.b5r33a_value <= 84234) OR r52.b5r33a_value = 99000)
            AND r51.b5r6a_value = 1
        ) THEN 'A36,' END,
        -- Anomali 37
        CASE WHEN (
            art.b4k10 >= 5
            AND (r52.b5r33b_value = 0111 OR r52.b5r33b_value = 0112 OR r52.b5r33b_value = 0113 OR r52.b5r33b_value = 0114 OR r52.b5r33b_value = 0115)
            AND r51.b5r6a_value < 4
        ) THEN 'A37,' END,
        -- Anomali 38
        CASE WHEN (
            art.b4k10 >= 5
            AND (r52.b5r33b_value = 0211 OR r52.b5r33b_value = 0212 OR r52.b5r33b_value = 0213 OR r52.b5r33b_value = 0214 OR r52.b5r33b_value = 0215 OR
                r52.b5r33b_value = 0311 OR r52.b5r33b_value = 0312 OR r52.b5r33b_value = 0313 OR r52.b5r33b_value = 0314 OR r52.b5r33b_value = 0315)
            AND r51.b5r6a_value < 3
        ) THEN 'A38,' END,
        -- Anomali 39
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r33b_value IS NOT NULL
            AND ((r52.b5r33b_value >= 1111 AND r52.b5r33b_value <= 1112) OR (r52.b5r33b_value >= 2111 AND r52.b5r33b_value <= 2356) OR
                (r52.b5r33b_value >= 2411 AND r52.b5r33b_value <= 2643))
            AND r51.b5r6a_value < 4
        ) THEN 'A39,' END,
        -- Anomali 40
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r33b_value IS NOT NULL
            AND (r52.b5r33b_value >= 1113 AND r52.b5r33b_value <= 1431)
            AND r51.b5r6a_value < 2
        ) THEN 'A40,' END,
        -- Anomali 41
        CASE WHEN (
            art.b4k10 >= 5
            AND (r52.b5r33b_value = 0111 OR r52.b5r33b_value = 0112 OR r52.b5r33b_value = 0113 OR r52.b5r33b_value = 0114 OR r52.b5r33b_value = 0115)
            AND art.b4k10 < 18
        ) THEN 'A41,' END,
        -- Anomali 42
        CASE WHEN (
            art.b4k10 >= 5
            AND (r52.b5r33b_value = 0211 OR r52.b5r33b_value = 0212 OR r52.b5r33b_value = 0213 OR r52.b5r33b_value = 0214 OR r52.b5r33b_value = 0215 OR
                r52.b5r33b_value = 0311 OR r52.b5r33b_value = 0312 OR r52.b5r33b_value = 0313 OR r52.b5r33b_value = 0314 OR r52.b5r33b_value = 0315)
            AND art.b4k10 < 16
        ) THEN 'A42,' END,
        -- Anomali 43
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r52.b5r33b_value >= 1111 AND r52.b5r33b_value <= 1431) OR (r52.b5r33b_value >= 2111 AND r52.b5r33b_value <= 2356) OR
                (r52.b5r33b_value >= 2411 AND r52.b5r33b_value <= 2643) OR (r52.b5r33b_value >= 3111 AND r52.b5r33b_value <= 3413))
            AND art.b4k10 < 15
        ) THEN 'A43,' END,
        -- Anomali 44
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r33b_value IS NOT NULL
            AND (r52.b5r33b_value = 1311 OR r52.b5r33b_value = 1312 OR r52.b5r33b_value = 3142 OR r52.b5r33b_value = 3143 OR
                (r52.b5r33b_value >= 6111 AND r52.b5r33b_value <= 6340) OR (r52.b5r33b_value >= 9211 AND r52.b5r33b_value <= 9216))
            AND r52.b5r33a_value IS NOT NULL
            AND (r52.b5r33a_value < 1111 OR r52.b5r33a_value > 3279)
        ) THEN 'A44,' END,
        -- Anomali 45
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r33a_value IS NOT NULL
            AND ((r52.b5r33b_value >= 0111 AND r52.b5r33b_value <= 0315) AND (r52.b5r33a_value < 84220 OR r52.b5r33a_value > 84233))
        ) THEN 'A45,' END,
        -- Anomali 46
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r33a_value IS NOT NULL
            AND r52.b5r33b_value = 2320
            AND (r52.b5r33a_value < 85230 OR (r52.b5r33a_value > 85230 AND r52.b5r33a_value < 85240) OR
                (r52.b5r33a_value > 85240 AND r52.b5r33a_value < 85311) OR (r52.b5r33a_value > 85312 AND r52.b5r33a_value < 85321) OR
                r52.b5r33a_value > 85322)
        ) THEN 'A46,' END,
        -- Anomali 47
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r33b_value IS NOT NULL
            AND r52.b5r33b_value = 2330
            AND r52.b5r33a_value IS NOT NULL
            AND (r52.b5r33a_value < 85112 OR (r52.b5r33a_value > 85112 AND r52.b5r33a_value < 85122) OR
                (r52.b5r33a_value > 85122 AND r52.b5r33a_value < 85210) OR (r52.b5r33a_value > 85210 AND r52.b5r33a_value < 85220) OR
                (r52.b5r33a_value > 85220 AND r52.b5r33a_value < 85230) OR (r52.b5r33a_value > 85230 AND r52.b5r33a_value < 85240) OR
                (r52.b5r33a_value > 85240 AND r52.b5r33a_value < 85251) OR (r52.b5r33a_value > 85251 AND r52.b5r33a_value < 85252) OR
                (r52.b5r33a_value > 85252 AND r52.b5r33a_value < 85270) OR r52.b5r33a_value > 85270)
        ) THEN 'A47,' END,
        -- Anomali 48
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r32a_value IS NOT NULL
            AND r52.b5r32a_value = 5
            AND r52.b5r33a_value IS NOT NULL
            AND r52.b5r33a_value >= 5100
        ) THEN 'A48,' END,
        -- Anomali 49
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r32a_value IS NOT NULL
            AND r52.b5r32a_value = 6
            AND r52.b5r33a_value IS NOT NULL
            AND ((r52.b5r33a_value >= 1111 AND r52.b5r33a_value <= 3279) OR (r52.b5r33a_value >= 84111 AND r52.b5r33a_value <= 84300))
        ) THEN 'A49,' END,
        -- Anomali 50
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r33a_value IS NOT NULL
            AND (r52.b5r33a_value >= 84111 AND r52.b5r33a_value <= 84300)
            AND r52.b5r14a_value IS NOT NULL
            AND r52.b5r32a_value <> 4
        )  THEN 'A50,' END,
        -- Anomali 51
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r33b_value = 2612
            AND r52.b5r33a_value IS NOT NULL
            AND r52.b5r33a_value <> 84233
        ) THEN 'A51,' END,
        -- Anomali 52
        CASE WHEN (
            art.b4k10 >= 5
            AND r52.b5r33a_value IS NOT NULL
            AND (r52.b5r33a_value >= 84111 AND r52.b5r33a_value <= 84300)
            AND r52.b5r14a_value IS NOT NULL
            AND r52.b5r32a_value = 4
            AND art.b4k5_value IS NOT NULL
            AND art.b4k5_value = 2
        ) THEN 'A52,' END,
        -- Anomali 53
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r53.b5r48a_value >= 64110 AND r53.b5r48a_value <= 64132) OR (r53.b5r48a_value >= 84111 AND r53.b5r48a_value <= 84234) OR
                r53.b5r48a_value = 99000)
            AND r51.b5r6a_value = 1
        ) THEN 'A53,' END,
        -- Anomali 54
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r48b_value = 0111 OR r53.b5r48b_value = 0112 OR r53.b5r48b_value = 0113 OR r53.b5r48b_value = 0114 OR r53.b5r48b_value = 0115)
            AND r51.b5r6a_value < 4
        ) THEN 'A54,' END,
        -- Anomali 55
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r48b_value = 0211 OR r53.b5r48b_value = 0212 OR r53.b5r48b_value = 0213 OR r53.b5r48b_value = 0214 OR r53.b5r48b_value = 0215 OR
                r53.b5r48b_value = 0311 OR r53.b5r48b_value = 0312 OR r53.b5r48b_value = 0313 OR r53.b5r48b_value = 0314 OR r53.b5r48b_value = 0315)
            AND r51.b5r6a_value < 3
        ) THEN 'A55,' END,
        -- Anomali 56
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r48b_value IS NOT NULL
            AND ((r53.b5r48b_value >= 1111 AND r53.b5r48b_value <= 1112) OR (r53.b5r48b_value >= 2111 AND r53.b5r48b_value <= 2356) OR
                (r53.b5r48b_value >= 2411 AND r53.b5r48b_value <= 2643))
            AND r51.b5r6a_value < 4
        ) THEN 'A56,' END,
        -- Anomali 57
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r48b_value IS NOT NULL
            AND (r53.b5r48b_value >= 1113 AND r53.b5r48b_value <= 1431)
            AND r51.b5r6a_value < 2
        ) THEN 'A57,' END,
        -- Anomali 58
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r48b_value = 0111 OR r53.b5r48b_value = 0112 OR r53.b5r48b_value = 0113 OR r53.b5r48b_value = 0114 OR r53.b5r48b_value = 0115)
            AND art.b4k10 < 18
        ) THEN 'A58,' END,
        -- Anomali 59
        CASE WHEN (
            art.b4k10 >= 5
            AND (r53.b5r48b_value = 0211 OR r53.b5r48b_value = 0212 OR r53.b5r48b_value = 0213 OR r53.b5r48b_value = 0214 OR r53.b5r48b_value = 0215 OR
                r53.b5r48b_value = 0311 OR r53.b5r48b_value = 0312 OR r53.b5r48b_value = 0313 OR r53.b5r48b_value = 0314 OR r53.b5r48b_value = 0315)
            AND art.b4k10 < 16
        ) THEN 'A59,' END,
        -- Anomali 60
        CASE WHEN (
            art.b4k10 >= 5
            AND ((r53.b5r48b_value >= 1111 AND r53.b5r48b_value <= 1431) OR (r53.b5r48b_value >= 2111 AND r53.b5r48b_value <= 2356) OR
                (r53.b5r48b_value >= 2411 AND r53.b5r48b_value <= 2643) OR (r53.b5r48b_value >= 3111 AND r53.b5r48b_value <= 3413))
            AND art.b4k10 < 15
        ) THEN 'A60,' END,
        -- Anomali 61
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r48b_value IS NOT NULL
            AND (r53.b5r48b_value = 1311 OR r53.b5r48b_value = 1312 OR r53.b5r48b_value = 3142 OR r53.b5r48b_value = 3143 OR
                (r53.b5r48b_value >= 6111 AND r53.b5r48b_value <= 6340) OR (r53.b5r48b_value >= 9211 AND r53.b5r48b_value <= 9216))
            AND r53.b5r48a_value IS NOT NULL
            AND (r53.b5r48a_value < 1111 OR r53.b5r48a_value > 3279)
        ) THEN 'A61,' END,
        -- Anomali 62
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r48b_value IS NOT NULL
            AND ((r53.b5r48b_value >= 0111 AND r53.b5r48b_value <= 0315) AND r53.b5r48a_value IS NOT NULL AND
                (r53.b5r48a_value < 84220 OR r53.b5r48a_value > 84233))
        ) THEN 'A62,' END,
        -- Anomali 63
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r48a_value IS NOT NULL
            AND r53.b5r48b_value = 2320
            AND (r53.b5r48a_value < 85230 OR (r53.b5r48a_value > 85230 AND r53.b5r48a_value < 85240) OR
                (r53.b5r48a_value > 85240 AND r53.b5r48a_value < 85311) OR (r53.b5r48a_value > 85312 AND r53.b5r48a_value < 85321) OR
                r53.b5r48a_value > 85322)
        ) THEN 'A63,' END,
        -- Anomali 64
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r48b_value IS NOT NULL
            AND r53.b5r48b_value = 2330
            AND r53.b5r48a_value IS NOT NULL
            AND (r53.b5r48a_value < 85112 OR (r53.b5r48a_value > 85112 AND r53.b5r48a_value < 85122) OR
                (r53.b5r48a_value > 85122 AND r53.b5r48a_value < 85210) OR (r53.b5r48a_value > 85210 AND r53.b5r48a_value < 85220) OR
                (r53.b5r48a_value > 85220 AND r53.b5r48a_value < 85230) OR (r53.b5r48a_value > 85230 AND r53.b5r48a_value < 85240) OR
                (r53.b5r48a_value > 85240 AND r53.b5r48a_value < 85251) OR (r53.b5r48a_value > 85251 AND r53.b5r48a_value < 85252) OR
                (r53.b5r48a_value > 85252 AND r53.b5r48a_value < 85270) OR r53.b5r48a_value > 85270)
        ) THEN 'A64,' END,
        -- Anomali 65
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r47d_value IS NOT NULL
            AND r53.b5r47d_value = 5
            AND r53.b5r48a_value IS NOT NULL
            AND r53.b5r48a_value < 1111
            AND r53.b5r48a_value > 3279
        ) THEN 'A65,' END,
        -- Anomali 66
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r47d_value IS NOT NULL
            AND r53.b5r47d_value = 6
            AND r53.b5r48a_value IS NOT NULL
            AND ((r53.b5r48a_value >= 1111 AND r53.b5r48a_value <= 3279) OR (r53.b5r48a_value >= 84111 AND r53.b5r48a_value <= 84300))
        ) THEN 'A66,' END,
        -- Anomali 67
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r48a_value IS NOT NULL
            AND (r53.b5r48a_value >= 84111 AND r53.b5r48a_value <= 84300)
            AND r53.b5r47d_value IS NOT NULL
            AND r53.b5r47d_value <> 4
        ) THEN 'A67,' END,
        -- Anomali 68
        CASE WHEN (
            art.b4k10 >= 5
            AND r53.b5r48b_value = 2612
            AND r53.b5r48a_value IS NOT NULL
            AND r53.b5r48a_value <> 84233
        ) THEN 'A68,' END,
        -- Anomali 69
        CASE WHEN (
            art.b4k10 >= 5
            AND (r51.b5r6a_value >= 4 AND r51.b5r6a_value <= 12)
            AND r51.b5r6b_j_kd_value IS NULL
        ) THEN 'A69,' END,
        -- Anomali 70
        CASE WHEN (
            art.b4k10 >= 5
            AND r51.b5r6g_jml = 1
            AND r51.b5r6g1_kd IS NULL
        ) THEN 'A70,' END
       ) as Anomali,
       CONCAT('<a href="https://fasih-sm.bps.go.id/survey-collection/assignment-detail/',
              art.assignment_id
           , '/57563bf6-4077-49c9-b6be-002389adcd91" target="_blank">Link Assignment</a>') AS Link
FROM tln_cf698a83.art_roster art
         LEFT JOIN tln_cf698a83.root_table r_root
                   ON r_root.assignment_id = art.assignment_id
         LEFT JOIN tln_cf698a83.art_5th_1_roster r51
                   ON r51.assignment_id = art.assignment_id
                       AND r51.index1 = art.index1
         LEFT JOIN tln_cf698a83.art_5th_2_roster r52
                   ON r52.assignment_id = art.assignment_id
                       AND r52.index1 = art.index1
         LEFT JOIN tln_cf698a83.art_5th_3_roster r53
                   ON r53.assignment_id = art.assignment_id
                       AND r53.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_4_roster r54
                   ON r54.assignment_id = art.assignment_id
                       AND r54.index1 = art.index1
WHERE art.level_3_code IN ('010', '011', '020', '030')
/*WHERE art.level_3_code IN ('031','040', '050')*/
/*WHERE art.level_3_code IN ('060','070', '071')*/
ORDER BY art.level_6_full_code, r_root.no_dsrt, art.index1