package com.myadmin.controller;

import com.myadmin.dto.Adm;
import com.myadmin.dto.Student;
import com.myadmin.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    StudentService studentService;
    @Autowired
    BCryptPasswordEncoder encoder;
    String dir = "student/";

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Student> list = studentService.get();
        model.addAttribute("std", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model, String id, HttpSession session){
//        Adm adm = null;
//        adm = (Adm) session.getAttribute("loginadm");
//        System.out.println("--------------------------------");
//        System.out.println(adm.getId());
//        System.out.println("--------------------------------");
        model.addAttribute("center", dir+"add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Student std, Errors errors) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e: es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        std.setPwd(encoder.encode(std.getPwd()));
        studentService.register(std);
        return "redirect:/student/all";
    }

    @RequestMapping("/detail")
    public String detail(Model model, String id) throws Exception {
        try {
            Student std = studentService.get(id);
            model.addAttribute("std", std);
            model.addAttribute("center", dir+"detail");
        } catch (Exception e) {
            throw new Exception("Student detail error");
        }
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Student std, Errors errors) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for(ObjectError e: es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        try {
            std.setPwd(encoder.encode(std.getPwd()));
            studentService.modify(std);
        } catch (Exception e) {
            throw new Exception("Student update error");
        }
        return "redirect:/student/detail?id="+std.getId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, String id) throws Exception {
        try {
            studentService.remove(id);
        } catch (Exception e) {
            throw new Exception("Student delet error");
        }
        return "redirect:/student/all";
    }
}
