class Hogar {
	var property nivelMugre
	var property confort
	
	method esBueno() = nivelMugre <= confort/2
}

class Huerta {
	var property capacidadProduccion
	
	method esBueno() = capacidadProduccion > reguladorNivel.nivel()
}

object reguladorNivel {
	var property nivel
}

class Mascota {
	var property nivelSalud
	const nivelMinimo = 250
	
	method esBueno() = nivelSalud > nivelMinimo
}

class Barrio {
	var property elementos = #{}
	var elementosBuenos = elementos.count { e => e.esBueno() }
	var elementosMalos = elementos.count { e => not e.esBueno() }
	
	method esCopado() = elementosBuenos > elementosMalos
}


class PlagaCucas {
	var property poblacion
	var pesoPromedio
	
	method transmitirEnfermedad() {}
	method nivelDanio() {}
}

class PlagaPulgas {
	var property poblacion
	var pesoPromedio
	
	method transmitirEnfermedad() {}
}

class PlagaGarrapatas {
	var property poblacion
	var pesoPromedio
	
	method transmitirEnfermedad() {}
}

class PlagaMosquitos {
	var property poblacion
	var pesoPromedio
	
	method transmitirEnfermedad() {}
}