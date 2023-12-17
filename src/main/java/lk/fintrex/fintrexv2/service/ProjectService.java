package lk.fintrex.fintrexv2.service;

import lk.fintrex.fintrexv2.datatable.DataTableRepo;
import lk.fintrex.fintrexv2.datatable.DataTableRequest;
import lk.fintrex.fintrexv2.datatable.DataTablesResponse;
import lk.fintrex.fintrexv2.dto.LoadBlueCountDTO;
import lk.fintrex.fintrexv2.dto.LoadContractsDTO;
import lk.fintrex.fintrexv2.dto.LoadGreenCountDTO;
import lk.fintrex.fintrexv2.dto.LoadHashCountDTO;
import lk.fintrex.fintrexv2.dto.LoadRedCountDTO;
import lk.fintrex.fintrexv2.dto.SlimSelectDTO;
import lk.fintrex.fintrexv2.repo.clusterRepo;
import lk.fintrex.fintrexv2.repo.data1Repo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {

    @Autowired
    private data1Repo usr;

    @Autowired
    private clusterRepo crepo;

    @Autowired
    private DataTableRepo<LoadContractsDTO> cdrepo;

    public Iterable<LoadHashCountDTO> getHashCount(String user) {
        return usr.getHashCount(user);
    }

    public Iterable<LoadHashCountDTO> getHashCountCluster(String user) {
        return crepo.getHashCountCluster(user);
    }

    public Iterable<LoadBlueCountDTO> getBlueCount(String user) {
        return usr.getBlueCount(user);
    }

    public Iterable<LoadBlueCountDTO> getBlueCountCluster(String user) {
        return crepo.getBlueCountCluster(user);
    }

    public Iterable<LoadRedCountDTO> getRedCount(String user) {
        return usr.getRedCount(user);
    }

    public Iterable<LoadRedCountDTO> getRedCountCluster(String user) {
        return crepo.getRedCountCluster(user);
    }

    public Iterable<LoadGreenCountDTO> getGreenCount(String user) {
        return usr.getGreenCount(user);
    }

    public Iterable<LoadGreenCountDTO> getGreenCountCluster(String user) {
        return crepo.getGreenCountCluster(user);
    }

    public Iterable<SlimSelectDTO> getAllColOfficers(String search) {
        return usr.getAllColOfficers("%" + search.trim() + "%");
    }

    public DataTablesResponse<LoadContractsDTO> getContracts(DataTableRequest param) throws Exception {
        var typer = param.getType();
        var qry = "";
        if (null != typer) {
            switch (typer) {
                case 1 ->
                    qry = "SELECT `FINANCE NO`, `PRODUCT`, `BRANCH`, `FULL NAME`, `NIC NO`, `AGE`, `APPLICATION STATUS`, `EXPOSURE` FROM `data1` WHERE " + param.getFilter() + " AND `COLL OFFICER` = '" + param.getData() + "'";
                case 2 ->
                    qry = "SELECT data2.`FINANCE NO`, data2.`PRODUCT`, data2.`BRANCH`, data2.`FULL NAME`, data2.`NIC NO`, data2.`AGE`, data2.`APPLICATION STATUS`, data2.`EXPOSURE` FROM data2 JOIN data1 ON data2.`FINANCE NO` = data1.`FINANCE NO` WHERE " + param.getFilter() + " AND data2.`COLL OFFICER` = '" + param.getData() + "'";
                default -> {
                }
            }
        }
        return cdrepo.getData(LoadContractsDTO.class, param, qry);
    }

    public Iterable<SlimSelectDTO> getClusters(String search) {
        return crepo.getClusters("%" + search.trim() + "%");
    }
}
