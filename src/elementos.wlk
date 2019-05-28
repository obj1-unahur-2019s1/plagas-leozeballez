class Hogar {
	var property nivelMugre
	var property confort
	
	method esBueno() = nivelMugre <= confort/2
	method recibirAtaque(plaga){nivelMugre += plaga.nivelDanio()}
}

class Huerta {
	var property capacidadProduccion
	
	method esBueno() = capacidadProduccion > reguladorNivel.nivel()
	method recibirAtaque(plaga){
		capacidadProduccion = capacidadProduccion - (plaga.nivelDanio() * 0.1)
		if(plaga.transmitirEnfermedad()){
			capacidadProduccion -= 10
		}
	}
}

object reguladorNivel {
	var property nivel
}

class Mascota {
	var property nivelSalud
	const nivelMinimo = 250
	
	method esBueno() = nivelSalud > nivelMinimo
	method recibirAtaque(plaga){
		if(plaga.transmitirEnfermedad()){
			nivelSalud -= plaga.nivelDanio()
		}
	}
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
	
	method nivelDanio() = poblacion * 2
	method transmitirEnfermedad() = poblacion > 10
	method atacar(elemento) {
		elemento.recibirAtaque(self)
		poblacion *= 1.1
	}
}

class PlagaCucas inherits Plaga {
	var property pesoPromedio
	
	override method transmitirEnfermedad() = super() and pesoPromedio >= 10
	override method nivelDanio() = poblacion / 2
	override method atacar(elemento){
		super(elemento)
		pesoPromedio += 2
	}
}

class PlagaPulgas inherits Plaga{
}

class PlagaGarrapatas inherits PlagaPulgas{
	override method atacar(elemento){
		super(elemento)
		poblacion += poblacion *0.2
	}
}

class PlagaMosquitos inherits Plaga{
	override method transmitirEnfermedad() = super() and poblacion % 3 == 0
	override method nivelDanio() = poblacion
}