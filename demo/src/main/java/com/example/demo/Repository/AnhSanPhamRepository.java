package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Entity.AnhSanPham;

public interface AnhSanPhamRepository extends JpaRepository<AnhSanPham, String>{
    List<AnhSanPham> findBySanPham_MaSP(int maSP);
}
