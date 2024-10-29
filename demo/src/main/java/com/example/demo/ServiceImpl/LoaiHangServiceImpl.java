package com.example.demo.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.LoaiHang;
import com.example.demo.Repository.LoaiHangRepository;
import com.example.demo.Service.LoaiHangService;

@Service
public class LoaiHangServiceImpl implements LoaiHangService{

    @Autowired
    LoaiHangRepository daoLH;
    @Override
    public List<LoaiHang> findAll() {
        // TODO Auto-generated method stub
        return daoLH.findAll();
    }

}
