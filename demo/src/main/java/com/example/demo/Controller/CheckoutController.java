package com.example.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CheckoutController {
    @RequestMapping("/about-us")
    public String checkout(){
        return "layouts/product-checkout";
    }
}
