/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lk.fintrex.fintrexv2.repo;

import lk.fintrex.fintrexv2.dto.LoadBlueCountDTO;
import lk.fintrex.fintrexv2.dto.LoadGreenCountDTO;
import lk.fintrex.fintrexv2.dto.LoadHashCountDTO;
import lk.fintrex.fintrexv2.dto.LoadRedCount1DTO;
import lk.fintrex.fintrexv2.dto.LoadRedCount2DTO;
import lk.fintrex.fintrexv2.dto.SlimSelectDTO;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import lk.fintrex.fintrexv2.model.data1;

/**
 *
 * @author Neva
 */
@Repository
public interface data1Repo extends CrudRepository<data1, Integer> {

    @Query("SELECT DISTINCT `COLL OFFICER` AS `text` FROM `data1`")
    Iterable<SlimSelectDTO> getAllColOfficers1(@Param("search") String search);

    @Query("SELECT CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range, COUNT(*) AS age_count, ROUND(SUM(EXPOSURE), 0) AS total_exposure FROM data1 WHERE `COLL OFFICER` = 'Sajith Sanjeewa' GROUP BY age_range")
    Iterable<LoadHashCountDTO> getHashCount1(@Param("user") String user);

    @Query("WITH AgeRanges AS (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data1 WHERE `COLL OFFICER` = :user) SELECT COUNT(CASE WHEN A1.age_range = '3' THEN 1 END) AS age3_count, COUNT(CASE WHEN A1.age_range = '2' THEN 1 END) AS age2_count, COUNT(CASE WHEN A1.age_range = '1' THEN 1 END) AS age1_count, COUNT(CASE WHEN A1.age_range = '0' THEN 1 END) AS age0_count, COUNT(CASE WHEN A1.age_range = '99' THEN 1 END) AS age99_count FROM AgeRanges A1 LEFT JOIN (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data2 WHERE `COLL OFFICER` = :user) A2 ON A1.`FINANCE NO` = A2.`FINANCE NO` WHERE A2.`FINANCE NO` IS NULL OR A1.age_range = A2.age_range")
    Iterable<LoadBlueCountDTO> getBlueCount(@Param("user") String user);

    @Query("WITH AgeRanges AS (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data1 WHERE `COLL OFFICER` = :user) SELECT COUNT(CASE WHEN A1.age_range = '3' AND A2.age_range = '2' THEN 1 END) AS count3to_two, COUNT(CASE WHEN A1.age_range = '2' AND A2.age_range = '1' THEN 1 END) AS count2to_one, COUNT(CASE WHEN A1.age_range = '1' AND A2.age_range = '0' THEN 1 END) AS count1to_zero, COUNT(CASE WHEN A1.age_range = '0' AND A2.age_range = '99' THEN 1 END) AS count0to_ninenine FROM AgeRanges A1 JOIN (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data2 WHERE `COLL OFFICER` = :user) A2 ON A1.`FINANCE NO` = A2.`FINANCE NO` WHERE A1.age_range <> A2.age_range")
    Iterable<LoadRedCount1DTO> getRedCount1(@Param("user") String user);

    @Query("WITH AgeRanges AS (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data1 WHERE `COLL OFFICER` = :user) SELECT COUNT(CASE WHEN A1.age_range = '1' AND A2.age_range = '3' THEN 1 END) AS count1to_three, COUNT(CASE WHEN A1.age_range = '0' AND A2.age_range = '3' THEN 1 END) AS count0to_three, COUNT(CASE WHEN A1.age_range = '99' AND A2.age_range = '3' THEN 1 END) AS count99to_three, COUNT(CASE WHEN A1.age_range = '0' AND A2.age_range = '2' THEN 1 END) AS count0to_two, COUNT(CASE WHEN A1.age_range = '99' AND A2.age_range = '2' THEN 1 END) AS count99to_two, COUNT(CASE WHEN A1.age_range = '99' AND A2.age_range = '1' THEN 1 END) AS count99to_one FROM AgeRanges A1 JOIN (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data2 WHERE `COLL OFFICER` = :user) A2 ON A1.`FINANCE NO` = A2.`FINANCE NO` WHERE A1.age_range <> A2.age_range")
    Iterable<LoadRedCount2DTO> getRedCount2(@Param("user") String user);

    @Query("WITH AgeRanges AS (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data1 WHERE `COLL OFFICER` = :user) SELECT COUNT(CASE WHEN A1.age_range = '3' AND A2.age_range = '2' THEN 1 END) AS count3to_two, COUNT(CASE WHEN A1.age_range = '3' AND A2.age_range = '1' THEN 1 END) AS count3to_one, COUNT(CASE WHEN A1.age_range = '3' AND A2.age_range = '0' THEN 1 END) AS count3to_zero, COUNT(CASE WHEN A1.age_range = '3' AND A2.age_range = '99' THEN 1 END) AS count3to_ninenine, COUNT(CASE WHEN A1.age_range = '2' AND A2.age_range = '1' THEN 1 END) AS count2to_one, COUNT(CASE WHEN A1.age_range = '2' AND A2.age_range = '0' THEN 1 END) AS count2to_zero, COUNT(CASE WHEN A1.age_range = '2' AND A2.age_range = '99' THEN 1 END) AS count2to_ninenine, COUNT(CASE WHEN A1.age_range = '1' AND A2.age_range = '0' THEN 1 END) AS count1to_zero, COUNT(CASE WHEN A1.age_range = '1' AND A2.age_range = '99' THEN 1 END) AS count1to_ninenine, COUNT(CASE WHEN A1.age_range = '0' AND A2.age_range = '99' THEN 1 END) AS count0to_ninenine FROM AgeRanges A1 JOIN (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data2 WHERE `COLL OFFICER` = :user) A2 ON A1.`FINANCE NO` = A2.`FINANCE NO` WHERE A1.age_range <> A2.age_range")
    Iterable<LoadGreenCountDTO> getGreenCount(@Param("user") String user);
}
