import Plantas.*

class Parcela {
	
	var property ancho
	var property largo
	var property horasDeSol
	const property plantas = []
	
	method superficie() = ancho * largo
	method cantidadMaximaDePlantas() {return if (ancho > largo) self.superficie() / 5 else {self.superficie() / 3 + largo } }
	method tieneComplicaciones() {return plantas.any( {p => p.toleraHorasDeSol() < horasDeSol} ) }
	method plantar(planta) {
		if (plantas.size() == self.cantidadMaximaDePlantas() or self.hayAlgunaPlantaConPocaTolerancia()) {
			self.error("No se puede plantar")
		}
		else {
			plantas.add(planta)
		}
	}
	method hayAlgunaPlantaConPocaTolerancia() {return plantas.any({p => (horasDeSol - p.toleraHorasDeSol() ) >= 2} )}
	
	method seAsociaBien(planta)
	method cantDePlantasBienAsociadas() = plantas.count({p => self.seAsociaBien(p) } )
}

class ParcelaEcologica inherits Parcela {
	
	override method seAsociaBien(planta) = not self.tieneComplicaciones() and planta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	
	override method seAsociaBien(planta) = planta.esFuerte() and plantas.size() <= 2
}

