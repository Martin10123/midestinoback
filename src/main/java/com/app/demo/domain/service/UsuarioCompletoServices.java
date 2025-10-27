package com.app.demo.domain.service;

import com.app.demo.domain.dto.UsuarioCompletoDTO;
import com.app.demo.domain.mapper.UsuarioCompletoMapper;
import com.app.demo.domain.response.UsuarioCompletoResponse;
import com.app.demo.persistence.entity.UsuarioCompleto;
import com.app.demo.persistence.repository.UsuarioCompletoRepository;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioCompletoServices {

    @Autowired
    private UsuarioCompletoRepository usuarioCompletoRepository;

    public UsuarioCompletoDTO guardarUsuarioCompleto(UsuarioCompletoDTO usuarioCompletoDTO) throws Exception {
        try {
            UsuarioCompleto usuarioCompleto = UsuarioCompletoMapper.toEntity(usuarioCompletoDTO);
            usuarioCompleto = usuarioCompletoRepository.save(usuarioCompleto);

            return UsuarioCompletoMapper.toDTO(usuarioCompleto);
        } catch (Exception e) {
            throw new Exception("Error saving user: " + e.getMessage(), e);
        }
    }

    public UsuarioCompletoResponse iniciarSesion(UsuarioCompletoDTO loginRequest) throws Exception {
        try {
            UsuarioCompletoResponse response = new UsuarioCompletoResponse();

            Optional<UsuarioCompleto> optionalUsuario = usuarioCompletoRepository
                    .findByEmailAndContrasenaAndTipoUsuarioAndEmpresaFueAceptada(
                            loginRequest.getEmail(),
                            loginRequest.getContrasena(),
                            loginRequest.getTipoUsuario(),
                            true
                    );

            // Check if the user exists and if the company was accepted
            if (optionalUsuario.isEmpty()) {
                // If user is not found, check if the email exists first
                Optional<UsuarioCompleto> usuarioExistente = usuarioCompletoRepository
                        .findByEmailAndContrasena(loginRequest.getEmail(), loginRequest.getContrasena());

                if (usuarioExistente.isPresent()) {
                    // Company not accepted
                    response.setMessage("La empresa no fue aceptada.");
                    response.setValid(false);
                    return response;
                }

                // Incorrect credentials
                response.setMessage("Credenciales incorrectas.");
                response.setValid(false);
                return response;
            }

            // If login is successful
            UsuarioCompleto usuarioCompleto = optionalUsuario.get();
            UsuarioCompletoDTO usuarioCompletoDTO = UsuarioCompletoMapper.toDTO(usuarioCompleto);

            response.setMessage("Login exitoso");
            response.setValid(true);
            response.setUsuarioCompleto(usuarioCompletoDTO);
            return response;
        } catch (Exception e) {
            throw new Exception("Error saving user: " + e.getMessage(), e);
        }
    }

    public List<UsuarioCompletoDTO> obtenerUsuariosPorTipoEmpresa() {
        List<UsuarioCompleto> usuarios = usuarioCompletoRepository.findByTipoUsuario("Empresa");
        return usuarios.stream()
                .map(UsuarioCompletoMapper::toDTO)
                .collect(Collectors.toList());
    }
}
