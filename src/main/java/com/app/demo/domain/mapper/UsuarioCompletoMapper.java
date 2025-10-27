package com.app.demo.domain.mapper;

import com.app.demo.domain.dto.UsuarioCompletoDTO;
import com.app.demo.persistence.entity.UsuarioCompleto;

public class UsuarioCompletoMapper {

    public static UsuarioCompletoDTO toDTO(UsuarioCompleto usuarioCompleto) {
        return UsuarioCompletoDTO.builder()
                .id(usuarioCompleto.getId())
                .nombreNegocio(usuarioCompleto.getNombreNegocio())
                .nombreLegal(usuarioCompleto.getNombreLegal())
                .nit(usuarioCompleto.getNit())
                .sector(usuarioCompleto.getSector())
                .fechaFundacion(usuarioCompleto.getFechaFundacion())
                .direccion(usuarioCompleto.getDireccion())
                .ciudad(usuarioCompleto.getCiudad())
                .numeroTelefono(usuarioCompleto.getNumeroTelefono())
                .email(usuarioCompleto.getEmail())
                .sitioWeb(usuarioCompleto.getSitioWeb())
                .documentosFinancieros(usuarioCompleto.getDocumentosFinancieros())
                .nombreRepresentante(usuarioCompleto.getNombreRepresentante())
                .numeroIdRepresentante(usuarioCompleto.getNumeroIdRepresentante())
                .numeroRegistro(usuarioCompleto.getNumeroRegistro())
                .fechaRegistro(usuarioCompleto.getFechaRegistro())
                .entidadRegistro(usuarioCompleto.getEntidadRegistro())
                .tipoUsuario(usuarioCompleto.getTipoUsuario())
                .contrasena(usuarioCompleto.getContrasena())
                .empresaFueAceptada(usuarioCompleto.isEmpresaFueAceptada())
                .build();
    }

    public static UsuarioCompleto toEntity(UsuarioCompletoDTO usuarioCompletoDTO) {
        return UsuarioCompleto.builder()
                .id(usuarioCompletoDTO.getId())
                .nombreNegocio(usuarioCompletoDTO.getNombreNegocio())
                .nombreLegal(usuarioCompletoDTO.getNombreLegal())
                .nit(usuarioCompletoDTO.getNit())
                .sector(usuarioCompletoDTO.getSector())
                .fechaFundacion(usuarioCompletoDTO.getFechaFundacion())
                .direccion(usuarioCompletoDTO.getDireccion())
                .ciudad(usuarioCompletoDTO.getCiudad())
                .numeroTelefono(usuarioCompletoDTO.getNumeroTelefono())
                .email(usuarioCompletoDTO.getEmail())
                .sitioWeb(usuarioCompletoDTO.getSitioWeb())
                .documentosFinancieros(usuarioCompletoDTO.getDocumentosFinancieros())
                .nombreRepresentante(usuarioCompletoDTO.getNombreRepresentante())
                .numeroIdRepresentante(usuarioCompletoDTO.getNumeroIdRepresentante())
                .numeroRegistro(usuarioCompletoDTO.getNumeroRegistro())
                .fechaRegistro(usuarioCompletoDTO.getFechaRegistro())
                .entidadRegistro(usuarioCompletoDTO.getEntidadRegistro())
                .tipoUsuario(usuarioCompletoDTO.getTipoUsuario())
                .contrasena(usuarioCompletoDTO.getContrasena())
                .empresaFueAceptada(usuarioCompletoDTO.isEmpresaFueAceptada())
                .build();
    }
}
