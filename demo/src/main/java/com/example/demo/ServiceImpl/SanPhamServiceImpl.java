package com.example.demo.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.SanPham;
import com.example.demo.Repository.SanPhamRepository;
import com.example.demo.Service.SanPhamService;

@Service
public class SanPhamServiceImpl implements SanPhamService {

    @Autowired
	SanPhamRepository dao;

    @Override
    public List<SanPham> findAll() {
        // TODO Auto-generated method stub
        return dao.findAll();
    }

    @Override
    public List<String> findImagesByProductId(int maSP) {
        // TODO Auto-generated method 
        return dao.findImagesByProductId(maSP); // Gọi phương thức truy vấn

    }

    @Override
    public List<SanPham> findByCategoryId(String cid) {
        // TODO Auto-generated method stub
       return dao.findByCategoryId(cid);
    }

    
    }

    

