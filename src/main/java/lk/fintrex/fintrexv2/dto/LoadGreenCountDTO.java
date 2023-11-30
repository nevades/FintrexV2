/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lk.fintrex.fintrexv2.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author Neva
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LoadGreenCountDTO {

    private Integer count3toTwo;
    private Integer count3toOne;
    private Integer count3toZero;
    private Integer count3toNinenine;
    private Integer count2toOne;
    private Integer count2toZero;
    private Integer count2toNinenine;
    private Integer count1toZero;
    private Integer count1toNinenine;
    private Integer count0toNinenine;

}
