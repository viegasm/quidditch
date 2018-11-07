import pelotas.*

class Jugador {

	var property skills
	var peso
	var escoba
	var fuerza
	var punteria
	var reflejos
	var vision
	var equipo
	var property pelota = ninguna

	method nivelManejoEscoba() = skills / peso

	method velocidad() = escoba.velocidad() * self.nivelManejoEscoba()

	method habilidad() = self.velocidad() + skills

	method lePasaElTrapoA(otroJugador) {
		return self.habilidad() > otroJugador.habilidad() * 2
	}

	method esGroso() {
		return self.esHabilidoso() && (self.velocidad() > escoba.valorArbitrario())
	}

	method esHabilidoso() {
		return self.habilidad() > equipo.habilidadPromedio()
	}

	method esEstrella(equipoContrario) {
		return equipoContrario.jugadores().forAll({ jugador => self.lePasaElTrapoA(jugador) })
	}
	
	method ganarSkills(cantidad) = self.skills(skills + cantidad)

}

class Cazador inherits Jugador {

	override method habilidad() = super() + punteria * fuerza

	method jugarUnTurno() {
		
		if (pelota.equals(quaffle)) {
			self.intentarGol()
			self.pelota(ninguna)
		}
		
	}
	
	method intentarGol() {
		
		if (self.evitaBloqueos()){
			equipo.ganarPuntos(10)
			self.ganarSkills(5)
		}
		
	}
	
	method evitaBloqueos() {
		
		
		
	}

}

class Guardian inherits Jugador {

	override method habilidad() = super() + reflejos + fuerza

}

class Golpeador inherits Jugador {

	override method habilidad() = super() + punteria + fuerza

}

class Buscador inherits Jugador {

	override method habilidad() = super() + reflejos * vision

}

