package com.exemplo.controller;

import com.exemplo.model.Conta;
import com.exemplo.repository.ContaRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/contas")
public class ContaController {

    private final ContaRepository repository;

    // Injeção de dependência via construtor
    public ContaController(ContaRepository repository) {
        this.repository = repository;
    }

    // Endpoint para listar todas as contas
    @GetMapping
    public List<Conta> listarTodas() {
        return repository.findAll();
    }

    // Endpoint para criar uma nova conta
    @PostMapping
    public Conta criarConta(@RequestBody Conta novaConta) {
        return repository.save(novaConta);
    }
}