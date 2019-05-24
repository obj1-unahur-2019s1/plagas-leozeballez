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

//PLAGAS
class Plaga {
	var property poblacion
	
	method transmitirEnfermedad() = poblacion > 10
	method atacar(elemento) {
		poblacion *= 1.1
	}
}

class PlagaCucas inherits Plaga {
	var property pesoPromedio
	
	override method transmitirEnfermedad() = super() and pesoPromedio >= 10
	method nivelDanio() = poblacion / 2
	override method atacar(elemento){
		super(elemento)
		poblacion += 2
	}
}

class PlagaPulgas inherits Plaga{
	method nivelDanio() = poblacion * 2
}

class PlagaGarrapatas inherits PlagaPulgas{
	override method atacar(elemento){
		super(elemento)
		poblacion += poblacion *0.2
	}
}

class PlagaMosquitos inherits Plaga{
	override method transmitirEnfermedad() = super() and poblacion % 3 == 0
	method nivelDanio() = poblacion
}