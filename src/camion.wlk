import cosas.*

object camion {
	const property cosas = []
	
	method pesoTara() = 1000
	
	method cargar(unaCosa) {
		unaCosa.serCargado()
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
		}
		
	method peso() {
		return self.pesoTara()+cosas.sum {cosa=> cosa.peso()}
	}
	
	method estaExcedidoDePeso() {
		return self.peso() > 2500
	}
	
	method objetosConMayorNivelPeligrosidad(nPeligrosidad) {
		return cosas.filter {cosa=> cosa.peligrosidad() > nPeligrosidad  }
	}
	
	method objetosMasPeligrososQue(unaCosa) {
		return cosas.filter {cosa=> cosa.peligrosidad() > unaCosa.peligrosidad()}
	}
	
	method puedeCircularEnRuta(maxPeligrosidad) {
		return cosas.all {cosa=> cosa.peligrosidad() < maxPeligrosidad}
	}
	
	method tieneAlgoQuePesaEntre(num1, num2) {
		return cosas.any {cosa=> cosa.peso() < num2 && cosa.peso() > num1}
	}
	
	method cosaMasPesada() {
		return cosas.max {cosa=> cosa.peso()}
	}
	
	method totalBultos() {
		return cosas.sum {cosa=> cosa.bulto()}
	}
	
	method pesos() {
		return cosas.map {cosa=> cosa.peso()}
	}
	
	
	
}
