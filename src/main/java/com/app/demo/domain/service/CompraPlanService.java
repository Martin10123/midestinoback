package com.app.demo.domain.service;

import com.app.demo.domain.dto.CompraPlanDTO;
import com.app.demo.domain.mapper.CompraPlanMapper;
import com.app.demo.domain.response.CompraPlanResponse;
import com.app.demo.persistence.entity.CarritoCompraPlan;
import com.app.demo.persistence.entity.Cliente;
import com.app.demo.persistence.entity.CompraPlan;
import com.app.demo.persistence.entity.Empresa;
import com.app.demo.persistence.entity.PlanEmpresa;
import com.app.demo.persistence.repository.CarritoCompraPlanRepository;
import com.app.demo.persistence.repository.ClienteRepository;
import com.app.demo.persistence.repository.CompraPlanRepository;
import com.app.demo.persistence.repository.EmpresaRepository;
import com.app.demo.persistence.repository.PlanEmpresaRepository;
import jakarta.transaction.Transactional;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompraPlanService {

    @Autowired
    private CarritoCompraPlanRepository carritoRepository;

    @Autowired
    private CompraPlanRepository compraPlanRepository;

    @Autowired
    private ClienteRepository clienteRepository;

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private PlanEmpresaRepository planEmpresaRepository;

    @Transactional
    public CompraPlanResponse agregarCompraPlan(CompraPlanDTO compraPlanDTO) {

        try {
            Optional<Cliente> clienteOpt = clienteRepository.findById(compraPlanDTO.getCliente().getIdCliente());
            if (!clienteOpt.isPresent()) {
                return new CompraPlanResponse("Cliente no encontrado", false, null, null);
            }

            Cliente cliente = clienteOpt.get();
            BigDecimal totalCompra = compraPlanDTO.getPrecios().stream()
                    .reduce(BigDecimal.ZERO, BigDecimal::add);

            CompraPlan compraPlan = CompraPlanMapper.toEntity(compraPlanDTO);
            compraPlan.setCliente(cliente);
            compraPlan.setPrecioTotalCompra(totalCompra);
            compraPlan.setFechaCompra(LocalDate.now().toString());
            CompraPlan compraPlanGuardado = compraPlanRepository.save(compraPlan);

            cliente.setPresupuesto(cliente.getPresupuesto().subtract(totalCompra));
            clienteRepository.save(cliente);

            Cliente admin = clienteRepository.findByEmail("admin@midestino.com")
                    .orElseThrow(() -> new RuntimeException("Admin no encontrado"));

            List<Long> planEmpresasIds = compraPlanDTO.getPlanesPorEmpresa();
            List<String> cantidadesCompradas = compraPlanDTO.getCantidadesCompradas();

            for (int i = 0; i < planEmpresasIds.size(); i++) {
                Long idPlanEmpresa = planEmpresasIds.get(i);
                int cantidadComprada = Integer.parseInt(cantidadesCompradas.get(i));

                Optional<PlanEmpresa> planOpt = planEmpresaRepository.findById(idPlanEmpresa);
                if (planOpt.isPresent()) {
                    PlanEmpresa plan = planOpt.get();

                    plan.setCantidadDisponible(plan.getCantidadDisponible() - cantidadComprada);
                    planEmpresaRepository.save(plan);

                    Empresa empresa = plan.getEmpresa();
                    BigDecimal ganancia = plan.getPrecio().multiply(BigDecimal.valueOf(cantidadComprada));
                    BigDecimal adminComision = ganancia.multiply(BigDecimal.valueOf(0.10));
                    BigDecimal gananciaNetaEmpresa = ganancia.subtract(adminComision);

                    empresa.setGanancias(empresa.getGanancias().add(gananciaNetaEmpresa));
                    empresaRepository.save(empresa);

                    admin.setPresupuesto(admin.getPresupuesto().add(adminComision));
                    clienteRepository.save(admin);
                } else {
                    throw new RuntimeException("Plan de empresa no encontrado con ID " + idPlanEmpresa);
                }
            }

            // Eliminar los elementos del carrito de compras
            eliminarDelCarritoCompras(cliente.getIdCliente());

            // Retornar la respuesta de la compra realizada
            return new CompraPlanResponse("Compra plan guardada correctamente", true,
                    CompraPlanMapper.toDTO(compraPlanGuardado), null);

        } catch (Exception e) {
            System.out.println(e);
            return new CompraPlanResponse("Error al procesar la compra: " + e.getMessage(), false, null, null);
        }
    }

    private void eliminarDelCarritoCompras(Long idCliente) {
        try {
            List<CarritoCompraPlan> listaCompras = carritoRepository.findByClienteIdCliente(idCliente);
            for (CarritoCompraPlan compra : listaCompras) {
                if (!compra.isEliminado()) {
                    compra.setEliminado(true);
                    compra.setFueAprobado(true);
                }
            }
            carritoRepository.saveAll(listaCompras);

        } catch (Exception e) {
            System.out.println("Error al eliminar el carrito de compras: " + e.getMessage());
        }
    }

    public CompraPlanResponse obtenerComprasPorCliente(Long clienteId) {
        try {
            List<CompraPlan> compras = compraPlanRepository.findByClienteIdCliente(clienteId);

            if (compras.isEmpty()) {
                return new CompraPlanResponse("No se encontraron compras para este cliente", false, null, null);
            }

            List<CompraPlanDTO> comprasDTO = compras.stream()
                    .map(CompraPlanMapper::toDTO)
                    .collect(Collectors.toList());

            return new CompraPlanResponse("Compras obtenidas correctamente", true, null, comprasDTO);
        } catch (Exception e) {
            return new CompraPlanResponse("Error al obtener las compras", false, null, null);
        }
    }

    public CompraPlanResponse obtenerComprasPorEmpresa(Long empresaId) {
        try {
            List<CompraPlan> compras = compraPlanRepository.findByEmpresaIdEmpresa(empresaId);

            if (compras.isEmpty()) {
                return new CompraPlanResponse("No se encontraron compras para esta empresa", false, null, null);
            }

            List<CompraPlanDTO> comprasDTO = compras.stream()
                    .map(CompraPlanMapper::toDTO)
                    .collect(Collectors.toList());

            return new CompraPlanResponse("Compras de la empresa obtenidas correctamente", true, null, comprasDTO);
        } catch (Exception e) {
            return new CompraPlanResponse("Error al obtener las compras por empresa", false, null, null);
        }
    }

}
