import Parcelas.*

class Planta {
	var property anoDeObtencion = 0
	var property altura = 0
	
	method toleraHorasDeSol()
	method esFuerte() = self.toleraHorasDeSol() > 10
	method daNuevasSemillas() = self.esFuerte()
	method espacioOcupado()
	method esParcelaIdeal(parcela)
}

class Menta inherits Planta {
	
	override method toleraHorasDeSol() = 6
	override method daNuevasSemillas() {return super() or altura > 0.4}
	override method espacioOcupado() = altura * 3
	
	override method esParcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta {
	
	override method toleraHorasDeSol() {
		if (altura < 0.5) {
			return 6
		}
		else if (0.5 <= altura and altura <= 1) {
			return 7
		}
		else {
			return 9
		}
	}
	
	override method daNuevasSemillas() {return super() or (anoDeObtencion > 2007 and altura > 1) }
	override method espacioOcupado() = altura / 2
	
	override method esParcelaIdeal(parcela) = parcela.horasDeSol() == self.toleraHorasDeSol()
}

class Quinoa inherits Planta {
	
	var property toleraHorasDeSol = 0
	override method daNuevasSemillas() {return super() or anoDeObtencion < 2005}
	override method espacioOcupado() = 0.5
	
	override method esParcelaIdeal(parcela) = not parcela.plantas().any({p => p.altura() > 1.5 } )
}

//Variedades
class SojaTrangenica inherits Soja {
	
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1
}

class HierbaBuena inherits Menta {
	override method espacioOcupado() = super() * 2
}
