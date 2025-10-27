package com.app.demo.persistence.repository;

import com.app.demo.persistence.entity.ValoracionPlan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ValoracionPlanRepository extends JpaRepository<ValoracionPlan, Long> {

    @Query("SELECT AVG(v.puntuacion) FROM ValoracionPlan v WHERE v.planEmpresa.id = :planEmpresaId")
    Double calcularPromedioValoracion(@Param("planEmpresaId") Long planEmpresaId);

    ValoracionPlan findByPlanEmpresaIdAndClienteId(Long planEmpresaId, Long clienteId);
}
