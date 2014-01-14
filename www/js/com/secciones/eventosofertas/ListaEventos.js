function ListaEventos()
{
	
	var self = this
	this.main = document.createElement('div')
	this.main.id = 'ListaEventos';
	
	var btn_ver_en_mapa = new Boton('VER EN MAPA', doVerEnMapa);
	btn_ver_en_mapa.main.id = 'ListaEventos_btn_ver_en_mapa'
	$(this.main).append(btn_ver_en_mapa.main);

	var btn_subir_evento = new Boton('SUBIR EVENTO', doSubirEvento);
	btn_subir_evento.main.id = 'ListaEventos_btn_subir_evento'
	$(this.main).append(btn_subir_evento.main);

	$(btn_ver_en_mapa.main).css({'margin-left': -132, top: app.alto-75});
	$(btn_subir_evento.main).css({'margin-left': 2, top: app.alto-75});


	var holder = document.createElement('div')
	holder.id = 'ListaEventos_holder'
	holder.className = 'Tabs_holder'
	$(holder).append('<div></div>')
	$(this.main).append(holder),



	$(holder).css({width: app.ancho-40, height: app.alto-200});

	var is ;
	var scroll_set =  false

	$(document).bind('LISTAR_EVENTOS', do_LISTAR_EVENTOS);

	
	function doVerEnMapa(e){

		app.secciones.go(app.secciones.seccionmapa, 300, {solo_ver:'eventos'})

	}
	function doSubirEvento(e){

		app.secciones.seccioneventosofertas.ir_a_una_solapa({solapa:'subirevento'})
		
	}


	
	function do_LISTAR_EVENTOS(){

		self.listar('');

	}


	this.listar =  function ($busqueda, $callback){

		var _date = new Date();
		var mes =  (_date.getMonth()+1)
		if(mes<10) mes = '0' + mes;
		var dia =  (_date.getDate())
		if(dia<10) dia = '0' + dia;

		var fecha_hasta_hoy = _date.getFullYear() + '-' + mes + '-' + dia + ' 00:00:00';

		
		var where = ' WHERE eventos_estado=1 AND  eventos_fecha_hora>="'+fecha_hasta_hoy+'" ';
		if($busqueda != ''){
			where = ' WHERE (eventos_nombre LIKE "%' + $busqueda + '%" OR eventos_tags LIKE "%' + $busqueda + '%") AND eventos_estado=1 AND  eventos_fecha_hora>="'+fecha_hasta_hoy+'"';
		}


		$(holder).find('>div').empty();

		app.db.transaction(function (tx) {

			tx.executeSql('SELECT * FROM eventos ' + where + ' ORDER BY eventos_fecha_hora ASC' , [], function (tx, resultado) {
		    	
		    	var cant_eventos = resultado.rows.length;
		    	if(cant_eventos == 0){

		    		if($busqueda != '')
		    			$(holder).find('>div').html('<div class="sin_resultados"><div>La busqueda no ha arrojado ningun resultado en eventos.</div></div>');
		    		else 
		    			$(holder).find('>div').html('<div class="sin_resultados"><div>No hay eventos publicados por el momento.<br /><br />Te invitamos a que consultes la sección Descuentos.</div></div>');

		    		setTimeout(function(){
			        	$(holder).find('>div').css('height', 50)
			        },100)
		    	}else{

		    		setTimeout(function(){
			        	$(holder).find('>div').css('height', '')
			        },100);
			        
		    	}

		        for(var i=0; i<cant_eventos; i++){
					//for(var u=0; u<30; u++){
					var _ItemListaEvento = new ItemListaEvento(resultado.rows.item(i));
					$(holder).find('>div').append(_ItemListaEvento.main)
		            //}
		        }

				setTimeout(function(){  
					if(!scroll_set){
							scroll_set = true;
							is =  new iScroll('ListaEventos_holder', {hScrollbar: false, vScrollbar: false});
					}else{
							is.refresh()
					}
					is.scrollTo(0, 0, 0);
		   		}, 0)

				if(typeof($callback)!='undefined') $callback(cant_eventos);

		    })
		});

	}

}

