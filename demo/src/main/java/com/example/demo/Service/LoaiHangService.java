package com.example.demo.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.Entity.LoaiHang;

public interface LoaiHangService {
    List<LoaiHang> findAll();
}
