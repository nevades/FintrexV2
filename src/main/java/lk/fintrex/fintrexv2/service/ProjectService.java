package lk.fintrex.fintrexv2.service;

import lk.fintrex.fintrexv2.dto.LoadBlueCountDTO;
import lk.fintrex.fintrexv2.dto.LoadGreenCountDTO;
import lk.fintrex.fintrexv2.dto.LoadHashCountDTO;
import lk.fintrex.fintrexv2.dto.LoadRedCount1DTO;
import lk.fintrex.fintrexv2.dto.LoadRedCount2DTO;
import lk.fintrex.fintrexv2.dto.SlimSelectDTO;
import lk.fintrex.fintrexv2.repo.data1Repo;
import lk.fintrex.fintrexv2.repo.data2Repo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {

    @Autowired
    private data1Repo usr;

    @Autowired
    private data2Repo usr2;

    public Iterable<LoadHashCountDTO> getHashCount1(String user) {
        return usr.getHashCount1(user);
    }

    public Iterable<LoadBlueCountDTO> getBlueCount(String user) {
        return usr.getBlueCount(user);
    }

    public Iterable<LoadRedCount1DTO> getRedCount1(String user) {
        return usr.getRedCount1(user);
    }

    public Iterable<LoadRedCount2DTO> getRedCount2(String user) {
        return usr.getRedCount2(user);
    }

    public Iterable<LoadGreenCountDTO> getGreenCount(String user) {
        return usr.getGreenCount(user);
    }

    public Iterable<LoadHashCountDTO> getHashCount2(String user) {
        return usr2.getHashCount2(user);
    }

    public Iterable<SlimSelectDTO> getAllColOfficers1(String search) {
        return usr.getAllColOfficers1("%" + search.trim() + "%");
    }
}
