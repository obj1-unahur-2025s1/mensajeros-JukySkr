//Mesajeros
object roberto {
  var vehiculo = null

  method puedeEntregar(unPaquete, destino) {
    return self.puedeLlegar(destino) and unPaquete.estado() == "pago"
  }

  method peso() = 90 + vehiculo.peso()

  method usarVehiculo(unVehiculo) {vehiculo = unVehiculo} 

  method puedeLlamar() = false

  method puedeLlegar(destino) = destino.requisito(self)
}

object chuckNorris {
  
  method peso() = 80
  
  method puedeEntregar(unPaquete, destino) {
    return self.puedeLlegar(destino) and unPaquete.estado() == "pago"
  }

  method puedeLlegar(destino) = destino.requisito(self)
}

object neo {
  var puedeLlamar = true  
  method peso() = 0

  method puedeLlamar() = puedeLlamar
  method puedeEntregar(unPaquete, destino) {
    return self.puedeLlegar(destino) and unPaquete.estado() == "pago"
  }

  method tieneCredito(bool) {puedeLlamar = bool}

  method puedeLlegar(destino) = destino.requisito(self)
}

//Destinos
object brooklyn {
  method requisito(mensajero) {
    return mensajero.peso() < 1000 
  }
}

object laMatrix {
  method requisito(mensajero) {
    return mensajero.puedeLlamar() 
  }
}

//Vehiculos
object bici {
  method peso() = 5
}

object camion {
  var acoplados = 0
  method peso() = 500 * acoplados

  method acoplar(cantidad) {
    acoplados =+ cantidad
  }
}

//Paquete
object paquete {
  var estado = "noPago"
  method estado() = estado
  method pagar() {estado = "pago"}
}

object paquetito {
  method estado() = "pago"
}

object paqueton {
  
}

//Empresa de mensajeria

object empresa {
  var mensajeros = []

  method contratar(mensajero) = mensajeros.add(mensajero)

  method despedir(mensajero) = mensajeros.remove(mensajero)

  method despedirATodos() = mensajeros.clear()

  method esGrande() = mensajeros.size() > 2

  method puedeEntregarElPrimero(unPaquete, destino) = mensajeros.first().puedeEntregar(unPaquete, destino)

  method pesoDelUltimo() = mensajeros.last().peso()


}