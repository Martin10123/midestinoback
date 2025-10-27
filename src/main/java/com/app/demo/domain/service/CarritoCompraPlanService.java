package com.app.demo.domain.service;

import com.app.demo.domain.dto.CarritoCompraPlanDTO;
import com.app.demo.domain.mapper.CarritoCompraPlanMapper;
import com.app.demo.domain.response.CarritoCompraPlanReponse;
import com.app.demo.persistence.entity.CarritoCompraPlan;
import com.app.demo.persistence.entity.PlanEmpresa;
import com.app.demo.persistence.entity.Cliente;
import com.app.demo.persistence.repository.CarritoCompraPlanRepository;
import com.app.demo.persistence.repository.PlanEmpresaRepository;
import com.app.demo.persistence.repository.ClienteRepository;
import java.math.BigDecimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CarritoCompraPlanService {

    @Autowired
    private CarritoCompraPlanRepository carritoRepository;

    @Autowired
    private PlanEmpresaRepository planRepository;

    @Autowired
    private ClienteRepository clienteRepository;

    public CarritoCompraPlanReponse guardarCarrito(CarritoCompraPlanDTO carritoDTO) {
        CarritoCompraPlanReponse response = new CarritoCompraPlanReponse();
        try {
            Optional<PlanEmpresa> planOpt = planRepository.findById(carritoDTO.getPlanEmpresa().getId());
            Optional<Cliente> clienteOpt = clienteRepository.findById(carritoDTO.getCliente().getIdCliente());

            // Verificar si los valores están presentes
            if (planOpt.isPresent() && clienteOpt.isPresent()) {
                // Verifica si el carrito ya contiene el plan para el cliente
                Optional<CarritoCompraPlan> carritoExistenteOpt = carritoRepository.findByClienteIdClienteAndPlanEmpresaId(
                        clienteOpt.get().getIdCliente(), planOpt.get().getId()
                );

                CarritoCompraPlan carrito;

                if (carritoExistenteOpt.isPresent()) {
                    carrito = carritoExistenteOpt.get();
                    carrito.setCantidad(carrito.getCantidad() + carritoDTO.getCantidad());

                    if (carrito.isEliminado()) {
                        carrito.setCantidad(1);
                        carrito.setPrecioTotal(BigDecimal.valueOf(0));
                        carrito.setEliminado(false);
                    }

                    carrito.setPrecioTotal(planOpt.get().getPrecio().multiply(new BigDecimal(carrito.getCantidad())));
                    response.setMessage("Se actualizó la cantidad del producto");
                } else {
                    carrito = CarritoCompraPlanMapper.toEntity(carritoDTO);
                    carrito.setPlanEmpresa(planOpt.get());
                    carrito.setCliente(clienteOpt.get());
                    carrito.setPrecioTotal(planOpt.get().getPrecio().multiply(new BigDecimal(carritoDTO.getCantidad())));
                    response.setMessage("Se agregó el producto al carrito de compras");
                }

                carritoRepository.save(carrito);
                response.setCarrito(CarritoCompraPlanMapper.toDTO(carrito));
                response.setValid(true);
            } else {
                // Si el plan o cliente no se encuentran, devolver un mensaje claro
                if (!planOpt.isPresent()) {
                    response.setMessage("Plan no encontrado.");
                } else {
                    response.setMessage("Cliente no encontrado.");
                }
                response.setValid(false);
            }
        } catch (Exception e) {
            response.setMessage("Error al guardar el carrito: " + e.getMessage());
            response.setValid(false);
        }
        return response;
    }


    public CarritoCompraPlanReponse obtenerCarritosPorCliente(Long clienteId) {
        CarritoCompraPlanReponse response = new CarritoCompraPlanReponse();
        try {
            List<CarritoCompraPlanDTO> carritosList = carritoRepository.findByClienteIdCliente(clienteId)
                    .stream()
                    .filter(plan -> !plan.isEliminado())
                    .map(CarritoCompraPlanMapper::toDTO)
                    .collect(Collectors.toList());

            response.setCarritosList(carritosList);
            response.setMessage("Carritos obtenidos para el cliente con ID " + clienteId);
            response.setValid(true);
        } catch (Exception e) {
            response.setMessage("Error al obtener los carritos del cliente: " + e.getMessage());
            response.setValid(false);
        }
        return response;
    }

    public CarritoCompraPlanReponse obtenerCarritos() {
        CarritoCompraPlanReponse response = new CarritoCompraPlanReponse();
        try {
            List<CarritoCompraPlanDTO> carritosList = carritoRepository.findAll()
                    .stream()
                    .filter(plan -> !plan.isEliminado())
                    .map(CarritoCompraPlanMapper::toDTO)
                    .collect(Collectors.toList());

            response.setCarritosList(carritosList);
            response.setMessage("Lista de carritos obtenida.");
            response.setValid(true);
        } catch (Exception e) {
            response.setMessage("Error al obtener los carritos: " + e.getMessage());
            response.setValid(false);
        }
        return response;
    }

    public CarritoCompraPlanReponse eliminarCompra(Long id) {

        CarritoCompraPlanReponse response = new CarritoCompraPlanReponse();

        try {

            Optional<CarritoCompraPlan> compra = carritoRepository.findById(id);

            if (compra.isPresent()) {
                compra.get().setEliminado(true);
                response.setMessage("Eliminaste este producto del carrito de compra");
                response.setValid(true);

                carritoRepository.save(compra.get());
            } else {
                response.setMessage("No se encontro este producto en el carrito de compra");
                response.setValid(true);
            }

        } catch (Exception e) {
            response.setMessage("Error al eliminar la compra: " + e.getMessage());
            response.setValid(false);
        }

        return response;
    }
}
