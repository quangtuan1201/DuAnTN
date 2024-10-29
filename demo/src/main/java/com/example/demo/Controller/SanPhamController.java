    package com.example.demo.Controller;

    import java.util.HashMap;
    import java.util.List;
    import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Controller;
    import org.springframework.ui.Model;
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Entity.SanPham;
    import com.example.demo.Repository.SanPhamRepository;
    import com.example.demo.Service.SanPhamService;

    @Controller
    public class SanPhamController {

        @Autowired
        SanPhamService productService;

        @RequestMapping("/product")
        public String product(Model model, @RequestParam("cid") Optional<String> cid) {
            if(cid.orElse("").isEmpty()){
                 List<SanPham> products = productService.findAll();
            Map<SanPham, List<String>> productImagesMap = new HashMap<>();

            for (SanPham product : products) {
                List<String> images = productService.findImagesByProductId(product.getMaSP());
                if (!images.isEmpty()) {
                    productImagesMap.put(product, images); // Lưu tất cả ảnh
                } else {
                    productImagesMap.put(product, List.of("default.jpg")); // Ảnh mặc định
                }
            }
             model.addAttribute("listSanPham", productImagesMap);
             
            }else{
                List<SanPham> products = productService.findByCategoryId(cid.get());
                Map<SanPham, List<String>> productImagesMap = new HashMap<>();
    
                for (SanPham product : products) {
                    List<String> images = productService.findImagesByProductId(product.getMaSP());
                    if (!images.isEmpty()) {
                        productImagesMap.put(product, images); // Lưu tất cả ảnh
                    } else {
                        productImagesMap.put(product, List.of("default.jpg")); // Ảnh mặc định
                    }
                }
                model.addAttribute("listSanPham", productImagesMap);
            }                    
            return "layouts/product";
        }
    }

