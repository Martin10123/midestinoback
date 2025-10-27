package com.app.demo.persistence.repository;

import com.app.demo.persistence.entity.PlanEmpresa;
import com.app.demo.persistence.entity.Empresa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlanEmpresaRepository extends JpaRepository<PlanEmpresa, Long> {

    List<PlanEmpresa> findByEmpresa(Empresa empresa);
}
