/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lk.fintrex.fintrexv2.repo;

import lk.fintrex.fintrexv2.dto.LoadBlueCountDTO;
import lk.fintrex.fintrexv2.dto.LoadGreenCountDTO;
import lk.fintrex.fintrexv2.dto.LoadHashCountDTO;
import lk.fintrex.fintrexv2.dto.LoadRedCountDTO;
import lk.fintrex.fintrexv2.dto.SlimSelectDTO;
import lk.fintrex.fintrexv2.model.cluster;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Neva
 */
@Repository
public interface clusterRepo extends CrudRepository<cluster, Integer> {

    @Query("SELECT c.`id` AS `value` , c.`cluster_name` AS `text` FROM `cluster` c")
    Iterable<SlimSelectDTO> getClusters(@Param("search") String search);

    @Query("SELECT CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range, COUNT(*) AS age_count, ROUND(SUM(EXPOSURE), 0) AS total_exposure FROM data1 WHERE `COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user) GROUP BY age_range WITH ROLLUP")
    Iterable<LoadHashCountDTO> getHashCountCluster(@Param("user") String user);

    @Query("WITH AgeRanges AS (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data1 WHERE `COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user)) SELECT COUNT(CASE WHEN A1.age_range = '3' THEN 1 END) AS age3_count, COUNT(CASE WHEN A1.age_range = '2' THEN 1 END) AS age2_count, COUNT(CASE WHEN A1.age_range = '1' THEN 1 END) AS age1_count, COUNT(CASE WHEN A1.age_range = '0' THEN 1 END) AS age0_count, COUNT(CASE WHEN A1.age_range = '99' THEN 1 END) AS age99_count, ROUND(SUM(CASE WHEN A1.age_range = '3' THEN A1.EXPOSURE ELSE 0 END), 0) AS exposure_three, ROUND(SUM(CASE WHEN A1.age_range = '2' THEN A1.EXPOSURE ELSE 0 END),0) AS exposure_two, ROUND(SUM(CASE WHEN A1.age_range = '1' THEN A1.EXPOSURE ELSE 0 END),0) AS exposure_one, ROUND(SUM(CASE WHEN A1.age_range = '0' THEN A1.EXPOSURE ELSE 0 END),0) AS exposure_zero, ROUND(SUM(CASE WHEN A1.age_range = '99' THEN A1.EXPOSURE ELSE 0 END),0) AS exposure_ninenine, ROUND(SUM(A1.EXPOSURE),0) AS total_exposure FROM AgeRanges A1 LEFT JOIN (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data2 WHERE `COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user)) A2 ON A1.`FINANCE NO` = A2.`FINANCE NO` WHERE A2.`FINANCE NO` IS NULL OR A1.age_range = A2.age_range")
    Iterable<LoadBlueCountDTO> getBlueCountCluster(@Param("user") String user);

    @Query("SELECT SUM(r3l) AS r3l, SUM(r2l) AS r2l, SUM(r1l) AS r1l, SUM(r0l) AS r0l, SUM(r3le) AS r3le, SUM(r2le) AS r2le, SUM(r1le) AS r1le, SUM(r0le) AS r0le, SUM(r3l + r2l + r1l + r0l) AS rt, SUM(r3le + r2le + r1le + r0le) AS re FROM (SELECT CASE WHEN d1.AGE >= 3 AND d2.AGE < 3 THEN 1 ELSE 0 END AS r3l, CASE WHEN d1.AGE >= 2 AND d1.AGE < 3 AND d2.AGE < 2 THEN 1 ELSE 0 END AS r2l, CASE WHEN d1.AGE >= 1 AND d1.AGE < 2 AND d2.AGE < 1 THEN 1 ELSE 0 END AS r1l, CASE WHEN d1.AGE > 0 AND d1.AGE < 1 AND d2.AGE = 0 THEN 1 ELSE 0 END AS r0l, ROUND(CASE WHEN d1.AGE >= 3 AND d2.AGE < 3 THEN d1.exposure ELSE 0 END, 0) AS r3le, ROUND(CASE WHEN d1.AGE >= 2 AND d1.AGE < 3 AND d2.AGE < 2 THEN d1.exposure ELSE 0 END, 0) AS r2le, ROUND(CASE WHEN d1.AGE >= 1 AND d1.AGE < 2 AND d2.AGE < 1 THEN d1.exposure ELSE 0 END, 0) AS r1le, ROUND(CASE WHEN d1.AGE > 0 AND d1.AGE < 1 AND d2.AGE = 0 THEN d1.exposure ELSE 0 END, 0) AS r0le FROM data1 d1 JOIN data2 d2 ON d1.`FINANCE NO` = d2.`FINANCE NO` WHERE d2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user)) AS subquery")
    Iterable<LoadRedCountDTO> getRedCountCluster(@Param("user") String user);

    @Query("SELECT ROUND(SUM(CASE WHEN data1.AGE >= 3 AND data2.AGE = 0 AND data2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user) THEN 1 ELSE 0 END), 0) AS countage3to0, ROUND(SUM(CASE WHEN data1.AGE >= 2 AND data1.AGE < 3 AND data2.AGE = 0 AND data2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user) THEN 1 ELSE 0 END), 0) AS countage2to0, ROUND(SUM(CASE WHEN data1.AGE >= 1 AND data1.AGE < 2 AND data2.AGE = 0 AND data2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user) THEN 1 ELSE 0 END), 0) AS countage1to0, ROUND(SUM(CASE WHEN data1.AGE > 0 AND data1.AGE < 1 AND data2.AGE = 0 AND data2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user) THEN 1 ELSE 0 END), 0) AS countage0to0, ROUND(SUM(CASE WHEN data1.AGE >= 3 AND data2.AGE = 0 AND data2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user) THEN data1.exposure ELSE 0 END), 0) AS exposure_age3to0, ROUND(SUM(CASE WHEN data1.AGE >= 2 AND data1.AGE < 3 AND data2.AGE = 0 AND data2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user) THEN data1.exposure ELSE 0 END), 0) AS exposure_age2to0, ROUND(SUM(CASE WHEN data1.AGE >= 1 AND data1.AGE < 2 AND data2.AGE = 0 AND data2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user) THEN data1.exposure ELSE 0 END), 0) AS exposure_age1to0, ROUND(SUM(CASE WHEN data1.AGE > 0 AND data1.AGE < 1 AND data2.AGE = 0 AND data2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user) THEN data1.exposure ELSE 0 END), 0) AS exposure_age0to0 FROM data1 JOIN data2 ON data1.`FINANCE NO` = data2.`FINANCE NO` WHERE data2.`COLL OFFICER` IN (SELECT o.`officer` FROM `officer` o WHERE o.`cluster` = :user)")
    Iterable<LoadGreenCountDTO> getGreenCountCluster(@Param("user") String user);
}
