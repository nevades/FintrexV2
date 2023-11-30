/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lk.fintrex.fintrexv2.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.relational.core.mapping.Table;

/**
 *
 * @author Neva
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Table("data2")
public class data2 {

    private String COLL_OFFICER;
    private String FINANCE_NO;
    private Float AGE;
}
