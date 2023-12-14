/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lk.fintrex.fintrexv2.repo;

import lk.fintrex.fintrexv2.dto.LoadHashCountDTO;
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

    @Query("SELECT CASE WHEN AGE >= 3 THEN '3' WHEN AGE < 3 AND AGE >= 2 THEN '2' WHEN AGE < 2 AND AGE >= 1 THEN '1' WHEN AGE < 1 AND AGE > 0 THEN '0' WHEN AGE = 0 THEN '99' END AS age_range, COUNT(*) AS age_count, ROUND(SUM(EXPOSURE), 0) AS total_exposure FROM data1 WHERE `COLL OFFICER` = :user GROUP BY age_range WITH ROLLUP")
    Iterable<LoadHashCountDTO> getHashCount(@Param("user") String user);
}
