function UnaOferta()
{
	var self = this;
	this.main =  document.createElement('div')
	this.main.id = 'UnaOferta';
	

	var holder = document.createElement('div')
	holder.id = 'UnaOferta_holder'
	holder.className = 'Tabs_holder'
	$(holder).append('<div></div>')
	$(this.main).append(holder)

	$(holder).css({width: app.ancho-40, height: app.alto-120});

	var img = new Image()
	img.id = 'SeccionUnaOferta_img'
	$(holder).find('>div').append(img)

	var hoy = new Image();
	hoy.id =  'UnaOferta_hoy';
	hoy.src = 'img/hoy.svg';
	$(holder).find('>div').append(hoy);
	

	var header_titulo =  document.createElement('div')
	header_titulo.id = 'UnaOferta_header_titulo'
	$(holder).find('>div').append(header_titulo)
	
	var titulo_txt =  document.createElement('div')
	titulo_txt.id = 'UnaOferta_titulo_txt'
	$(header_titulo).append(titulo_txt)

	var holder_data =  document.createElement('div')
	holder_data.id = 'UnaOferta_holder_data'
	$(holder).find('>div').append(holder_data)

	var holder_footer =  document.createElement('div')
	holder_footer.id = 'UnaOferta_holder_footer'
	$(holder).find('>div').append(holder_footer)

	var btn_compartir = new Boton("<img src='img/fb.svg' width='20' />&nbsp;&nbsp;COMPARTIR", doCompartir, 'BotonAzul')
	btn_compartir.main.id = 'UnaOferta_btn_compartir'
	$(holder_footer).append(btn_compartir.main)

	var btn_volver = new Boton2Frames("img/btn_volver.svg", 25, 50, doVolver)
	btn_volver.main.id = 'UnaOferta_btn_volver'
	$(header_titulo).append(btn_volver.main)

	
/*
	var is ;
	var scroll_set =  false*/
	var obj;

	function doVolver(){
		app.secciones.seccioneventosofertas.ir_a_una_solapa({solapa: 'ofertas'})
		//app.secciones.go(app.secciones.seccioneventosofertas, 300, {solapa: 'ofertas'});

	}
	
	
	function doCompartir(){


		app._Facebook.conectar(function(){

                var params = {
                    method: 'feed',
                    name:  obj.row.ofertas_nombre,
                    link: 'http://www.ideasparahoy.com.uy',
                    picture: 'http://santander.crudo.com.uy/icon.png',
                    caption: obj.row.ofertas_descuento+'. '+obj.row.ofertas_cutoas,
                    description: 'Publicado a través de la APP de Eventos y Descuentos de Banco Santander. Descargala gratis en www.ideasparahoy.com.uy y enterate de las actividades del verano.'
                  };
            
            FB.ui(params, function(obj) { console.log(obj);});
		}) 
     
                
	}

	this._set = function ($obj){

		obj = $obj;
		img.src = 'img/fotos_header_ofertas/' + $obj.row.ofertas_header_img;
		$(img).css('width', app.ancho-40);

		$(titulo_txt).html($obj.row.ofertas_nombre);
		$(holder_data).empty();
		
		app.db.transaction(function (tx) {

			tx.executeSql("SELECT * FROM locales WHERE locales_estado=1 AND locales_ofertas_id="+$obj.row.ofertas_id+" AND locales_departamentos_id="+app.depto_que_me_encuentro , [], function (tx, resulato_locales) {
		    	
		    	var cant_locales = resulato_locales.rows.length;
		    	
		        for(var i=0; i<cant_locales; i++){
					
		        	var itemlocal = new ItemLocal(resulato_locales.rows.item(i));
		        	$(holder_data).append(itemlocal.main)

		        }
		    });
		}, app.db_errorGeneral);

	}

}

