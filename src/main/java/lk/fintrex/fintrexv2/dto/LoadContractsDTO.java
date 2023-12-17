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
public class LoadContractsDTO {

    private String FINANCENO;
    private String PRODUCT;
    private String BRANCH;
    private String FULLNAME;
    private String NICNO;
    private String AGE;
    private String APPLICATIONSTATUS;
    private String EXPOSURE;
}
