package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.example.demo.Entity.SanPham;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, Integer>{

     @Query("SELECT a.anh FROM AnhSanPham a WHERE a.sanPham.maSP = :maSP")
    List<String> findImagesByProductId(@Param("maSP") int maSP);


    @Query("SELECT p FROM SanPham p WHERE p.loaiHang.maLH=?1")
	List<SanPham> findByCategoryId(String cid);
}
