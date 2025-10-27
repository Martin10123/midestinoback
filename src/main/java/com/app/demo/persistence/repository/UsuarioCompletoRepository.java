package com.app.demo.persistence.repository;

import com.app.demo.persistence.entity.UsuarioCompleto;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioCompletoRepository extends JpaRepository<UsuarioCompleto, Long> {

    Optional<UsuarioCompleto> findByEmailAndContrasena(String email, String contrasena);

    Optional<UsuarioCompleto> findByEmailAndContrasenaAndTipoUsuarioAndEmpresaFueAceptada(
            String email, String contrasena, String tipoUsuario, boolean empresaFueAceptada);

    List<UsuarioCompleto> findByTipoUsuario(String tipoUsuario);
}
