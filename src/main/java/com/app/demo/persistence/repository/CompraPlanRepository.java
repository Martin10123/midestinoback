package com.app.demo.persistence.repository;

import com.app.demo.persistence.entity.CompraPlan;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CompraPlanRepository extends JpaRepository<CompraPlan, Long> {
    List<CompraPlan> findByClienteIdCliente(Long id);

    @Query("SELECT c FROM CompraPlan c WHERE :empresaId MEMBER OF c.empresas")
    List<CompraPlan> findByEmpresaIdEmpresa(@Param("empresaId") Long empresaId);
}
