package lk.fintrex.fintrexv2.controller;

import lk.fintrex.fintrexv2.dto.LoadBlueCountDTO;
import lk.fintrex.fintrexv2.dto.LoadGreenCountDTO;
import lk.fintrex.fintrexv2.dto.LoadHashCountDTO;
import lk.fintrex.fintrexv2.dto.LoadRedCount1DTO;
import lk.fintrex.fintrexv2.dto.LoadRedCount2DTO;
import lk.fintrex.fintrexv2.dto.SlimSelectDTO;
import lk.fintrex.fintrexv2.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService ser;

    @PostMapping("/hash-count1")
    public Iterable<LoadHashCountDTO> getHashCount1(@RequestParam String user) throws Exception {
        return ser.getHashCount1(user);
    }

    @PostMapping("/blue-count")
    public Iterable<LoadBlueCountDTO> getBlueCount(@RequestParam String user) throws Exception {
        return ser.getBlueCount(user);
    }

    @PostMapping("/red-count1")
    public Iterable<LoadRedCount1DTO> getRedCount1(@RequestParam String user) throws Exception {
        return ser.getRedCount1(user);
    }

    @PostMapping("/red-count2")
    public Iterable<LoadRedCount2DTO> getRedCount2(@RequestParam String user) throws Exception {
        return ser.getRedCount2(user);
    }

    @PostMapping("/green-count")
    public Iterable<LoadGreenCountDTO> getGreenCount(@RequestParam String user) throws Exception {
        return ser.getGreenCount(user);
    }

    @PostMapping("/hash-count2")
    public Iterable<LoadHashCountDTO> getHashCount2(@RequestParam String user) throws Exception {
        return ser.getHashCount2(user);
    }

    @PostMapping("/search-col_officers")
    public Iterable<SlimSelectDTO> getAllColOfficers1(@RequestParam String search) throws Exception {
        return ser.getAllColOfficers1(search);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<CommonResponse> handleException(Exception e) {
        e.printStackTrace();
        CommonResponse response = new CommonResponse(e.getMessage(), 2000);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
