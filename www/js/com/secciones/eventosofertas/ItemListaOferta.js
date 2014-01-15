function ItemListaOferta($row)
{
	
	var self = this
	this.main = document.createElement('div');
	this.main.className = 'ItemListaOferta';

	var txt = document.createElement('div');
	txt.className = 'ItemListaOferta_txt_nombre';
	$(this.main).append(txt)
	$(txt).html($row.ofertas_nombre)

	var txt = document.createElement('div');
	txt.className = 'ItemListaOferta_txt_descuento';
	$(this.main).append(txt)
	$(txt).html($row.ofertas_descuento)
	
	var hoy = new Image();
	hoy.className =  'ItemListaOferta_hoy';
	hoy.src = 'img/hoy.png';
	$(this.main).append(hoy);


	var haciendo_click = false;

	if(app.es_touch()){
		/*this.main.addEventListener('touchstart', doTocuhStart);
		this.main.addEventListener('touchend', doTocuhEnd);
		document.addEventListener('touchmove', doTocuhMove);*/
	}else{

		this.main.addEventListener('click', doClick);
	}
	function doTocuhMove(){
		
		despintar()	
		haciendo_click = false
	}
	function doTocuhStart(){
		pintar()	
		haciendo_click = true
	}

	function doTocuhEnd(){
		
		if(haciendo_click){
			app.secciones.seccioneventosofertas.ir_a_una_solapa({solapa:'una_oferta', row: $row})
			setTimeout(despintar, 800)
			haciendo_click = false
		}

	}


	function doClick(e){
		pintar()
		setTimeout(function(){
			app.secciones.seccioneventosofertas.ir_a_una_solapa({solapa:'una_oferta', row: $row})
			//app.secciones.go(app.secciones.seccioneventosofertas, 300, {solapa:'una_oferta', row: $row})

		}, 200)
		setTimeout(despintar, 800)
	}

	function pintar(){

		$(self.main).css('background-color', '#ccc')

	}
	function despintar(){

		$(self.main).css('background-color', '#fff')
	
	}
}

