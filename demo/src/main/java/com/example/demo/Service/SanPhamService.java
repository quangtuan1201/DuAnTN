package com.example.demo.Service;

import java.util.List;

import com.example.demo.Entity.SanPham;

public interface SanPhamService {
    public List<SanPham> findAll() ;
    List<String> findImagesByProductId(int maSP); // Thêm phương thức này
    public List<SanPham> findByCategoryId(String cid) ;
}   
