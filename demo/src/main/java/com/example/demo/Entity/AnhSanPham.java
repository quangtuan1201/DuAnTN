package com.example.demo.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor @NoArgsConstructor
@Table ( name = "anhsanpham")
public class AnhSanPham {
    @Id
    private String maanh;

    private String anh;

    @ManyToOne
    @JoinColumn(name = "maSP")
    private SanPham sanPham;

    // Getters and setters
}