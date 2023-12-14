package lk.fintrex.fintrexv2.service;

import lk.fintrex.fintrexv2.dto.LoadBlueCountDTO;
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

    public Iterable<LoadHashCountDTO> getHashCount(String user) {
        return usr.getHashCount(user);
    }

    public Iterable<LoadBlueCountDTO> getBlueCount(String user) {
        return usr.getBlueCount(user);
    }

    public Iterable<LoadRedCountDTO> getRedCount(String user) {
        return usr.getRedCount(user);
    }

    public Iterable<LoadGreenCountDTO> getGreenCount(String user) {
        return usr.getGreenCount(user);
    }

    public Iterable<SlimSelectDTO> getAllColOfficers(String search) {
        return usr.getAllColOfficers("%" + search.trim() + "%");
    }

    public Iterable<SlimSelectDTO> getClusters(String search) {
        return crepo.getClusters("%" + search.trim() + "%");
    }
}
