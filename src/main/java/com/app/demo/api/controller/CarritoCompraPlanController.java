package com.app.demo.api.controller;

import com.app.demo.domain.dto.CarritoCompraPlanDTO;
import com.app.demo.domain.response.CarritoCompraPlanReponse;
import com.app.demo.domain.service.CarritoCompraPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/carritos")
public class CarritoCompraPlanController {

    @Autowired
    private CarritoCompraPlanService carritoService;

    @PostMapping("/guardar")
    public ResponseEntity<CarritoCompraPlanReponse> guardarCarrito(@RequestBody CarritoCompraPlanDTO carritoDTO) {
        CarritoCompraPlanReponse response = carritoService.guardarCarrito(carritoDTO);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/listar")
    public ResponseEntity<CarritoCompraPlanReponse> obtenerCarritos() {
        CarritoCompraPlanReponse response = carritoService.obtenerCarritos();
        return ResponseEntity.ok(response);
    }

    @GetMapping("/cliente/{clienteId}")
    public ResponseEntity<CarritoCompraPlanReponse> obtenerCarritosPorCliente(@PathVariable Long clienteId) {
        CarritoCompraPlanReponse response = carritoService.obtenerCarritosPorCliente(clienteId);
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<CarritoCompraPlanReponse> eliminarProducto(@PathVariable Long id) {
        CarritoCompraPlanReponse response = carritoService.eliminarCompra(id);
        return ResponseEntity.ok(response);
    }
}
