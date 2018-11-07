object nimbus {

	var salud
	var anioFabricacion

	method velocidad() = 80 - self.antiguedad() * salud

	method antiguedad() {
		var anioActual = new Date().Year()
		return anioActual - anioFabricacion
	}

}

object saetaDeFuego {

	method velocidad() = 100

}