function ItemLocal($row)
{
	var self = this;
	this.main =  document.createElement('div')
	this.main.id = 'ItemLocal';

	var header_titulo =  document.createElement('div')
	header_titulo.id = 'ItemLocal_header_titulo'
	$(this.main).append(header_titulo)
	
	var titulo_txt =  document.createElement('div')
	titulo_txt.id = 'ItemLocal_titulo_txt'
	$(header_titulo).append(titulo_txt)

	var btn_ver_en_mapa = new Boton2Frames("img/ofertas/marker_lineas.svg", 25, 50, doVerEnMapa)
	btn_ver_en_mapa.main.id = 'UnaOferta_btn_ver_en_mapa'
	$(header_titulo).append(btn_ver_en_mapa.main)

		$(titulo_txt).html($row.locales_localidad +'<br />' + $row.locales_dir+'<br style="clear:both;" />' );
	
		
		

		addRegistro('Descuento', $row.locales_descuento)
				addRegistro('Cuotas', $row.locales_cutoas)
				addRegistro('Días de descuentos', $row.locales_dias)
				addRegistro('Teléfono', '<a href="tel:' + $row.locales_tel + '">' + $row.locales_tel + "</a>")
				addRegistro('Dirección', $row.locales_dir)
				addRegistro('Observaciones', $row.locales_desc)

		

	function doVerEnMapa(){

		//app.secciones.go(app.secciones.seccionmapa, 300, {solo_ver:'ofertas', center:[obj.row.ofertas_lat, obj.row.ofertas_lon]});

	}
	
	function addRegistro($label, $data){

		$(self.main).append('<div class="UnaOferta_reg"><div class="UnaOferta_label">'+ $label+
							  '</div><div class="UnaOferta_data" ><div>'+ $data+
							  '</div></div><br style="clear:both" /></div>');
		
	}


}

