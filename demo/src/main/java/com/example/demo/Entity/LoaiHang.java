package com.example.demo.Entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table (name = "loaihang")
public class LoaiHang {
    @Id
    private String maLH;

    private String tenLH;

    @OneToMany(mappedBy = "loaiHang", cascade = CascadeType.ALL)
    private List<SanPham> product;

    // Getters and setters
}
