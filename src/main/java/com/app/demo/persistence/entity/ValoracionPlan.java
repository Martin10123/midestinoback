package com.app.demo.persistence.entity;

import lombok.Data;
import jakarta.persistence.*;

@Entity
@Table(name = "Valoraciones")
@Data
public class ValoracionPlan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "plan_empresa_id", nullable = false)
    private PlanEmpresa planEmpresa;

    @Column(nullable = false)
    private Long clienteId;

    @Column(nullable = false)
    private Integer puntuacion;
}
