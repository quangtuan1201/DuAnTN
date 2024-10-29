package com.example.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUsController {
	@GetMapping("/about-us")
    public String aboutPage() {
        return "layouts/about-us";
    }
}
