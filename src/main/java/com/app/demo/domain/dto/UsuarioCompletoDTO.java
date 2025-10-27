package com.app.demo.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioCompletoDTO {

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
