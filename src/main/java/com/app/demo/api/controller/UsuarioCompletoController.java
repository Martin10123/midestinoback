package com.app.demo.api.controller;

import com.app.demo.domain.dto.UsuarioCompletoDTO;
import com.app.demo.domain.response.UsuarioCompletoResponse;
import com.app.demo.domain.service.UsuarioCompletoServices;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/usuarioCompleto")
public class UsuarioCompletoController {

    @Autowired
    private UsuarioCompletoServices usuarioCompletoServices;

    @PostMapping("/registrar")
    public ResponseEntity<UsuarioCompletoResponse> registerUsuarioCompleto(@RequestBody UsuarioCompletoDTO usuarioCompletoDTO) {
        UsuarioCompletoResponse response = new UsuarioCompletoResponse();

        try {
            UsuarioCompletoDTO savedUsuario = usuarioCompletoServices.guardarUsuarioCompleto(usuarioCompletoDTO);

            response.setMessage("Usuario guardado correctamente");
            response.setValid(true);
            response.setUsuarioCompleto(savedUsuario);

            return new ResponseEntity<>(response, HttpStatus.CREATED);
        } catch (Exception e) {
            response.setMessage("Error registering user: " + e.getMessage());
            response.setValid(false);
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/iniciar-sesion")
    public ResponseEntity<UsuarioCompletoResponse> iniciarSesion(@RequestBody UsuarioCompletoDTO loginRequest) {

        try {
            UsuarioCompletoResponse response = usuarioCompletoServices.iniciarSesion(loginRequest);

            if (response.isValid()) {
                return ResponseEntity.ok(response); // Successful login
            } else {
                return ResponseEntity.status(401).body(response); // Unauthorized response with message
            }
        } catch (Exception e) {

            UsuarioCompletoResponse response = new UsuarioCompletoResponse();

            response.setMessage("Error registering user: " + e.getMessage());
            response.setValid(false);
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/usuarios-empresa")
    public ResponseEntity<List<UsuarioCompletoDTO>> obtenerUsuariosPorTipoEmpresa() {
        List<UsuarioCompletoDTO> usuarios = usuarioCompletoServices.obtenerUsuariosPorTipoEmpresa();
        return ResponseEntity.ok(usuarios);
    }

}
