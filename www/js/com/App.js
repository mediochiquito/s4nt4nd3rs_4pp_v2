function App(){
	//

	var version = '2.0';
	this.main = document.createElement('div');
	this.main.id = 'app'
	this.ancho = 320;
	this.alto = 640
	this.secciones = null;
	this.lightbox = null;
	this.header = null;
	this.usuario = {
		uid:0,
		access_token:''
	};
	this.redirigiendo_una_push = false;
	this.cargo_mapa = false; 
	//this.server = 'http://192.168.0.2/s4nt4nd3rs_4pp_v2/server/';
	//this.server = 'http://192.168.235.140:8888/s4nt4nd3rs_4pp_v2/server/';
	//this.server = 'http://192.168.0.140:8888/s4nt4nd3rs_4pp_v2/server/';
	this.server = 'http://santander.crudo.com.uy/';
	//this.server = 'http://dev.santander.crudo.com.uy/';
	
	this.db = openDatabase('santanders_app_punta', '1.0', 'santanders_app_punta', 2000000);
	this._ManagePush;
	this._Facebook;
	var self = this;
	var tablas_creadas = 0;
	var xml_default_db;
	var primera_vez_que_instala = false;
	var array_tablas_a_crear;
	var sync_value = 0;
	var new_sync_value = 0;
	var btn_connect;
	var buscando_depto = true;
	this.depto_que_me_encuentro = 9;
	this.categorias_eventos = new Array("Deportes","Moda", "Música", "Culturales", "Gastronómico");
	this.meses = new Array('Ene', 'Feb', 'Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic');
	
	this.array_deptos = new Array('Artigas','Canelones','Cerro Largo','Colonia','Durazno','Flores','Florida',
								  'Lavalleja','Maldonado','Montevideo','Paysandú','Río Negro','Rivera','Rocha',
								  'Salto','San José','Soriano','Tacuarembó',
								  'Treinta y Tres');

	var array_deptos_google = new Array( 'Departamento de Artigas','Departamento de Canelones','Cerro Largo','Departamento de Colonia',
										  'Departamento de Durazno','Departamento de Flores','Departamento de Florida', 
										  'Departamento de Lavalleja','Departamento de Maldonado','Departamento de Montevideo',
										  'Paysandú','Río Negro','Departamento de Rivera','Departamento de Rocha',
										  'Departamento de Salto','San José','Departamento de Soriano','Tacuarembó',
										  'Departamento de Treinta y Tres');


	this.id_depto_en_que_estoy = 0;
	this.posicion_global = ''
	var watchid;
	this.plataforma = 'ios'
	this.cargando_evento_desde_push = false;

	// tipo_de_instalacion 
	// 1 = intalando de 0
	// 2 = reintalando de verion 1 a 2
	// 3 cambiando de version

	var tipo_de_instalacion = 0;

	this.initialize = function(){

		document.addEventListener('deviceready', deviceready, false);
		$(document).bind('touchmove', doPrevent);

	}

	this.get_xml_default_db = function (){

		return xml_default_db;

	}

	function doPrevent(event) {
		if(app.secciones.get_obj_seccion_actual().main.id == 'SeccionMapa' || app.secciones.get_obj_seccion_actual().main.id == 'SeccionMapaForm')
		event.preventDefault();
	}

	this.openlink = function($url){
	
		 window.open($url, '_system');

	}
	
	this.alerta = function($str){
		try{
    		navigator.notification.alert($str, function(){}, 'ALERTA')
		}catch(e){
    		alert($str)
    	}
	}
	
	this.is_phonegap =  function (){

		try {
		    if(device.platform == ''){}
		    return true;  
		} catch (e) {  
		    return false;   
		}

	}



	this.es_touch = function(){

		if($.browser.chrome) return false;  
		else return true;  
		 /*try { 
		    document.createEvent("TouchEvent");  
		    return true;  
		  } catch (e) {  
		    return false;  
		  }  */
	}

	this.hay_internet = function() {

     		try{
            	var networkState = navigator.connection.type;
	 
	            var states = {};
	            states[Connection.UNKNOWN]  = 'Unknown connection';
	            states[Connection.ETHERNET] = 'Ethernet connection';
	            states[Connection.WIFI]     = 'WiFi connection';
	            states[Connection.CELL_2G]  = 'Cell 2G connection';
	            states[Connection.CELL_3G]  = 'Cell 3G connection';
	            states[Connection.CELL_4G]  = 'Cell 4G connection';
	            states[Connection.CELL]     = 'Cell generic connection';
	            states[Connection.NONE]     = 'No network connection';

	            if(networkState == Connection.NONE ){
	 				return false;
	            }else{
	            	return true;
	            }

			}catch(e){


				return true
	        }
     
    }

	
	function deviceready(){

		if(app.is_phonegap()){
			

			if ((typeof cordova == 'undefined') && (typeof Cordova == 'undefined')) alert('Cordova variable does not exist. Check that you have included cordova.js correctly');
			if (typeof CDV == 'undefined') alert('CDV variable does not exist. Check that you have included cdv-plugin-fb-connect.js correctly');
			if (typeof FB == 'undefined') alert('FB variable does not exist. Check that you have included the Facebook JS SDK file.');
			  
            FB.Event.subscribe('auth.login', function(response) {
                               //alert('auth.login event');
                               });
            
            FB.Event.subscribe('auth.logout', function(response) {
                             //  alert('auth.logout event');
                               });
            
            FB.Event.subscribe('auth.sessionChange', function(response) {
                              // alert('auth.sessionChange event');
                               });
            
            FB.Event.subscribe('auth.statusChange', function(response) {
                             //  alert('auth.statusChange event');
                               });
            
	    	self._ManagePush = new ManagePush();

	    	self._Facebook = new Facebook()
	    	self._Facebook.init() 

		    if ( device.platform == 'android' || device.platform == 'Android' ) {
		    	//app.plataforma = 'android';
		    }
			else {
			   app.plataforma = 'ios';
			   StatusBar.hide();
			}

				
   		}
   		
   		 if(navigator.geolocation) {

		    		watchid = navigator.geolocation.watchPosition(
											onLocation, 
											errorLocation, 
											{
												timeout: 5000
											}
					);
			}

        self.ancho = window.innerWidth;
		self.alto = window.innerHeight;
		if(self.alto<480)self.alto = 480;

		$(self.main).css({width:self.ancho, height:self.alto})

		self.secciones = new Secciones()
		$(self.main).append(self.secciones.main)
		
		self.header =  new Header();
		$(self.main).append(self.header.main)

		/*var fpo_320 = document.createElement('div')
		fpo_320.id= 'fpo_320'
		$(self.main).append(fpo_320)*/
		

       	$(self.main).append('<div id="loading"><div id="txt_loading"></div><div class="spinner"><div class="bar1"></div><div class="bar2"></div><div class="bar3"></div><div class="bar4"></div><div class="bar5"></div><div class="bar6"></div><div class="bar7"></div><div class="bar8"></div><div class="bar9"></div><div class="bar10"></div><div class="bar11"></div><div class="bar12"></div></div></div>');
		
		$('body').append(self.main)
        
        app.db.transaction(function (tx) {
        	verificar_version_de_app(tx)
		}, app.db_errorGeneral);
      

	}


	function verificar_version_de_app($tx)
	{
		   $tx.executeSql("SELECT version FROM app" , [], function (tx, resultado) {
	    		

	    		if(String(resultado.rows.item(0).version) == String(version)){
	    			
	    			start()
	    		}else{

	    			tipo_de_instalacion = 3;
	    			crear_db($tx)	
	    		}

		   }, function ($tx){

			   		la_tala_fue_creada($tx, 'app', function($bool){
						
						if($bool) {
							tipo_de_instalacion = 2;
						} else {
							tipo_de_instalacion = 1;
						} 
					
						crear_db($tx);

					});	
			   			 
		   })
	}

	function crear_db($tx) {
		
		  $.ajax({
				type: "GET",
				url: "xml/default_db.xml",
				dataType: 'xml',
				async : false,
			}).success(function(xml) {

					xml_default_db = xml;
					tablas_creadas = 0;
				
					array_tablas_a_crear = new Array(crearTabla_Eventos,
													 crearTabla_Participaciones,
													 crearTabla_Ofertas, 
													 crearTabla_Locales,
													 crearTabla_App);

					for(var func in array_tablas_a_crear){
						array_tablas_a_crear[func]($tx);
					}
			});
	}

	function onLocation(position){
		
		self.posicion_global = position
		//navigator.geolocation.clearWatch(watchid);
	

		// geolocalizar
		if(buscando_depto){
				
				buscando_depto = false;
				
				$.ajax({
					type: "GET",
					url: "http://maps.googleapis.com/maps/api/geocode/json?latlng="+app.posicion_global.coords.latitude+","+app.posicion_global.coords.longitude+"&sensor=true&language=es",
					dataType: 'json'
					}).success(function($json) {
						
						for(var address_components in  $json.results[0].address_components){

							if($json.results[0].address_components[address_components].types[0] == 'administrative_area_level_1'){
								
								var depto_encontrado = ($.inArray($json.results[0].address_components[address_components].short_name, array_deptos_google)+1);
								

								if(depto_encontrado>0){

									self.depto_que_me_encuentro = depto_encontrado;
									$(document).trigger('CARGAR_LISTAS')
								
								}

							}
						}

						app.cargando(false);

						
					}).error(function(){

						app.cargando(false);

					});
			
		}
	
		
	}


	function errorLocation(error) {

		console.log('errorLocation error.code: ' + error.code + ', error.message: ' + error.message);

	}

	function comprobacion_total_tablas_creadas(e){

    	tablas_creadas++;
    	if(tablas_creadas == array_tablas_a_crear.length) start();

    }

	function start(){
		 
			if(app.secciones.get_obj_seccion_actual()==null)
				app.secciones.go(app.secciones.seccionhome);
	
		   	 app.db.transaction(function (tx) {

					tx.executeSql("SELECT sync_value,push FROM app" , [], function (tx, resultado) {
		    				
		    				sync_value = resultado.rows.item(0).sync_value

		    				if(app.is_phonegap()){
			    				if(String(resultado.rows.item(0).push) == '0' || String(resultado.rows.item(0).push) == '1' ) 
			    					self._ManagePush.registrar();
		    				}

		    				/*
		    						app.cargando_evento_desde_push = true;
									app.db.transaction(function (tx) {
									
											tx.executeSql("SELECT * FROM eventos WHERE eventos_id='22'  AND  eventos_estado=1" , [], 
													function (tx, resultado) {
													
														if(resultado.rows.length == 1)
										    				app.secciones.go(app.secciones.seccioneventosofertas, 300, {solapa:'un_evento', row: resultado.rows.item(0)});
										    		}
									    	);

									});	
							*/

		    				if(app.hay_internet()) verfificar_sync();
							else $(document).trigger('CARGAR_LISTAS');

							setTimeout(function() {
								try{
									
										navigator.splashscreen.hide();
									
								}catch(e){}
							}, 1000);

		    				

							


					})


			});

	}


	function verfificar_sync(){
    		
    		$.ajax({
				type: "GET",
				url: app.server + "sync_value.php",
				dataType: 'text',
				cache:false, 
				success: function($int) {
					new_sync_value = Number($int);
					
					if(new_sync_value>Number(sync_value)){
						
						app.cargando(true, 'Actualizando información...');
						$.ajax({

							type: "GET",
							url: app.server + "xml.sync.php",
							dataType: 'xml',
							cache: false, 
							data:{sync_value: sync_value},

							success: function($xml) {
								
								actualizar_db($xml);
							},
							error: function(){ 
								$(document).trigger('CARGAR_LISTAS');
								app.cargando(false);
							}
						});	
					}else{
						
						$(document).trigger('CARGAR_LISTAS');
					}
				},
				error: function() {
					$(document).trigger('CARGAR_LISTAS');
				}
			});

    }

	//C:\Users\Mateo\AppData\Local\Google\Chrome\User Data\Default\databases\http_localhost_0
	function actualizar_db($xml){
	
		var obj_eventos = $.parseJSON($($xml).find('sync_eventos>data').text());
		var obj_ofertas = $.parseJSON($($xml).find('sync_ofertas>data').text());
		var obj_locales = $.parseJSON($($xml).find('sync_locales>data').text());

		app.db.transaction(function (tx) {

			for(var item_evento in obj_eventos){
					tx.executeSql('INSERT OR IGNORE INTO "eventos" ("eventos_id","eventos_nombre","eventos_fecha_hora","eventos_categoria_id","eventos_lugar","eventos_desc","eventos_lat","eventos_lon","eventos_uid","eventos_tags","eventos_estado","eventos_departamentos_id","eventos_header_img","eventos_fecha_hora_creado") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)', 
													  [
													 
													  obj_eventos[item_evento].eventos_id, 
													  obj_eventos[item_evento].eventos_nombre, 
													  obj_eventos[item_evento].eventos_fecha_hora, 
													  obj_eventos[item_evento].eventos_categoria_id, 
													  obj_eventos[item_evento].eventos_lugar, 
													  obj_eventos[item_evento].eventos_desc, 
													  obj_eventos[item_evento].eventos_lat, 
													  obj_eventos[item_evento].eventos_lon, 
													  obj_eventos[item_evento].eventos_uid, 
													  obj_eventos[item_evento].eventos_tags, 
													  obj_eventos[item_evento].eventos_estado, 
													  obj_eventos[item_evento].eventos_departamentos_id, 
													  obj_eventos[item_evento].eventos_header_img, 
													  obj_eventos[item_evento].eventos_fecha_hora_creado

													  ]);
			}


			for(var item_ofeta in obj_ofertas){
						tx.executeSql('INSERT OR IGNORE INTO "ofertas" ("ofertas_id","ofertas_nombre","ofertas_tags","ofertas_ofertas_tipo_id","ofertas_estado") VALUES (?,?,?,?,?)', 
													  [
													  obj_ofertas[item_ofeta].ofertas_id, 
													  obj_ofertas[item_ofeta].ofertas_nombre, 
													  obj_ofertas[item_ofeta].ofertas_tags, 
													  obj_ofertas[item_ofeta].ofertas_ofertas_tipo_id, 
													  obj_ofertas[item_ofeta].ofertas_estado
													  ]);
			}




			for(var item_local in obj_locales){
				tx.executeSql('INSERT OR IGNORE INTO "locales" ("locales_id","locales_ofertas_id","locales_estado","locales_tel","locales_dir","locales_descuento", "locales_cutoas", "locales_dias", "locales_desc", "locales_lat", "locales_lon", "locales_departamentos_id", "locales_localidad") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)', 
														  [
														  obj_locales[item_local].locales_id, 
														  obj_locales[item_local].locales_ofertas_id, 
														  obj_locales[item_local].locales_estado, 
														  obj_locales[item_local].locales_tel, 
														  obj_locales[item_local].locales_dir,
														  obj_locales[item_local].locales_descuento,
														  obj_locales[item_local].locales_cutoas, 
														  obj_locales[item_local].locales_dias, 
														  obj_locales[item_local].locales_desc, 
														  obj_locales[item_local].locales_lat, 
														  obj_locales[item_local].locales_lon,
														  obj_locales[item_local].locales_departamentos_id,
														  obj_locales[item_local].locales_localidad
														  ]);
			}




			
		},  app.db_errorGeneral, function(){

			//-----------------------------------------------
					// LOS UPDATES
					app.db.transaction(function ($tx) {
						



							for(var item_evento in obj_eventos){
									$tx.executeSql('UPDATE "eventos" SET "eventos_nombre"=?,"eventos_fecha_hora"=?,"eventos_categoria_id"=?,"eventos_lugar"=?,"eventos_desc"=?,"eventos_lat"=?,"eventos_lon"=?,"eventos_uid"=?,"eventos_tags"=?,"eventos_estado"=?,"eventos_departamentos_id"=?,"eventos_header_img"=?, "eventos_fecha_hora_creado"=? WHERE "eventos_id"=?', 
																		  [
																		
																		  obj_eventos[item_evento].eventos_nombre, 
																		  obj_eventos[item_evento].eventos_fecha_hora, 
																		  obj_eventos[item_evento].eventos_categoria_id, 
																		  obj_eventos[item_evento].eventos_lugar, 
																		  obj_eventos[item_evento].eventos_desc, 
																		  obj_eventos[item_evento].eventos_lat, 
																		  obj_eventos[item_evento].eventos_lon, 
																		  obj_eventos[item_evento].eventos_uid, 
																		  obj_eventos[item_evento].eventos_tags, 
																		  obj_eventos[item_evento].eventos_estado, 
																		  obj_eventos[item_evento].eventos_departamentos_id, 
																		  obj_eventos[item_evento].eventos_header_img, 
																		  obj_eventos[item_evento].eventos_fecha_hora_creado,
																		  obj_eventos[item_evento].eventos_id
																		  ]);
							}

							// a eliminar
							var array_del = $($xml).find('sync_eventos>del').text().split(',')
							var where='';
							for(var del_id in array_del){
								if(where!='') where += ' OR ';
								where += ' eventos_id=' + array_del[del_id] ;
							}
							if($($xml).find('sync_eventos>del').text() !=''){
								$tx.executeSql('DELETE FROM "eventos" WHERE ' + where);
							}
						

							// --------------------------------------------------------------------------

							for(var item_oferta in obj_ofertas){

									$tx.executeSql('UPDATE "ofertas" SET  "ofertas_nombre"=?,"ofertas_tags"=?,"ofertas_ofertas_tipo_id"=?,"ofertas_estado"=? WHERE "ofertas_id"=?', 
													  [
													  obj_ofertas[item_oferta].ofertas_nombre, 
													  obj_ofertas[item_oferta].ofertas_tags, 
													  obj_ofertas[item_oferta].ofertas_ofertas_tipo_id,
													  obj_ofertas[item_oferta].ofertas_estado,
													  obj_ofertas[item_oferta].ofertas_id
													  ]);
							}

							// a eliminar
							var array_del = $($xml).find('sync_ofertas>del').text().split(',')
							var where='';
							for(var del_id in array_del){
								if(where!='') where += ' OR ';
								where += ' ofertas_id=' + array_del[del_id] ;
							}
							if($($xml).find('sync_ofertas>del').text() !=''){
								$tx.executeSql('DELETE FROM "ofertas" WHERE ' + where);
							}



							// --------------------------------------------------------------------------

							for(var item_local in obj_locales){

									$tx.executeSql('UPDATE "locales" SET "locales_ofertas_id"=?,"locales_estado"=?,"locales_tel"=?,"locales_dir"=?,"locales_descuento"=?, "locales_cutoas"=?, "locales_dias"=?, "locales_desc"=?, "locales_lat"=?, "locales_lon"=?, "locales_departamentos_id"=?, "locales_localidad"=? WHERE "locales_id"=?', 
														  [
														  
														  obj_locales[item_local].locales_ofertas_id, 
														  obj_locales[item_local].locales_estado, 
														  obj_locales[item_local].locales_tel, 
														  obj_locales[item_local].locales_dir,
														  obj_locales[item_local].locales_descuento,
														  obj_locales[item_local].locales_cutoas, 
														  obj_locales[item_local].locales_dias, 
														  obj_locales[item_local].locales_desc, 
														  obj_locales[item_local].locales_lat, 
														  obj_locales[item_local].locales_lon,
														  obj_locales[item_local].locales_departamentos_id,
														  obj_locales[item_local].locales_localidad,
														  obj_locales[item_local].locales_id
														  ]);
							}

							// a eliminar
							var array_del = $($xml).find('sync_locales>del').text().split(',')
							var where='';
							for(var del_id in array_del){
								if(where!='') where += ' OR ';
								where += ' locales_id=' + array_del[del_id] ;
							}
							if($($xml).find('sync_locales>del').text() !=''){
								$tx.executeSql('DELETE FROM "locales" WHERE ' + where);
							}

							// TERMINO !!!

							termino_la_syncronizacion($tx)


					},  app.db_errorGeneral);


			//................................................

		});

		
		
		
	}

	function termino_la_syncronizacion($tx){

		$tx.executeSql('UPDATE app SET sync_value=?', [new_sync_value]);
		$(document).trigger('CARGAR_LISTAS');
		
		app.cargando(false);
	}
		

    function crearTabla_App($tx){

    	
			la_tala_fue_creada($tx, 'app', function($bool){
				
				$tx.executeSql('CREATE TABLE IF NOT EXISTS app ("sync_value" INTEGER, "push" INTEGER, "version" VARCHAR)', [], comprobacion_total_tablas_creadas);

				if(tipo_de_instalacion == 2){

					$tx.executeSql('ALTER TABLE "app" ADD COLUMN "version" VARCHAR');

				}

				if(!$bool) {

					$tx.executeSql('INSERT INTO app (sync_value, push, version) VALUES (?,?,?)', [0,0,version]);

				} else {

					$tx.executeSql('UPDATE app SET version=?', [version]);
					
				} 
			});	
    }

    
    function crearTabla_Eventos($tx){


    		if(tipo_de_instalacion==2) $tx.executeSql('DROP TABLE IF EXISTS eventos');

			$tx.executeSql('CREATE TABLE IF NOT EXISTS eventos ("eventos_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , ' +
						  '"eventos_nombre" VARCHAR, ' +
						  '"eventos_fecha_hora" DATETIME, ' +
						  '"eventos_categoria_id" INTEGER, ' +
						  '"eventos_lugar" VARCHAR, ' +
						  '"eventos_desc" VARCHAR, ' +
						  '"eventos_lat" VARCHAR, ' +
						  '"eventos_lon" VARCHAR, ' +
						  '"eventos_uid" VARCHAR, ' +
						  '"eventos_tags" VARCHAR, ' +
						  '"eventos_estado" INTEGER, ' +
						  '"eventos_departamentos_id" INTEGER, ' +
						  '"eventos_header_img" VARCHAR, ' +
						  '"eventos_fecha_hora_creado" DATETIME)', [], comprobacion_total_tablas_creadas);



			var obj = $.parseJSON($(xml_default_db).find('eventos').text())
			
			for(var item_evento in obj){


				$tx.executeSql('INSERT OR IGNORE INTO "eventos" ("eventos_id","eventos_nombre","eventos_fecha_hora","eventos_categoria_id","eventos_lugar","eventos_desc","eventos_lat","eventos_lon","eventos_uid","eventos_tags","eventos_estado","eventos_departamentos_id","eventos_header_img","eventos_fecha_hora_creado") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)', 
													  [
													 
													  obj[item_evento].eventos_id, 
													  obj[item_evento].eventos_nombre, 
													  obj[item_evento].eventos_fecha_hora, 
													  obj[item_evento].eventos_categoria_id, 
													  obj[item_evento].eventos_lugar, 
													  obj[item_evento].eventos_desc, 
													  obj[item_evento].eventos_lat, 
													  obj[item_evento].eventos_lon, 
													  obj[item_evento].eventos_uid, 
													  obj[item_evento].eventos_tags, 
													  obj[item_evento].eventos_estado, 
													  obj[item_evento].eventos_departamentos_id, 
													  obj[item_evento].eventos_header_img, 
													  obj[item_evento].eventos_fecha_hora_creado


													  ]);
			
					


			}
    }


    function crearTabla_Ofertas($tx){

			if(tipo_de_instalacion==2) $tx.executeSql('DROP TABLE IF EXISTS ofertas');

			$tx.executeSql('CREATE TABLE IF NOT EXISTS ofertas ("ofertas_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , ' +
						  '"ofertas_nombre" VARCHAR, ' +
						  '"ofertas_tags" VARCHAR, ' +
						  '"ofertas_ofertas_tipo_id" INTEGER, ' +
						  '"ofertas_estado" INTEGER)', [], comprobacion_total_tablas_creadas);


			var obj = $.parseJSON($(xml_default_db).find('ofertas').text())
		
			for(var item_ofeta in obj){
					
					$tx.executeSql('INSERT OR IGNORE INTO "ofertas" ("ofertas_id","ofertas_nombre","ofertas_tags","ofertas_ofertas_tipo_id","ofertas_estado") VALUES (?,?,?,?,?)', 
													  [
													  obj[item_ofeta].ofertas_id, 
													  obj[item_ofeta].ofertas_nombre, 
													  obj[item_ofeta].ofertas_tags, 
													  obj[item_ofeta].ofertas_ofertas_tipo_id, 
													  obj[item_ofeta].ofertas_estado
													  ]);

			}

    }

    function crearTabla_Locales($tx){

		
			$tx.executeSql('CREATE TABLE IF NOT EXISTS locales ( ' +

						  '"locales_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , ' +
						  '"locales_ofertas_id" VARCHAR, ' +
						  '"locales_estado" INTEGER, ' +
						  '"locales_tel" VARCHAR, ' +
						  '"locales_dir" VARCHAR, ' +
						  '"locales_descuento" VARCHAR, ' +
						  '"locales_cutoas" VARCHAR, ' +
						  '"locales_dias" VARCHAR, ' +
						  '"locales_desc" TEXT, ' +
						  '"locales_lat" VARCHAR, ' +
						  '"locales_lon" VARCHAR, ' +
						  '"locales_departamentos_id"  INTEGER, ' + 
						  '"locales_localidad" VARCHAR )', 


					[], comprobacion_total_tablas_creadas);


			var obj = $.parseJSON($(xml_default_db).find('locales').text())
		
			for(var item_local in obj){
					
					$tx.executeSql('INSERT OR IGNORE INTO "locales" ("locales_id","locales_ofertas_id","locales_estado","locales_tel","locales_dir","locales_descuento", "locales_cutoas", "locales_dias", "locales_desc", "locales_lat", "locales_lon", "locales_departamentos_id", "locales_localidad") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)', 
													  [
													  obj[item_local].locales_id, 
													  obj[item_local].locales_ofertas_id, 
													  obj[item_local].locales_estado, 
													  obj[item_local].locales_tel, 
													  obj[item_local].locales_dir,
													  obj[item_local].locales_descuento,
													  obj[item_local].locales_cutoas, 
													  obj[item_local].locales_dias, 
													  obj[item_local].locales_desc, 
													  obj[item_local].locales_lat, 
													  obj[item_local].locales_lon,
													  obj[item_local].locales_departamentos_id,
													  obj[item_local].locales_localidad
													  ]);

			}

    }


    function crearTabla_Participaciones($tx){
		

			$tx.executeSql('CREATE  TABLE  IF NOT EXISTS "participaciones" ("participaciones_id" INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , "participaciones_id_evento" VARCHAR, "participaciones_uid" VARCHAR) ', [], comprobacion_total_tablas_creadas);

		
    } 
 
    function la_tala_fue_creada($tx, $table_name, $callback){
    	$tx.executeSql("SELECT name FROM sqlite_master WHERE name='"+$table_name+"'" , [],	
		function (tx, resultado) {
					if(resultado.rows.length==0) $callback(false);
					else $callback(true);
		},  app.db_errorGeneral);
    }
    

    this.db_errorGeneral = function(tx, err) {
		
		try{
      		app.alerta("Error processing SQL: " + err.message);
		}catch(e){
			app.alerta("Error processing SQL: " + tx.message);

		}

    }

   
	this.cargando = function ($bool, $txt){
		
		if($bool){
			$('#txt_loading').html($txt);
			$('#loading').show();
		}else{
			$('#loading').hide();
		}

	}

}