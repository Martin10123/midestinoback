package com.app.demo.persistence.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "UsuarioCompleto")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioCompleto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombreNegocio;

    private String nombreLegal;

    private String nit;

    private String sector;

    private String fechaFundacion;

    private String direccion;

    private String ciudad;

    private String numeroTelefono;

    private String email;

    private String sitioWeb;

    private String documentosFinancieros;

    private String nombreRepresentante;

    private String numeroIdRepresentante;

    private String numeroRegistro;

    private String fechaRegistro;

    private String entidadRegistro;

    private String tipoUsuario;

    private String contrasena;

    private boolean empresaFueAceptada;
}
