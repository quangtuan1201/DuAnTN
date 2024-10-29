package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.Entity.LoaiHang;
@Repository
public interface LoaiHangRepository extends JpaRepository<LoaiHang,String>{

}
