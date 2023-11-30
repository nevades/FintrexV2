/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lk.fintrex.fintrexv2.repo;

import lk.fintrex.fintrexv2.dto.LoadHashCountDTO;
import lk.fintrex.fintrexv2.dto.SlimSelectDTO;
import lk.fintrex.fintrexv2.model.data2;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Neva
 */
@Repository
public interface data2Repo extends CrudRepository<data2, Integer> {

    @Query("SELECT DISTINCT `COLL OFFICER` AS `text` FROM `data2`")
    Iterable<SlimSelectDTO> getAllColOfficers2(@Param("search") String search);

    @Query("WITH AgeRanges AS (SELECT *, CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range FROM data2 WHERE `COLL OFFICER` = :user) SELECT A1.age_range, COUNT(A1.age_range) AS age_count, ROUND(SUM(A1.EXPOSURE), 0) AS total_exposure FROM AgeRanges A1 GROUP BY A1.age_range")
    Iterable<LoadHashCountDTO> getHashCount2(@Param("user") String user);
}
