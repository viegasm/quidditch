class Equipo {

	var property jugadores = #{}
	var property puntos = 0

	method habilidadPromedio() {
		return self.habilidadDelEquipo() / self.cantidadJugadores()
	}

	method cantidadJugadores() = jugadores.size()

	method habilidadDelEquipo() {
		return jugadores.sum({ jugador => jugador.habilidad() })
	}

	method tieneJugadorEstrella() {
		return jugadores.any({ jugador => jugador.esEstrella() })
	}
	
	method jugarContra(otroEquipo) {
		jugadores.forEach({jugador => jugador.jugarUnTurno()})
	}
	
	method ganarPuntos(puntosGanados) = self.puntos(puntos + puntosGanados)

}

