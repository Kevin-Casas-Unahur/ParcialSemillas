import Parcelas.*
import Plantas.*

object inta {
	const property parcelas = []
	
	method promedioDePlantas() = self.cantDePlantasPorParcela() / parcelas.size() 
	method cantDePlantasPorParcela() = parcelas.sum({p => p.plantas().size()})
	
	method parcelaMasAutosustentable() = self.parcelasConMasDe4Plantas().max({p => p.cantDePlantasBienAsociadas() } )
	method parcelasConMasDe4Plantas() = parcelas.filter({p => p.plantas().size() > 4} )
	
	method addParcela(parcela) {parcelas.add(parcela)}
}