

object knightRider {
	method peso() { return 500 }
	method peligrosidad() { return 10 }
	method bulto() = 1
	
	method serCargado() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method bulto() = 2
	method peso() { return 800 }
	method peligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	
	method serCargado() { self.transformar() }
}

object packLadrillos {
	var property peso = 0
	//Cant. ladrillos = peso/2	
	method bulto() {
		if ((self.peso()/2) > 300) {return 3}
		else return self.bulto_()
	}
	
	method bulto_() {
		if ((self.peso()/2) > 100) {return 2}
		else return 1
	}
	
	
	method peligrosidad() = 2
	method agregarLadrillos(n) { peso += n * 2 }
	
	method serCargado() { peso += 12*2 }
}

object arenaAgranel {
	var property peso 
	method bulto() = 1
	method peligrosidad() = 1
	
	method serCargado() { 
		if (peso==null) {peso=20}
		else peso += 20
	}
}

object bateriaAntiaerea {
	var property peso = 200
	var property peligrosidad = 0 
	var property bulto = 1
	method cargarMisiles() { 
		peligrosidad = 100
		peso = 300
		bulto = 2
	}
	
	method descargarMisiles() { 
		peligrosidad = 0
		peso = 200
		bulto = 1
	}
	
	method serCargado() { self.cargarMisiles() }
}

object contenedorPortuario {
	var cosas = []
	
	method bulto() {
		return 1 + cosas.sum {cosa=> cosa.bulto()}
	}
	method peso() {
		return 100 + cosas.sum {cosa=> cosa.peso()}
	}
	
	method cargar(cosa) {
		cosas.add(cosa)
	}
	
	method serCargado() {
		cosas.forEach { cosa=> cosa.serCargado() }
	}
}

object residuosRadiactivos {
	var property peso
	method bulto() = 1
	method peligrosidad() = 200
	
	method serCargado() { 
		if (peso==null) {peso=15}
		else peso += 15
	}
}

object embalajeSeguridad {
var property peso 
var property peligrosidad 
//Se asume que siempre se envuelve algo

	method bulto() = 2
	method embalar(cosa) {
		peso = cosa.peso()
		peligrosidad = cosa.peligrosidad() / 2
	}
	
	method serCargado() {}
}

