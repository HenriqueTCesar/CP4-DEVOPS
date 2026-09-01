package com.exemplo.repository;

import com.exemplo.model.Conta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContaRepository extends JpaRepository<Conta, Long> {
    // Só de estender o JpaRepository, você já ganha métodos como save(), findAll(), findById(), etc.
}