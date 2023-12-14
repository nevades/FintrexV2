package lk.fintrex.fintrexv2.controller;

import lk.fintrex.fintrexv2.dto.LoadBlueCountDTO;
import lk.fintrex.fintrexv2.dto.LoadGreenCountDTO;
import lk.fintrex.fintrexv2.dto.LoadHashCountDTO;
import lk.fintrex.fintrexv2.dto.LoadRedCountDTO;
import lk.fintrex.fintrexv2.dto.SlimSelectDTO;
import lk.fintrex.fintrexv2.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService ser;

    @PostMapping("/hash-count")
    public Iterable<LoadHashCountDTO> getHashCount(@RequestParam String user) throws Exception {
        return ser.getHashCount(user);
    }

    @PostMapping("/blue-count")
    public Iterable<LoadBlueCountDTO> getBlueCount(@RequestParam String user) throws Exception {
        return ser.getBlueCount(user);
    }

    @PostMapping("/red-count")
    public Iterable<LoadRedCountDTO> getRedCount(@RequestParam String user) throws Exception {
        return ser.getRedCount(user);
    }

    @PostMapping("/green-count")
    public Iterable<LoadGreenCountDTO> getGreenCount(@RequestParam String user) throws Exception {
        return ser.getGreenCount(user);
    }

    @PostMapping("/search-col_officers")
    public Iterable<SlimSelectDTO> getAllColOfficers(@RequestParam String search) throws Exception {
        return ser.getAllColOfficers(search);
    }

    @PostMapping("/search-clusters")
    public Iterable<SlimSelectDTO> getClusters(@RequestParam String search) throws Exception {
        return ser.getClusters(search);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<CommonResponse> handleException(Exception e) {
        e.printStackTrace();
        CommonResponse response = new CommonResponse(e.getMessage(), 2000);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
