package com.app.demo.domain.response;

import com.app.demo.domain.dto.UsuarioCompletoDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioCompletoResponse {

    private String message;
    private boolean valid;
    private UsuarioCompletoDTO usuarioCompleto;  // Single object response
    private List<UsuarioCompletoDTO> usuariosCompletoList; // List of objects response
}
