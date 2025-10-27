package com.app.demo.domain.response;

import com.app.demo.domain.dto.CarritoCompraPlanDTO;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CarritoCompraPlanReponse {
    private String message;
    private boolean valid;
    private CarritoCompraPlanDTO carrito;
    private List<CarritoCompraPlanDTO> carritosList;
}
