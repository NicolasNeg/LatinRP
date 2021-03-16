#include <a_samp>
#include <streamer>
#include <a_mysql>
#include <sscanf2>
#include <zcmd>
#include <dudb>
#include <foreach>
#include <a_zones>
#include <easyDialog>
#include <a_actor>
/* #include <progress2> */
#define ZMSG_MAX_CHAT_LENGTH            96
#define ZMSG_MAX_PLAYER_CHAT_LENGTH     48
#include <zmessage>

/* Configuracion Server*/
#define SERVER_VERSION  "[0.5]"
#define SERVER_NAME     "LatinRP"SERVER_VERSION""
#define SERVER_HOSTNAME "LatinRP"SERVER_VERSION"(Spanish)"
#define SERVER_GAMEMODE "RolePlay RP "
#define SERVER_LANGUAGE "Español/Spanish"
#define SERVER_WEBSITE  "www.latinrp/foro.com"
/* Coin */
#define SERVER_COIN     "LatinCoins (LC)"

/* Defines */
#define funcion%0(%1) forward%0(%1);public%0(%1)
#if defined MAX_PLAYERS
    #undef MAX_PLAYERS
    #define MAX_PLAYERS 50
#endif

//-------------------------------------------------------------------Programas--------------------------------------------------------------------------------------------//
#pragma dynamic 15000
#pragma unused ret_memcpy
/*
-----------------------------------------------------------
----------------------Colores------------------------------
-----------------------------------------------------------
*/
#define Rojo                            ""
#define COLOR_ROJO                      0xFF0000FF
#define COLOR_NARANJA                   0xFF9600FF
#define COLOR_AMARILLO                  0xffd436FF
#define COLOR_DORADO                    0x966400FF
#define COLOR_AZUL                      0x0000FFFF
#define COLOR_CELESTE                   0x0096FFFF
#define VERDECLARO                      0x00FF00FF
#define CELESTE                         "{0096FF}"
#define Aqua                            "{009696}"
#define COLOR_VERDE_OSCURO              0x00C800FF
#define COLOR_VERDE_CLARO               0x00FF00FF
#define COLOR_GREY                      0xAFAFAFAA
#define COLOR_GREEN                     0x33AA33AA
#define COLOR_RED                       0xAA3333AA
#define C_Blanco                        0xFFFFFFFF
#define COLOR_YELLOW                    0xFFFF00AA
#define COLOR_WHITE                     0xFFFFFFFF
#define COLOR_LIGHTGREEN                0x38FF06FF
#define COLOR_LIGHTBLUE                 0x91C8FF
#define COLOR_GREY                      0xAFAFAFAA
#define GREEN                           0x21DD00FF
#define RED                             0xE60000FF
#define ADMIN_RED                       0xFB0000FF
#define YELLOW                          0xFFFF00FF
#define ORANGE                          0xF97804FF
#define LIGHTRED                        0xFF8080FF
#define LIGHTBLUE                       0x00C2ECFF
#define PURPLE                          0xB360FDFF
#define BLUE                            0x1229FAFF
#define LIGHTGREEN                      0x38FF06FF
#define DARKPINK                        0xE100E1FF
#define NICESKY                         0x99FFFFAA
#define GRAY                            0xCECECEFF
#define COLOR_GREEN                     0x33AA33AA
#define COLOR_RED                       0xAA3333AA
#define COLOR_YELLOW                    0xFFFF00AA
#define COLOR_BLUE                      0x0000BBAA
#define COLOR_ORANGE                    0xFF9900AA
#define COLOR_RED                       0xAA3333AA
#define COLOR_LIME                      0x10F441AA
#define COLOR_MAGENTA                   0xFF00FFFF
#define COLOR_NAVY                      0x000080AA
#define COLOR_AQUA                      0xF0F8FFAA
#define COLOR_CRIMSON                   0xDC143CAA
#define COLOR_FLBLUE                    0x6495EDAA
#define COLOR_BISQUE                    0xFFE4C4AA
#define COLOR_BLACK                     0x000000AA
#define COLOR_CHARTREUSE                0x7FFF00AA
#define COLOR_BROWN                     0XA52A2AAA
#define COLOR_CORAL                     0xFF7F50AA
#define COLOR_GOLD                      0xB8860BAA
#define COLOR_GREENYELLOW               0xADFF2FAA
#define COLOR_INDIGO                    0x4B00B0AA
#define COLOR_IVORY                     0xFFFF82AA
#define COLOR_LAWNGREEN                 0x7CFC00AA
#define COLOR_SEAGREEN                  0x20B2AAAA
#define COLOR_LIMEGREEN                 0x32CD32AA //<--- Dark lime
#define COLOR_MIDNIGHTBLUE              0X191970AA
#define COLOR_MAROON                    0x800000AA
#define COLOR_OLIVE                     0x808000AA
#define COLOR_ORANGERED                 0xFF4500AA
#define COLOR_SPRINGGREEN               0x00FF7FAA
#define AMARELO                         0xF9F900FF
#define VERMELHO                        0xFF0000FF
/*
-----------------------------------------------------------
-------------------------Maxs------------------------------
-----------------------------------------------------------
*/
#define MAX_JOBS    20
#define MAX_HOUSES  1000
#define MAXGRAFFS 80
/*
-----------------------------------------------------------
---------------------Trabajo Fedex-------------------------
-----------------------------------------------------------
*/
#define CPFEDEXSALIDA           2454.7229, -2628.6526, 13.3640      //ZONA DE CARGA
#define CPFEDEXRECORRIDOuno     -2246.6909, 132.1866, 35.3203     //RECORRIDO VIDEOJUEGOS SF
#define CPFEDEXRECORRIDOdos     -2459.9109, 787.1813, 35.1719     //RECORRIDO DE SUPERMERCADO SF
#define CPFEDEXRECORRIDOtres    1124.0671, -1327.9281, 13.3307   //RECORRIDO DE MEDICAMENTOS LS
#define CPFEDEXRECORRIDOcuatro  1407.5940, -1790.3971, 13.5469 //RECORRIDO DE PAPELES IMPORTANTES LS
#define CPFEDEXRECORRIDOcinco   2216.3035, 2006.6641, 10.8203    //RECORRIDO VERDURAS CONGELADAS LV
#define CPFEDEXRECORRIDOseis    1903.5228, 963.5892, 10.8203     //RECORRIDO INVENTARIO CASINOS LV
#define CPFEDEXENTREGA          2507.6841, -2628.2993, 12.6404
#define CPPEDIRTRABAJO          2509.668212,-2638.108886, 13.796875 //TOMAR JOB
/*
-----------------------------------------------------------
-------------------Trabajo Armero--------------------------
-----------------------------------------------------------
*/
#define CPENTRADAFABRICA        123.247055,-306.153808,1.578125     //FABRICA//
#define CPSALIDAFABRICA         316.227111,-170.251068,999.593750  // FABRICA//
#define CPCREARARMAS            312.131927,-166.139541,999.601013  //crear armas//
#define CPTRABAJOARMERO         83.575508,-187.478332,1.541102     //pedir trabajo//
/*
-----------------------------------------------------------
----------------Trabajo Transportista----------------------
-----------------------------------------------------------
*/
#define CPPEDIRTRABAJOTRANSPORTISTA 816.460266,856.493286,12.789062 // Pedir trabajo//
#define CPTOMARCARGA                572.3749, 877.6084, -42.9896 //Tomar carga 1//
#define CPTOMARCARGA2               563.9131, 876.9292, -43.5862 //Tomar carga 2 lugar//
#define CPTRANSPORTISTARECORRIDO1   -1708.152832,1204.455810,25.121044 // Primer recorrido//
#define CPTRANSPORTISTARECORRIDO2   745.199523,-1342.334106,13.523183  // Segundo Recorrido//
#define CPTRANSPORTISTARECORRIDO3   2733.242431,-1844.739501,9.776006  //Tercer recorrido//
/*
----------------------------------------------------
-----------------------Define-----------------------
----------------------------------------------------
*/
#define EntradaFBI          1219.218750,-1811.921508,16.593750
#define ARRESTAR            1568.671142,-1692.713134,5.890625
#define SCM                 SendClientMessage
#define Mensaje             SendClientMessage
#define TP                  SetPlayerPos
#define TomarRopaFbi        196.388275,171.679870,1003.023437
#define BarreraLSPDAbierta  1544.65259, -1623.92627, 12.86399
#define BarreraLSPDCerrada  1544.65259, -1623.92627, 12.86400
#define EstaEn              IsPlayerInRangeOfPoint
#define DarVida             SetPlayerHealth
#define COLOR_VERDECLARO    0xC87D3F97

#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) \
    (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
/*Parametros de MySQL y la coneccion a la DB */
#define MySQL_HOST      "localhost"
#define MySQL_USER      "root"
#define MySQL_PASSWORD  ""
#define MySQL_DATABASE  "latin_rp"
/*Si la GM carga imprime esto en la consola...*/
    
main()
{
    print("\n-==================== *** ====================-");
    print("\nGM:LatinRP \n \
          Creada desde 0 por:Negrura. \n \
          Modificada y mejorada por:Negrura");
    print("\n-==================== *** ====================-\n");
}
/*-----------------------Enumeradores-----------------------*/
/* Dialogos */
enum 
{
    DIALOG_NONE = 0,
    DIALOGO_ARMAS1,
    DIALOGO_ARMAS2,            
    DIALOGO_GPS1,              
    DIALOGO_GPSTIENDAS,        
    DIALOGO_GPSTRABAJOS,       
    DIALOGO_GPSLUGARESURBANOS, 
    DIALOGO_GPSLUGARESPUBLICOS,
    DIALOGO_REGLAS,            
    DIALOGO_COMPRAS,           
    DIALOGO_POLICIA,           
    DIALOGO_MECANICOS,         
    DIALOGO_AYUDA,             
    DIALOGO_FEDEX,             
    DIALOGO_AYUDATRABAJOS,     
    DIALOGO_AYUDAFEDEX,        
    RECORRIDOSFEDEX,           
    DIALOGO_ARMERO,            
    DIALOGO_TP,                
    DIALOGO_ABATIDO,           
    DIALOGO_COMANDOSSTAFF,             
    DIALOGO_V1,                
    DIALOGO_V2,                
    DIALOGO_GPSCONCES,         
    DIALOGO_JUNTAS,            
    DIALOG_REGISTRO,           
    DIALOG_GENERO,             
    DIALOG_EDAD,               
    DIALOG_INGRESO,            
    DIALOG_D1,                 
    DIALOG_D2,                 
    DIALOG_D3,                 
    DIALOG_D4,                 
    DIALOGO_AYUDATRANSPORTISTA,
    RECORRIDOSTRANSPORTISTA,   
    DIALOG_ESTADO,             
    DIALOG_MUSIC,              
    DIALOG_MUERTE,             
    DialogoControl,            
    DADMINS,                   
    AYUDAVEHICULOS,            
    AYUDACOMANDOS,             
    DIALOG_EST,                
    DIALOG_CREDITOS,           
    DIALOG_ROPALSPD,           
    DIALOG_COMPRARBOTIS,       
    DIALOG_ACENTOS,            
    DIALOG_HPMENU,             
    DIALOG_CREATEDNI,          
    DIALOG_CREATEDNI2,         
    DIALOG_CREATEDNI3,         
    DIALOG_CAMBIARCONTRA,                      
    AYUDAINFORMACION,          
    DIALOG_COMPRARMEDICAMENTOS,
    ESTADO_COLOR,              
    DIALOG_UPDATES,            
    DIALOG_UPDATES1,           
    DIALOG_UPDATES2,           
    DIALOG_CONFIG,             
    DIALOG_TIENDA_VIP,         
    DIALOG_BANCO,              
    DIALOG_BANCODEPOSITAR,     
    DIALOG_BANCORETIRAR,       
    BENEFICIOS_VIP,
    DialogCreatingGang,
    DialogModificarRangos,
    DialogBandaInfo,
    DialogMembersGang,
    DIALOG_CM,
    DIALOG_EMISORAS,
};
/*Datos del Jugador (playerid)*/
enum PlayerData
{
    mID,
    pContra[129],
    pAdmin,
    pFbi,
    Float:pX,
    Float:pY,
    Float:pZ,
    Float:pVida,
    Float:pChaleco,
    pGps,
    pPolicia,
    IP[16],
    pVip,
    pJob, // 1 fedex, 2 transportista, 4 armero
    pMecanico,
    pJaileado,
    pMuteadoDudas,
    pMuteadoAnuncios,
    pGenero,
    pEdad,
    pRopa,
    Muertes,
    Asesinatos,
    pDinero,
    pInt,
    pVW,
    pNivel,
    pAbatido,
    pMedico,
    pMuerto,
    pCorreo,
    pBotis,
    pAcento,
    pFecha[128],
    pAntecedentes,
    pLugar[128],
    pDNI,
    pVehicleID,
    pVid,
    pMedicamentos,
    pMarihuana,
    LatinCoins,
    pBanco,
    pBanda,
    pMafioso,
    pPandillero,
    FakeSkin,
    bool:SelectingSkin,
    bool:pLogged,
    Text3D:pTextState,
    bool:pUsingText,
    pCongelado,
    ChangesName,
    TiempoJail,
    TimeCarcel,
    pCarcel,
    pBaneado,
    Ultima_conexion,
    fecha_creacion,
    RazonCargos,
    pCargos,

};
/* Datos de los vehiculos */
enum VehicleInfo
{
    cID,
    cOwner,
    cModelo,
    Color1,
    Color2,
    Float:cPosX,
    Float:cPosY,
    Float:cPosZ,
    Float:cPosA,
    Float:Gasolina,
    GasTimer,
    cPrecio
};
/* Datos de las casas del sv */
enum HouseData
{
    hid,
    oID,
    owner[24],
    bool:Buyed,
    Float:xex,
    Float:yex,
    Float:zex,
    Float:xin,
    Float:yin,
    Float:zin,
    interior,
    virtualworld,
    pid,
    bool:Locked,
    hPrice
};
/* Datos de las bandas */
enum DataWDeath 
{
    Warma,
    Wid,
    Wammo,
    Float:Wx,
    Float:Wy,
    Float:Wz,
    Float:Wa,
    bool:WPuedeTomarse,
    virwor,
    idobject
};
/*-----------------------News-----------------------*/
new HouseInfo[MAX_HOUSES][HouseData];
new PlayerInfo[MAX_PLAYERS][PlayerData];
new CarsInfo[MAX_VEHICLES][VehicleInfo];
new WeaponSystem[MAX_PLAYERS][DataWDeath];
/* cargos sistem */
new ColocoCargos[MAX_PLAYERS];
new QuitCargos[MAX_PLAYERS];
/* Cadaveres system */
new Actors[MAX_PLAYERS], // Actor's
Float: Deadx[MAX_PLAYERS], // coor X
Float: Deady[MAX_PLAYERS], // coor Y
Float: Deadz[MAX_PLAYERS], // coor Z
Float: Deadr[MAX_PLAYERS], // coor R
Deadint[MAX_PLAYERS], // Interior
Deadvw[MAX_PLAYERS], // Dimensión
Deadskin[MAX_PLAYERS];
/* texts weapon system */
new Text3D:rifletext;
new Text3D:recortadatext;
new Text3D:deserttext;
new Text3D:knifetext;
new Text3D:batetext;
new Text3D:pistoltext;
new Text3D:pistolsilencedtext;
new Text3D:shotguntext;
new Text3D:edctext;
new Text3D:uzitext;
new Text3D:mp5text;
new Text3D:aktext;
new Text3D:m4text;
new Text3D:tectext;
new Text3D:snipertext;
/* timers cortos */
new tsanuncio[MAX_PLAYERS];
new tstwit[MAX_PLAYERS];
new tsduda[MAX_PLAYERS];
new tsdeepweb[MAX_PLAYERS];
new tsrobotienda1[MAX_PLAYERS];
new tsmedicamentoconsumido[MAX_PLAYERS];
new tsmarihuanaconsumida[MAX_PLAYERS];
new VidaSubiendo[MAX_PLAYERS];
new LowLife[MAX_PLAYERS];
/* anonimatum */
new anonimodb[MAX_PLAYERS];
new twitanonimo[MAX_PLAYERS];
/* emisoras */
new emisora[MAX_VEHICLES];
new bool:emisoraon[MAX_VEHICLES];
/* Bools */
new bool:EsAdmin[MAX_PLAYERS];
new Text:TextDrawError;
new Text:latinrp;
new Text:coneccion;
new Text:CajaIzquierda;
new Text:BotonIzquierda;
new Text:CajaSelect;
new Text:BotonSelect;
new Text:CajaDerecha;
new Text:BotonDerecha;
new Text:TdCasa[5];
new Text3D:estado[MAX_PLAYERS];
new bool:usandoescudo[MAX_PLAYERS];
new bool:WantSave[MAX_PLAYERS];
/*DNI*/
new PlayerText:Box[MAX_PLAYERS];
new PlayerText:Nombre_[MAX_PLAYERS];
new PlayerText:Skin[MAX_PLAYERS];
new PlayerText:Age[MAX_PLAYERS];
new PlayerText:Close[MAX_PLAYERS];
new PlayerText:Nacimiento[MAX_PLAYERS];
new PlayerText:City[MAX_PLAYERS];
/*Primera persona*/
new camaraon[MAX_PLAYERS];
new FPS[MAX_PLAYERS];
/*Spawn-TextDraw*/
new Text:Spawn0;
new Text:Spawn1;
/*-----------------------*/
new MySQL:MySQL;
new TextLSPD;
new TextFbi;
new TextAD;
new BallaLSPD;
new PortonLSPD;
new PuertaGarage;
new PortonMafia;
new PortonCasa;
/*GangZones*/
/* insertar gangzones */
/* Timers */
new CuantoQuedaCana[MAX_PLAYERS];
new CuantoQuedaJail[MAX_PLAYERS];
new TimeJailQuitVar[MAX_PLAYERS];
new timerAbatido[MAX_PLAYERS];
new timermuerte[MAX_PLAYERS];
new timerporhp[MAX_PLAYERS];
new timeresposom[MAX_PLAYERS];
new timeresposo[MAX_PLAYERS];
new timeruplife[MAX_PLAYERS];
new timerEnRobo[MAX_PLAYERS];
new timerdead[MAX_PLAYERS];
/* Parametros Vehiculos */
new engine,
    lights,
    alarm,
    doors,
    bonnet,
    boot,
    objective,
    Motor[MAX_VEHICLES],
    Capo[MAX_VEHICLES],
    Luces[MAX_VEHICLES],
    Baul[MAX_VEHICLES];
/* Spectear */
new pSpectatingPlayer[MAX_PLAYERS],
Float:pSpectatingPos[MAX_PLAYERS][4],
pSpectatingInterior[MAX_PLAYERS],
pSpectatingVirtualWorld[MAX_PLAYERS];
new bool:sSpectating[MAX_PLAYERS] = false,
bool:sBeingSpectated[MAX_PLAYERS] = false;
/* Graffitis */
new bool:Grafo0;
new bool:Grafo1;
new bool:Grafo2;
new bool:Grafo3;
new bool:Grafo4;
new bool:Grafo5;
new bool:Grafo6;
new bool:Grafo7;
new bool:Grafo8;
new bool:Grafo9;
new bool:Grafo10;
new bool:Grafo11;
new bool:Grafo12;
new bool:Grafo13;
new bool:Grafo14;
new bool:Grafo15;
new bool:Grafo16;
new bool:Grafo17;
new bool:Grafo18;
new bool:Grafo19;
new bool:GrafosIniciados = false;
new Graffos[21];
new Text:PintandoGraff[3];
new Text:BandaGanadoraGrafo[5];
new Text:AvisoGrafos1[5];
new Text:ZonaGrafos[5];
new Text:EnMarchaGrafo;
new HideTextGra;
new PintarDisputa[MAX_PLAYERS];
new GraffUp[MAX_PLAYERS];
new LimiteGraffiti;

/*----------------------Forward-----------------------*/
forward CargaCamion(playerid);
forward Unjail(playerid);
forward Desencarcelado(playerid);
forward TiempoEsposo(playerid);
forward Conteo();
forward VerificarUsuario(playerid);
forward CrearCuenta(playerid);
forward IngresoJugador(playerid);
forward IngresarJugador(playerid);
forward GuardarJugador(playerid);
forward Chequear(playerid);
forward CerrarPuerta(playerid);
forward CerrarPorton(playerid);
forward CerrarPuertaGarage(playerid);
forward CerrarPuertaMafia(playerid);
forward GuardarMafias(playerid);
forward CerrarPortonCasa(playerid);
forward encenderauto(playerid);
forward ActualizarVelocimetro();
forward SubirVida(playerid, Float:health);
forward Camara();
forward CommandError(playerid);
forward AtendidoPorHP(playerid);
forward robandotienda(playerid);
forward LoadPlayerVehicles(playerid);
forward LoadVehicles(playerid);
forward ConsumioMedicamento(playerid);
forward descongelar(playerid);
forward SavePlayerVehicles(playerid);
forward BorrarConquista(conquistaid);
forward CreateVehicleMySQL(playerid, model, color1, color2, Float:x, Float:y, Float:z, Float:a);
forward CreateVehicleHandled(playerid);
forward LoadHousesMySQL();
forward LoadHouses();
forward CreateHouse(id, vw, int, bool:buyed, bool:locked, price, howner[24], Float:ixex, Float:iyex, Float:izex, Float:ixin, Float:iyin, Float:izin);
forward SetPlayerInInteriorOrExterior(playerid);
forward UnFreezePlayer(playerid);
forward TerriConq();
forward CreateHouseHandled(vw, int, bool:buyed, bool:locked, price, howner[24], Float:ixex, Float:iyex, Float:izex, Float:ixin, Float:iyin, Float:izin);
forward SaveHouses();
forward muriendo(playerid);
forward abatido(playerid);
forward CancelarGraff(playerid);
forward ActualizarGraff(playerid);
forward BajarGasolina(vehicleid);
forward SubirGas(vehicleid);
forward HideHouseTextdraws(playerid);
forward quitaraviso();
forward MiVehs(playerid);
/*-----------------------Natives-----------------------*/
native WP_Hash(buffer[], len, const str[]);
/* Stocks */
stock GetVehicleDriver(vehicleid)
{
    foreach(new i : Player)
    {
        if(GetPlayerState(i) == PLAYER_STATE_DRIVER && GetPlayerVehicleID(i) == vehicleid) 
        {
            if(IsPlayerInVehicle(i, vehicleid))
            {
                return i;
            }
        }
    }
    return INVALID_PLAYER_ID;
}
stock LoadGraffs()
{
    Graffos[0] = CreateObject(19353, 2065.3388, -999.4696, 54.8671, 0.0000, 0.0000, 163.1141);
    Graffos[1] = CreateObject(19353, 2221.2578, -1042.3133, 58.4361, 0.0000, 0.0000, -45.0146);
    Graffos[2] = CreateObject(19353, 2789.3322, -1080.4669, 31.2187, 0.0000, 0.0000, 89.1764);
    Graffos[3] = CreateObject(19353, 2662.7700, -1003.1914, 86.6174, 0.0000, 0.0000, 88.6648);
    Graffos[4] = CreateObject(19353, 2820.6503, -1161.8835, 25.9307, 0.0000, 0.0000, 88.6648);
    Graffos[5] = CreateObject(19353, 2823.7221, -1361.5662, 26.3566, 0.0000, 0.0000, 2.5447);
    Graffos[6] = CreateObject(19353, 2710.3046, -1333.2093, 48.2830, 0.0000, 0.0000, 90.5252);
    Graffos[7] = CreateObject(19353, 2659.4450, -1599.2915, 13.0819, 0.0000, 0.0000, 88.1639);
    Graffos[8] = CreateObject(19353, 2756.2910, -2026.6257, 14.0546, 0.0000, 0.0000, -3.6212);
    Graffos[9] = CreateObject(19353, 2640.7087, -2044.3720, 14.0500, 0.0000, 0.0000, 178.5922);
    Graffos[10] = CreateObject(19353, 2459.5876, -1973.5318, 13.9661, 0.0000, 0.0000, 178.3752);
    Graffos[11] = CreateObject(19353, 2439.0822, -1686.4461, 14.2802, 0.0000, 0.0000, -1.0739);
    Graffos[12] = CreateObject(19353, 2280.7919, -1695.9114, 14.1112, 0.0000, 0.0000, 90.5097);
    Graffos[13] = CreateObject(19353, 2198.6386, -1593.8150, 14.9015, 0.0000, 0.0000, 164.1115);
    Graffos[14] = CreateObject(19353, 2112.9003, -1594.5621, 14.0515, 0.0000, 0.0000, -89.7360);
    Graffos[15] = CreateObject(19353, 1928.9144, -2025.4291, 14.0468, 0.0000, 0.0000, -2.2656);
    Graffos[16] = CreateObject(19353, 1682.6699, -2163.4282, 14.0546, 0.0000, 0.0000, 177.7851);
    Graffos[17] = CreateObject(19353, 1021.3227, -2089.6579, 13.7941, 0.0000, 0.0000, 168.5809);
    Graffos[18] = CreateObject(19353, 1151.5147, -1876.3502, 14.0468, 0.0000, 0.0000, -88.2335);
    Graffos[19] = CreateObject(19353, 2391.0729, -1240.5858, 25.3451, 0.0000, 0.0000, 6.0363);
    Graffos[20] = CreateObject(19353, 2352.0612, -1251.1712, 23.0000, 0.0000, 0.0000, 179.4986);
    SetObjectMaterialText(Graffos[0], "LatinRP", 0, 90, "Arial", 24, 1, -1, 0, 1);
    SetObjectMaterialText(Graffos[1], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[2], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[3], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[4], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[5], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[6], "LatinRP", 0, 90, "arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[7], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[8], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[9], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[10], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[11], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[12], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[13], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[14], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[15], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[16], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[17], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[18], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[19], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    SetObjectMaterialText(Graffos[20], "LatinRP", 0, 90, "Arial", 24, 1, -32256, 0, 1);
    return 1;
}

stock ShowEst(playerid)
{
    new dinero = PlayerInfo[playerid][pDinero];
    new nivel = PlayerInfo[playerid][pNivel];
    new nombre[MAX_PLAYER_NAME];
    new opciones1[20],opciones2[20],string[450],opciones3[20];
    GetPlayerName(playerid, nombre, sizeof(nombre));
    if(PlayerInfo[playerid][pVip] == 1) format(opciones1, sizeof(opciones1), "{2BA30A}Si");
    else format(opciones1, sizeof(opciones1), "{FA0505}No");
    if(PlayerInfo[playerid][LatinCoins] > 1) format(opciones2, sizeof(opciones2), "{2BA30A}%s",PlayerInfo[playerid][LatinCoins]);
    else format(opciones2, sizeof(opciones2), "{FA0505}No");
    if(PlayerInfo[playerid][pJob] == 1) format(opciones3, sizeof(opciones3), "{2BA30A}FedEx");
    else if(PlayerInfo[playerid][pJob] == 2) format(opciones3, sizeof(opciones3), "{FA0505}Transportista");
    else format(opciones3, sizeof(opciones3), "Desempleado");
    format(string, sizeof(string), "\
    ID DB: \t%d\n\
    ID IG: \t%d\n\
    Nombre: %s\n\
    Nivel:  \t%d\n\
    Dinero: \t%d\n\
    Dinero Banco:  \t %d\n\
    Edad:   \t%d\n\
    Botiquines: \t%d\n\
    Medicamentos:   \t%d\n\
    Marihuana:  \t%d\n\
    Vip:    \t%s\n\
    LatinCoins: \t%d\n\
    Trabajo:    \t%s\
    ",PlayerInfo[playerid][mID],playerid,nombre,nivel,dinero,PlayerInfo[playerid][pBanco],PlayerInfo[playerid][pEdad],PlayerInfo[playerid][pBotis],PlayerInfo[playerid][pMedicamentos],PlayerInfo[playerid][pMarihuana],opciones1,opciones2,opciones3);
    ShowPlayerDialog(playerid, DIALOG_EST, DIALOG_STYLE_LIST, "Opciones de configuración", string, "Aceptar","Cancelar");
    return 1;
}

stock MostrarConfigs(playerid)
{
    new opciones1[20],opciones2[20],string[450],opciones3[20]; /*opciones4[20],opciones5[20],opciones6[20],opciones7[20];*/
    if(camaraon[playerid] == 1) format(opciones1, sizeof(opciones1), "< {2BA30A}Si");
    else format(opciones1, sizeof(opciones1), "> {FA0505}No");
    if(anonimodb[playerid] == 1) format(opciones2, sizeof(opciones2), "< {2BA30A}Si");
    else format(opciones2, sizeof(opciones2), "> {FA0505}No");
    if(twitanonimo[playerid] == 1) format(opciones3, sizeof(opciones3), "< {2BA30A}Si");
    else format(opciones3, sizeof(opciones3), "> {FA0505}No");
    format(string, sizeof(string),"Primera Persona\t%s\nAnonimatum DeepWeb\t%s\nAnonimatum Twitter\t%s\nCambiar Nombre (Te quedan %d cambios)",opciones1,opciones2,opciones3,PlayerInfo[playerid][ChangesName]);
    ShowPlayerDialog(playerid, DIALOG_CONFIG, DIALOG_STYLE_LIST, "Opciones de configuración", string, "Cambiar", "Cerrar");
    return 1;
}
    /* Otras configs
    if(MoreConfig) format(opciones5, sizeof(opciones5), "< {2BA30A}Sí");
    else format(opciones5, sizeof(opciones5), "> {FA0505}No");
    if(MoreConfig) format(opciones6, sizeof(opciones6), "< {2BA30A}Sí");
    else format(opciones6, sizeof(opciones6), "> {FA0505}No");
    if(MoreConfig) format(opciones7, sizeof(opciones7), "< {2BA30A}Sí");
    else format(opciones7, sizeof(opciones7), "> {FA0505}No");
    */

stock NombreJugador(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}
stock CreateGangZones()
{
    /* nothing now */
    return 1;
}
stock LoadGangZones(playerid)
{
    SCM(playerid,-1,"DEBUG: No hay territorios");
     /* Nothing now */
    return 1;
}

stock strreplacex(string[], find, replace)
{
    for(new i=0; string[i]; i++)
    {
        if(string[i] == find)
        {
            string[i] = replace;
        }
    }
}

stock ClearPlayerChat(playerid)
{
    for(new i = 0; i < 100; i ++)
    {
        SendClientMessage(playerid, -1, " ");
    }
    return 1;
}

stock SendClientMessageToNearby(playerid, color, Float:radio, message[])
{
    new Float:ix, Float:iy, Float:iz;
    GetPlayerPos(playerid, ix, iy, iz);
    foreach(new i : Player)
    {
        if(IsPlayerInRangeOfPoint(i, radio, ix, iy, iz) && GetPlayerVirtualWorld(i) == GetPlayerVirtualWorld(playerid))
        {
            if(GetPlayerInterior(i) == GetPlayerInterior(playerid)) SendClientMessage(i, color, message);
        }
    }
    return 1;
}

stock IsPlayerSpectating(playerid)
{
    if(sSpectating[playerid]) return true;
    return false;
}

stock IsPlayerBeiningSpectated(playerid)
{
    if(sBeingSpectated[playerid]) return true;
    return false;
}

stock PreloadAnimLib(playerid, animlib[]) ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0);

stock pName(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}

stock CamaraInicio(playerid)
{
    SetPlayerCameraPos(playerid,1702.620849,-1851.958251,13.564262);
    SetPlayerCameraLookAt(playerid, 1702.620849,-1851.958251,13.564262);
    SetPlayerPos(playerid,1702.620849,-1851.958251,13.564262);
    TogglePlayerControllable(playerid,0);
    return 1;
}

stock MensajeMedicos(const string[])
{
    for(new i; i <MAX_PLAYERS; i++)
    {
        if (PlayerInfo[i][pMedico] >= 1)
        {
            SendClientMessage(i, COLOR_ROJO,string);
        }
    }
    return 1;
}



stock RadioPolicia(const string[])
{
    for(new i; i <MAX_PLAYERS; i++)
    {
        if (PlayerInfo[i][pPolicia] >= 1)
        {
            SendClientMessage(i,-1,string);
        }
    }
    return 1;
}

stock SendMessageToAdmin(const string[])
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if (EsAdmin[i] == true && PlayerInfo[i][pAdmin] >= 1)
        {
            SendClientMessage(i, -1, string);
        }
    }
    return 1;
}

stock GetPlayerStaffRank(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        new string[20]
        switch(PlayerInfo[playerid][pAdmin])
        {
            case 1: string = "Ayudante";
            case 2: string = "Moderador";
            case 3: string = "Administrador";
            case 4: string = "Encargado del Staff";
            case 5: string = "Fundador";
        }
        return string;
    }
    return 0;
}

stock strfindex(string[], find) // return 1 if is true, 0 is false //retorna 1 si es velda 0 si es más falso que peru con palomas
{
    for(new i=0; string[i]; i++)
    {
        if(string[i] == find)
        {
            return 1;
        }
    }
    return 0;
}

stock TextdrawError(playerid, string[])
{
    TextDrawSetString(TextDrawError, string);
    TextDrawShowForPlayer(playerid, TextDrawError);
    SetTimerEx("CommandError", 2000, false, "i", playerid);
    return 1;
}
stock LoadPlayerTextdraws(playerid)
{
Box[playerid] = CreatePlayerTextDraw(playerid, 559.000000, 179.000000, "_");
PlayerTextDrawFont(playerid, Box[playerid], 1);
PlayerTextDrawLetterSize(playerid, Box[playerid], 0.699998, 24.799890);
PlayerTextDrawTextSize(playerid, Box[playerid], 303.500000, 138.500000);
PlayerTextDrawSetOutline(playerid, Box[playerid], 1);
PlayerTextDrawSetShadow(playerid, Box[playerid], 0);
PlayerTextDrawAlignment(playerid, Box[playerid], 2);
PlayerTextDrawColor(playerid, Box[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, Box[playerid], 255);
PlayerTextDrawBoxColor(playerid, Box[playerid], 135);
PlayerTextDrawUseBox(playerid, Box[playerid], 1);
PlayerTextDrawSetProportional(playerid, Box[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Box[playerid], 0);

Nombre_[playerid] = CreatePlayerTextDraw(playerid, 490.000000, 176.000000, "Nombre_Apellido");
PlayerTextDrawFont(playerid, Nombre_[playerid], 1);
PlayerTextDrawLetterSize(playerid, Nombre_[playerid], 0.391665, 2.000000);
PlayerTextDrawTextSize(playerid, Nombre_[playerid], 604.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, Nombre_[playerid], 1);
PlayerTextDrawSetShadow(playerid, Nombre_[playerid], 0);
PlayerTextDrawAlignment(playerid, Nombre_[playerid], 1);
PlayerTextDrawColor(playerid, Nombre_[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, Nombre_[playerid], 255);
PlayerTextDrawBoxColor(playerid, Nombre_[playerid], 50);
PlayerTextDrawUseBox(playerid, Nombre_[playerid], 0);
PlayerTextDrawSetProportional(playerid, Nombre_[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Nombre_[playerid], 0);

Skin[playerid] = CreatePlayerTextDraw(playerid, 523.000000, 195.000000, "Preview_Model");
PlayerTextDrawFont(playerid, Skin[playerid], 5);
PlayerTextDrawLetterSize(playerid, Skin[playerid], 0.600000, 2.000000);
PlayerTextDrawTextSize(playerid, Skin[playerid], 106.500000, 209.500000);
PlayerTextDrawSetOutline(playerid, Skin[playerid], 0);
PlayerTextDrawSetShadow(playerid, Skin[playerid], 0);
PlayerTextDrawAlignment(playerid, Skin[playerid], 1);
PlayerTextDrawColor(playerid, Skin[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, Skin[playerid], 125);
PlayerTextDrawBoxColor(playerid, Skin[playerid], 255);
PlayerTextDrawUseBox(playerid, Skin[playerid], 0);
PlayerTextDrawSetProportional(playerid, Skin[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Skin[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, Skin[playerid], 0);
PlayerTextDrawSetPreviewRot(playerid, Skin[playerid], -10.000000, 0.000000, -20.000000, 1.000000);
PlayerTextDrawSetPreviewVehCol(playerid, Skin[playerid], 1, 1);

Age[playerid] = CreatePlayerTextDraw(playerid, 491.000000, 208.000000, "Edad: 10");
PlayerTextDrawFont(playerid, Age[playerid], 1);
PlayerTextDrawLetterSize(playerid, Age[playerid], 0.408332, 1.999998);
PlayerTextDrawTextSize(playerid, Age[playerid], 556.000000, 17.000000);
PlayerTextDrawSetOutline(playerid, Age[playerid], 1);
PlayerTextDrawSetShadow(playerid, Age[playerid], 0);
PlayerTextDrawAlignment(playerid, Age[playerid], 1);
PlayerTextDrawColor(playerid, Age[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, Age[playerid], 255);
PlayerTextDrawBoxColor(playerid, Age[playerid], 50);
PlayerTextDrawUseBox(playerid, Age[playerid], 0);
PlayerTextDrawSetProportional(playerid, Age[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Age[playerid], 0);

Close[playerid] = CreatePlayerTextDraw(playerid, 619.000000, 175.000000, "X");
PlayerTextDrawFont(playerid, Close[playerid], 1);
PlayerTextDrawLetterSize(playerid, Close[playerid], 0.491665, 1.450000);
PlayerTextDrawTextSize(playerid, Close[playerid], 628.500000, 18.000000);
PlayerTextDrawSetOutline(playerid, Close[playerid], 0);
PlayerTextDrawSetShadow(playerid, Close[playerid], 0);
PlayerTextDrawAlignment(playerid, Close[playerid], 1);
PlayerTextDrawColor(playerid, Close[playerid], -16776961);
PlayerTextDrawBackgroundColor(playerid, Close[playerid], 255);
PlayerTextDrawBoxColor(playerid, Close[playerid], 50);
PlayerTextDrawUseBox(playerid, Close[playerid], 0);
PlayerTextDrawSetProportional(playerid, Close[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Close[playerid], 1);

Nacimiento[playerid] = CreatePlayerTextDraw(playerid, 491.000000, 240.000000, "Fecha de nacimiento: 10-10-10");
PlayerTextDrawFont(playerid, Nacimiento[playerid], 1);
PlayerTextDrawLetterSize(playerid, Nacimiento[playerid], 0.395833, 2.349999);
PlayerTextDrawTextSize(playerid, Nacimiento[playerid], 559.500000, 45.500000);
PlayerTextDrawSetOutline(playerid, Nacimiento[playerid], 1);
PlayerTextDrawSetShadow(playerid, Nacimiento[playerid], 0);
PlayerTextDrawAlignment(playerid, Nacimiento[playerid], 1);
PlayerTextDrawColor(playerid, Nacimiento[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, Nacimiento[playerid], 255);
PlayerTextDrawBoxColor(playerid, Nacimiento[playerid], 50);
PlayerTextDrawUseBox(playerid, Nacimiento[playerid], 0);
PlayerTextDrawSetProportional(playerid, Nacimiento[playerid], 1);
PlayerTextDrawSetSelectable(playerid, Nacimiento[playerid], 0);

City[playerid] = CreatePlayerTextDraw(playerid, 490.000000, 319.000000, "Lugar de nacimiento: Ciudad-Xd");
PlayerTextDrawFont(playerid, City[playerid], 1);
PlayerTextDrawLetterSize(playerid, City[playerid], 0.433333, 2.299999);
PlayerTextDrawTextSize(playerid, City[playerid], 613.500000, 17.000000);
PlayerTextDrawSetOutline(playerid, City[playerid], 1);
PlayerTextDrawSetShadow(playerid, City[playerid], 0);
PlayerTextDrawAlignment(playerid, City[playerid], 1);
PlayerTextDrawColor(playerid, City[playerid], -1);
PlayerTextDrawBackgroundColor(playerid, City[playerid], 255);
PlayerTextDrawBoxColor(playerid, City[playerid], 50);
PlayerTextDrawUseBox(playerid, City[playerid], 0);
PlayerTextDrawSetProportional(playerid, City[playerid], 1);
PlayerTextDrawSetSelectable(playerid, City[playerid], 0);
return 1;
}
stock LoadTextDraws()
{
    /*TD CASA*/
    TdCasa[0] = TextDrawCreate(553.000000, 103.000000, "_");
    TextDrawFont(TdCasa[0], 1);
    TextDrawLetterSize(TdCasa[0], 0.600000, 11.400007);
    TextDrawTextSize(TdCasa[0], 284.500000, 108.500000);
    TextDrawSetOutline(TdCasa[0], 1);
    TextDrawSetShadow(TdCasa[0], 0);
    TextDrawAlignment(TdCasa[0], 2);
    TextDrawColor(TdCasa[0], -1);
    TextDrawBackgroundColor(TdCasa[0], 255);
    TextDrawBoxColor(TdCasa[0], 135);
    TextDrawUseBox(TdCasa[0], 1);
    TextDrawSetProportional(TdCasa[0], 1);
    TextDrawSetSelectable(TdCasa[0], 0);

    TdCasa[1] = TextDrawCreate(504.000000, 111.000000, "Propietario: ");
    TextDrawFont(TdCasa[1], 1);
    TextDrawLetterSize(TdCasa[1], 0.220833, 1.150000);
    TextDrawTextSize(TdCasa[1], 400.000000, 17.000000);
    TextDrawSetOutline(TdCasa[1], 1);
    TextDrawSetShadow(TdCasa[1], 0);
    TextDrawAlignment(TdCasa[1], 1);
    TextDrawColor(TdCasa[1], -1);
    TextDrawBackgroundColor(TdCasa[1], 255);
    TextDrawBoxColor(TdCasa[1], 50);
    TextDrawUseBox(TdCasa[1], 0);
    TextDrawSetProportional(TdCasa[1], 1);
    TextDrawSetSelectable(TdCasa[1], 0);

    TdCasa[2] = TextDrawCreate(504.000000, 133.000000, "Comprada: ");
    TextDrawFont(TdCasa[2], 1);
    TextDrawLetterSize(TdCasa[2], 0.220833, 1.150000);
    TextDrawTextSize(TdCasa[2], 400.000000, 17.000000);
    TextDrawSetOutline(TdCasa[2], 1);
    TextDrawSetShadow(TdCasa[2], 0);
    TextDrawAlignment(TdCasa[2], 1);
    TextDrawColor(TdCasa[2], -1);
    TextDrawBackgroundColor(TdCasa[2], 255);
    TextDrawBoxColor(TdCasa[2], 50);
    TextDrawUseBox(TdCasa[2], 0);
    TextDrawSetProportional(TdCasa[2], 1);
    TextDrawSetSelectable(TdCasa[2], 0);

    TdCasa[3] = TextDrawCreate(504.000000, 177.000000, "Precio: ");
    TextDrawFont(TdCasa[3], 1);
    TextDrawLetterSize(TdCasa[3], 0.220833, 1.150000);
    TextDrawTextSize(TdCasa[3], 400.000000, 17.000000);
    TextDrawSetOutline(TdCasa[3], 1);
    TextDrawSetShadow(TdCasa[3], 0);
    TextDrawAlignment(TdCasa[3], 1);
    TextDrawColor(TdCasa[3], -1);
    TextDrawBackgroundColor(TdCasa[3], 255);
    TextDrawBoxColor(TdCasa[3], 50);
    TextDrawUseBox(TdCasa[3], 0);
    TextDrawSetProportional(TdCasa[3], 1);
    TextDrawSetSelectable(TdCasa[3], 0);

    TdCasa[4] = TextDrawCreate(504.000000, 156.000000, "Cerrada: ");
    TextDrawFont(TdCasa[4], 1);
    TextDrawLetterSize(TdCasa[4], 0.220833, 1.150000);
    TextDrawTextSize(TdCasa[4], 400.000000, 17.000000);
    TextDrawSetOutline(TdCasa[4], 1);
    TextDrawSetShadow(TdCasa[4], 0);
    TextDrawAlignment(TdCasa[4], 1);
    TextDrawColor(TdCasa[4], -1);
    TextDrawBackgroundColor(TdCasa[4], 255);
    TextDrawBoxColor(TdCasa[4], 50);
    TextDrawUseBox(TdCasa[4], 0);
    TextDrawSetProportional(TdCasa[4], 1);
    TextDrawSetSelectable(TdCasa[4], 0);
    /*BINCO*/
    CajaIzquierda = TextDrawCreate(261.903503, 409.500030, "LD_SPAC:white");
    TextDrawLetterSize(CajaIzquierda, 0.000000, 0.000000);
    TextDrawTextSize(CajaIzquierda, 15.166683, 15.166683);
    TextDrawAlignment(CajaIzquierda, 1);
    TextDrawColor(CajaIzquierda, 170);
    TextDrawSetShadow(CajaIzquierda, 0);
    TextDrawSetOutline(CajaIzquierda, 0);
    TextDrawFont(CajaIzquierda, 4);
    TextDrawSetPreviewModel(CajaIzquierda, 349);
    TextDrawSetPreviewRot(CajaIzquierda, 360.000000, 0.000000, 0.000000, 3.000000);
    TextDrawSetSelectable(CajaIzquierda, true);

    BotonIzquierda = TextDrawCreate(262.840270, 407.166717, "<");
    TextDrawLetterSize(BotonIzquierda, 0.416734, 2.119165);
    TextDrawAlignment(BotonIzquierda, 1);
    TextDrawColor(BotonIzquierda, -1);
    TextDrawSetShadow(BotonIzquierda, 0);
    TextDrawSetOutline(BotonIzquierda, 1);
    TextDrawBackgroundColor(BotonIzquierda, 255);
    TextDrawFont(BotonIzquierda, 1);
    TextDrawSetProportional(BotonIzquierda, 1);

    CajaSelect = TextDrawCreate(277.364562, 409.500000, "LD_SPAC:white");
    TextDrawLetterSize(CajaSelect, 0.000000, 0.000000);
    TextDrawTextSize(CajaSelect, 67.467041, 15.166687);
    TextDrawAlignment(CajaSelect, 1);
    TextDrawColor(CajaSelect, 170);
    TextDrawSetShadow(CajaSelect, 0);
    TextDrawSetOutline(CajaSelect, 0);
    TextDrawBackgroundColor(CajaSelect, 187);
    TextDrawFont(CajaSelect, 4);
    TextDrawSetSelectable(CajaSelect, true);

    BotonSelect = TextDrawCreate(280.175689, 410.083374, "Seleccionar");
    TextDrawLetterSize(BotonSelect, 0.333806, 1.419166);
    TextDrawAlignment(BotonSelect, 1);
    TextDrawColor(BotonSelect, -1);
    TextDrawSetShadow(BotonSelect, 0);
    TextDrawSetOutline(BotonSelect, 1);
    TextDrawBackgroundColor(BotonSelect, 255);
    TextDrawFont(BotonSelect, 1);
    TextDrawSetProportional(BotonSelect, 1);

    CajaDerecha = TextDrawCreate(344.831573, 409.500000, "LD_SPAC:white");
    TextDrawLetterSize(CajaDerecha, 0.000000, 0.000000);
    TextDrawTextSize(CajaDerecha, 15.166683, 15.166687);
    TextDrawAlignment(CajaDerecha, 1);
    TextDrawColor(CajaDerecha, 170);
    TextDrawSetShadow(CajaDerecha, 0);
    TextDrawSetOutline(CajaDerecha, 0);
    TextDrawFont(CajaDerecha, 4);
    TextDrawSetSelectable(CajaDerecha, true);

    BotonDerecha = TextDrawCreate(348.579681, 407.166564, ">");
    TextDrawLetterSize(BotonDerecha, 0.416734, 2.119165);
    TextDrawAlignment(BotonDerecha, 1);
    TextDrawColor(BotonDerecha, -1);
    TextDrawSetShadow(BotonDerecha, 0);
    TextDrawSetOutline(BotonDerecha, 1);
    TextDrawBackgroundColor(BotonDerecha, 255);
    TextDrawFont(BotonDerecha, 1);
    TextDrawSetProportional(BotonDerecha, 1);
    /* Textdraw cuando un player conecta */
    coneccion = TextDrawCreate(300.0, 350.0, ",Ha entrado al servidor...");
    TextDrawUseBox(coneccion, 1);
    TextDrawColor(coneccion, COLOR_RED);
    TextDrawBoxColor(coneccion, COLOR_BLACK);
    TextDrawBackgroundColor(coneccion,COLOR_BLACK);
    /* TextDraw - SPAWN */
    Spawn0 = TextDrawCreate(680.000000, 0.000000, "New Textdraw");
    TextDrawBackgroundColor(Spawn0, 255);
    TextDrawFont(Spawn0, 5);
    TextDrawLetterSize(Spawn0, 0.500000, 1.000000);
    TextDrawColor(Spawn0, -1);
    TextDrawSetOutline(Spawn0, 0);
    TextDrawSetProportional(Spawn0, 1);
    TextDrawSetShadow(Spawn0, 1);
    TextDrawUseBox(Spawn0, 1);
    TextDrawBoxColor(Spawn0, 255);
    TextDrawTextSize(Spawn0, -860.000000, 470.000000);
    TextDrawSetPreviewModel(Spawn0, 0);
    TextDrawSetPreviewRot(Spawn0, -16.000000, 0.000000, -55.000000, 1500000.000000);
    TextDrawSetSelectable(Spawn0, 0);

    Spawn1 = TextDrawCreate(430.000000, 0.000000, "LatinRP");
    TextDrawBackgroundColor(Spawn1, -1);
    TextDrawFont(Spawn1, 3);
    TextDrawLetterSize(Spawn1, 0.900000, 3.000000);
    TextDrawColor(Spawn1, -1);
    TextDrawSetOutline(Spawn1, 1);
    TextDrawSetProportional(Spawn1, 1);
    TextDrawSetSelectable(Spawn1, 0);
    /* Iconos del mapa */
    CreateDynamicMapIcon(2244.317871,-1665.547485,15.476562, 45, 0, 0, 0, -1, 300.0, 0, -1);//Binco GantonCreateDynamicMapIcon(1555.4867, -1675.5366, 264.5688, 30, 0, 0, 0, -1, 300.0, 0, -1); // LSPD fixed
    CreateDynamicMapIcon(2034.4761, -14909.3236, 136.5948, 22, 0, 0, 0, -1, 300.0, 0, -1);// HP Ganton fixedCreateDynamicMapIcon(1172.6353, -1323.3872, 91.6344, 22, 0, 0, 0, -1, 300.0, 0, -1); //HPC fixed
    CreateDynamicMapIcon(1766.8564, -1903.8612, 160.4364, 42, 0, 0, 0, -1, 300.0, 0, -1);// Job Taxi fixed
    CreateDynamicMapIcon(2509.668212,-2638.108886,13.796875, 42, 0, 0, 0, -1, 300.0, 0, -1);//Job FedEX
    CreateDynamicMapIcon(1833.7759, -1842.6233, 271.5660, 17, 0, 0, 0, -1, 300.0, 0, -1); // Oxxo Unity fixed
    CreateDynamicMapIcon(1313.195068,-917.556823,38.377235, 17, 0, 0, 0, -1, 300.0, 0, -1);//Oxxo Commerce
    CreateDynamicMapIcon(1348.366088,-1748.834960,13.037858, 17, 0, 0, 0, -1, 300.0, 0, -1);//Oxxo Vinewood
    /* CMD Erroneo debajo del HUD */
    TextDrawError = TextDrawCreate(478.359619, 114.916625, "Error: comando inexistente.");
    TextDrawLetterSize(TextDrawError, 0.239161, 1.512500);
    TextDrawAlignment(TextDrawError, 1);
    TextDrawColor(TextDrawError, -1523963137);
    TextDrawSetShadow(TextDrawError, 0);
    TextDrawSetOutline(TextDrawError, 1);
    TextDrawBackgroundColor(TextDrawError, 255);
    TextDrawFont(TextDrawError, 1);
    TextDrawSetProportional(TextDrawError, 1);
    /* Textdraw Logo de LatinRP */
    latinrp = TextDrawCreate(580.000000, 350.000000,"LatinRP");
    TextDrawAlignment(latinrp,0);
    TextDrawBackgroundColor(latinrp,COLOR_BLACK);
    TextDrawFont(latinrp,1);
    TextDrawLetterSize(latinrp,0.430000, 1.400000);
    TextDrawColor(latinrp,COLOR_RED);
    TextDrawSetOutline(latinrp,1);
    TextDrawSetProportional(latinrp,1);
    TextDrawSetShadow(latinrp,1);
    /* Aviso pintando graff */
    PintandoGraff[0] = TextDrawCreate(641.859619, 327.083312, "box");
    TextDrawLetterSize(PintandoGraff[0], 0.000000, 2.175697);
    TextDrawTextSize(PintandoGraff[0], 498.000000, 0.000000);
    TextDrawAlignment(PintandoGraff[0], 1);
    TextDrawColor(PintandoGraff[0], -1);
    TextDrawUseBox(PintandoGraff[0], 1);
    TextDrawBoxColor(PintandoGraff[0], 102);
    TextDrawSetShadow(PintandoGraff[0], 0);
    TextDrawSetOutline(PintandoGraff[0], 0);
    TextDrawBackgroundColor(PintandoGraff[0], 255);
    TextDrawFont(PintandoGraff[0], 1);
    TextDrawSetProportional(PintandoGraff[0], 1);
    TextDrawSetShadow(PintandoGraff[0], 0);

    PintandoGraff[1] = TextDrawCreate(620.307861, 328.833404, "banda");
    TextDrawLetterSize(PintandoGraff[1], 0.373762, 1.547499);
    TextDrawAlignment(PintandoGraff[1], 3);
    TextDrawColor(PintandoGraff[1], -1);
    TextDrawSetShadow(PintandoGraff[1], 0);
    TextDrawSetOutline(PintandoGraff[1], 0);
    TextDrawBackgroundColor(PintandoGraff[1], 255);
    TextDrawFont(PintandoGraff[1], 1);
    TextDrawSetProportional(PintandoGraff[1], 1);
    TextDrawSetShadow(PintandoGraff[1], 0);


    PintandoGraff[2] = TextDrawCreate(642.327941, 327.083435, "box");
    TextDrawLetterSize(PintandoGraff[2], 0.000000, 2.175697);
    TextDrawTextSize(PintandoGraff[2], 634.000000, 0.000000);
    TextDrawAlignment(PintandoGraff[2], 1);
    TextDrawColor(PintandoGraff[2], -1);
    TextDrawUseBox(PintandoGraff[2], 1);
    TextDrawBoxColor(PintandoGraff[2], 110623999);
    TextDrawSetShadow(PintandoGraff[2], 0);
    TextDrawSetOutline(PintandoGraff[2], 0);
    TextDrawBackgroundColor(PintandoGraff[2], 255);
    TextDrawFont(PintandoGraff[2], 1);
    TextDrawSetProportional(PintandoGraff[2], 1);
    TextDrawSetShadow(PintandoGraff[2], 0);
    /* Banda ganadora del graff */
    BandaGanadoraGrafo[1] = TextDrawCreate(479.751373, 104.250030, "box");
    TextDrawLetterSize(BandaGanadoraGrafo[1], 0.000000, -0.073204);
    TextDrawTextSize(BandaGanadoraGrafo[1], 628.000000, 0.000000);
    TextDrawAlignment(BandaGanadoraGrafo[1], 1);
    TextDrawColor(BandaGanadoraGrafo[1], -1);
    TextDrawUseBox(BandaGanadoraGrafo[1], 1);
    TextDrawBoxColor(BandaGanadoraGrafo[1], 0x097fe1FF);
    TextDrawSetShadow(BandaGanadoraGrafo[1], 0);
    TextDrawSetOutline(BandaGanadoraGrafo[1], 0);
    TextDrawBackgroundColor(BandaGanadoraGrafo[1], 255);
    TextDrawFont(BandaGanadoraGrafo[1], 1);
    TextDrawSetProportional(BandaGanadoraGrafo[1], 1);
    TextDrawSetShadow(BandaGanadoraGrafo[1], 0);

    BandaGanadoraGrafo[2] = TextDrawCreate(622.181579, 120.166694, "Disputa Terminada");
    TextDrawLetterSize(BandaGanadoraGrafo[2], 0.287086, 1.547500);
    TextDrawAlignment(BandaGanadoraGrafo[2], 3);
    TextDrawColor(BandaGanadoraGrafo[2], -1);
    TextDrawSetShadow(BandaGanadoraGrafo[2], 0);
    TextDrawSetOutline(BandaGanadoraGrafo[2], 0);
    TextDrawBackgroundColor(BandaGanadoraGrafo[2], 255);
    TextDrawFont(BandaGanadoraGrafo[2], 1);
    TextDrawSetProportional(BandaGanadoraGrafo[2], 1);
    TextDrawSetShadow(BandaGanadoraGrafo[2], 0);

    BandaGanadoraGrafo[3] = TextDrawCreate(478.646087, 110.916702, "hud:radar_spray");
    TextDrawLetterSize(BandaGanadoraGrafo[3], 0.000000, 0.000000);
    TextDrawTextSize(BandaGanadoraGrafo[3], 17.000000, 15.000000);
    TextDrawAlignment(BandaGanadoraGrafo[3], 1);
    TextDrawColor(BandaGanadoraGrafo[3], -1);
    TextDrawSetShadow(BandaGanadoraGrafo[3], 0);
    TextDrawSetOutline(BandaGanadoraGrafo[3], 0);
    TextDrawBackgroundColor(BandaGanadoraGrafo[3], 255);
    TextDrawFont(BandaGanadoraGrafo[3], 4);
    TextDrawSetProportional(BandaGanadoraGrafo[3], 0);
    TextDrawSetShadow(BandaGanadoraGrafo[3], 0);

    BandaGanadoraGrafo[4] = TextDrawCreate(556.120056, 122.333267, "Grove");
    TextDrawLetterSize(BandaGanadoraGrafo[4], 0.289427, 1.296663);
    TextDrawAlignment(BandaGanadoraGrafo[4], 2);
    TextDrawColor(BandaGanadoraGrafo[4], -1);
    TextDrawSetShadow(BandaGanadoraGrafo[4], 0);
    TextDrawSetOutline(BandaGanadoraGrafo[4], 0);
    TextDrawBackgroundColor(BandaGanadoraGrafo[4], 255);
    TextDrawFont(BandaGanadoraGrafo[4], 1);
    TextDrawSetProportional(BandaGanadoraGrafo[4], 1);
    TextDrawSetShadow(BandaGanadoraGrafo[4], 0);
    /* */
    ZonaGrafos[0] = TextDrawCreate(479.750579, 107.166740, "box");
    TextDrawLetterSize(ZonaGrafos[0], 0.000000, 3.393850);
    TextDrawTextSize(ZonaGrafos[0], 628.000000, 0.000000);
    TextDrawAlignment(ZonaGrafos[0], 1);
    TextDrawColor(ZonaGrafos[0], -1);
    TextDrawUseBox(ZonaGrafos[0], 1);
    TextDrawBoxColor(ZonaGrafos[0], 102);
    TextDrawSetShadow(ZonaGrafos[0], 0);
    TextDrawSetOutline(ZonaGrafos[0], 0);
    TextDrawBackgroundColor(ZonaGrafos[0], 255);
    TextDrawFont(ZonaGrafos[0], 1);
    TextDrawSetProportional(ZonaGrafos[0], 1);
    TextDrawSetShadow(ZonaGrafos[0], 0);

    ZonaGrafos[1] = TextDrawCreate(479.751373, 110.250030, "box");
    TextDrawLetterSize(ZonaGrafos[1], 0.000000, -0.073204);
    TextDrawTextSize(ZonaGrafos[1], 628.000000, 0.000000);
    TextDrawAlignment(ZonaGrafos[1], 1);
    TextDrawColor(ZonaGrafos[1], -1);
    TextDrawUseBox(ZonaGrafos[1], 1);
    TextDrawBoxColor(ZonaGrafos[1], 0x097fe1FF);
    TextDrawSetShadow(ZonaGrafos[1], 0);
    TextDrawSetOutline(ZonaGrafos[1], 0);
    TextDrawBackgroundColor(ZonaGrafos[1], 255);
    TextDrawFont(ZonaGrafos[1], 1);
    TextDrawSetProportional(ZonaGrafos[1], 1);
    TextDrawSetShadow(ZonaGrafos[1], 0);

    ZonaGrafos[2] = TextDrawCreate(617.027832, 107.166687, "Disputa en 15 minutos");
    TextDrawLetterSize(ZonaGrafos[2], 0.347994, 1.588333);
    TextDrawAlignment(ZonaGrafos[2], 3);
    TextDrawColor(ZonaGrafos[2], -1);
    TextDrawSetShadow(ZonaGrafos[2], 0);
    TextDrawSetOutline(ZonaGrafos[2], 0);
    TextDrawBackgroundColor(ZonaGrafos[2], 255);
    TextDrawFont(ZonaGrafos[2], 1);
    TextDrawSetProportional(ZonaGrafos[2], 1);
    TextDrawSetShadow(ZonaGrafos[2], 0);

    ZonaGrafos[3] = TextDrawCreate(556.120056, 122.333267, "Zona:");
    TextDrawLetterSize(ZonaGrafos[3], 0.289427, 1.296663);
    TextDrawAlignment(ZonaGrafos[3], 2);
    TextDrawColor(ZonaGrafos[3], -1);
    TextDrawSetShadow(ZonaGrafos[3], 0);
    TextDrawSetOutline(ZonaGrafos[3], 0);
    TextDrawBackgroundColor(ZonaGrafos[3], 255);
    TextDrawFont(ZonaGrafos[3], 1);
    TextDrawSetProportional(ZonaGrafos[3], 1);
    TextDrawSetShadow(ZonaGrafos[4], 0);

    ZonaGrafos[4] = TextDrawCreate(478.646087, 108.916702, "hud:radar_spray");
    TextDrawLetterSize(ZonaGrafos[4], 0.000000, 0.000000);
    TextDrawTextSize(ZonaGrafos[4], 17.000000, 15.000000);
    TextDrawAlignment(ZonaGrafos[4], 1);
    TextDrawColor(ZonaGrafos[4], -1);
    TextDrawSetShadow(ZonaGrafos[4], 0);
    TextDrawSetOutline(ZonaGrafos[4], 0);
    TextDrawBackgroundColor(ZonaGrafos[4], 255);
    TextDrawFont(ZonaGrafos[4], 4);
    TextDrawSetProportional(ZonaGrafos[4], 0);
    TextDrawSetShadow(ZonaGrafos[4], 0);

    AvisoGrafos1[0] = TextDrawCreate(1.859447, 285.666595, "box");
    TextDrawLetterSize(AvisoGrafos1[0], 0.000000, 3.487554);
    TextDrawTextSize(AvisoGrafos1[0], 136.000000, 0.000000);
    TextDrawAlignment(AvisoGrafos1[0], 1);
    TextDrawColor(AvisoGrafos1[0], -1);
    TextDrawUseBox(AvisoGrafos1[0], 1);
    TextDrawBoxColor(AvisoGrafos1[0], 102);
    TextDrawSetShadow(AvisoGrafos1[0], 0);
    TextDrawSetOutline(AvisoGrafos1[0], 0);
    TextDrawBackgroundColor(AvisoGrafos1[0], 255);
    TextDrawFont(AvisoGrafos1[0], 1);
    TextDrawSetProportional(AvisoGrafos1[0], 1);
    TextDrawSetShadow(AvisoGrafos1[0], 0);

    AvisoGrafos1[1] = TextDrawCreate(1.859480, 285.666625, "box");
    TextDrawLetterSize(AvisoGrafos1[1], 0.000000, 3.487555);
    TextDrawTextSize(AvisoGrafos1[1], 1.000000, 0.000000);
    TextDrawAlignment(AvisoGrafos1[1], 1);
    TextDrawColor(AvisoGrafos1[1], -1);
    TextDrawUseBox(AvisoGrafos1[1], 1);
    TextDrawBoxColor(AvisoGrafos1[1], 0x097fe1FF);
    TextDrawSetShadow(AvisoGrafos1[1], 0);
    TextDrawSetOutline(AvisoGrafos1[1], 0);
    TextDrawBackgroundColor(AvisoGrafos1[1], 255);
    TextDrawFont(AvisoGrafos1[1], 1);
    TextDrawSetProportional(AvisoGrafos1[1], 1);
    TextDrawSetShadow(AvisoGrafos1[1], 0);

    AvisoGrafos1[2] = TextDrawCreate(6.844840, 295.000091, "hud:radar_spray");
    TextDrawLetterSize(AvisoGrafos1[2], 0.000000, 0.000000);
    TextDrawTextSize(AvisoGrafos1[2], 10.000000, 13.000000);
    TextDrawAlignment(AvisoGrafos1[2], 1);
    TextDrawColor(AvisoGrafos1[2], -1);
    TextDrawSetShadow(AvisoGrafos1[2], 0);
    TextDrawSetOutline(AvisoGrafos1[2], 0);
    TextDrawBackgroundColor(AvisoGrafos1[2], 255);
    TextDrawFont(AvisoGrafos1[2], 4);
    TextDrawSetProportional(AvisoGrafos1[2], 0);
    TextDrawSetShadow(AvisoGrafos1[2], 0);

    AvisoGrafos1[3] = TextDrawCreate(132.576904, 285.666656, "Nueva disputa en");
    TextDrawLetterSize(AvisoGrafos1[3], 0.400467, 1.664166);
    TextDrawAlignment(AvisoGrafos1[3], 3);
    TextDrawColor(AvisoGrafos1[3], -1);
    TextDrawSetShadow(AvisoGrafos1[3], 0);
    TextDrawSetOutline(AvisoGrafos1[3], 0);
    TextDrawBackgroundColor(AvisoGrafos1[3], 255);
    TextDrawFont(AvisoGrafos1[3], 1);
    TextDrawSetProportional(AvisoGrafos1[3], 1);
    TextDrawSetShadow(AvisoGrafos1[3], 0);

    AvisoGrafos1[4] = TextDrawCreate(93.221130, 299.666687, "30 segundos.");
    TextDrawLetterSize(AvisoGrafos1[4], 0.400467, 1.664166);
    TextDrawAlignment(AvisoGrafos1[4], 3);
    TextDrawColor(AvisoGrafos1[4], -1);
    TextDrawSetShadow(AvisoGrafos1[4], 0);
    TextDrawSetOutline(AvisoGrafos1[4], 0);
    TextDrawBackgroundColor(AvisoGrafos1[4], 255);
    TextDrawFont(AvisoGrafos1[4], 1);
    TextDrawSetProportional(AvisoGrafos1[4], 1);
    TextDrawSetShadow(AvisoGrafos1[4], 0);

    EnMarchaGrafo = TextDrawCreate(611.405517, 106.583366, "Disputa en marcha:");
    TextDrawLetterSize(EnMarchaGrafo, 0.347993, 1.705000);
    TextDrawAlignment(EnMarchaGrafo, 3);
    TextDrawColor(EnMarchaGrafo, -1);
    TextDrawSetShadow(EnMarchaGrafo, 0);
    TextDrawSetOutline(EnMarchaGrafo, 0);
    TextDrawBackgroundColor(EnMarchaGrafo, 255);
    TextDrawFont(EnMarchaGrafo, 1);
    TextDrawSetProportional(EnMarchaGrafo, 1);
    TextDrawSetShadow(EnMarchaGrafo, 0);
    return 1;
}

stock LoadLabels()
{
    /* Mapeo temporal */
    CreateObject(19076, 1480.217895,-1710.925292,14.046870, 0.0, 0.0, 0.0, 0);
    Create3DTextLabel("Reclamar regalo [Y]", -1, 1480.217895,-1710.925292,14.046875, 10.0, 0, 0);
    Create3DTextLabel("Binco [Presiona {CCFF00} Y {FFFFFF} Para Comprar]",-1,207.430175,-100.326667,1005.257812,10.0,0,0);
    Create3DTextLabel("Binco [Presiona {CCFF00} F {FFFFFF} Para Salir]",-1,207.820220,-111.266334,1005.132812,10.0,0,0);
    Create3DTextLabel("Binco [Presiona {CCFF00} F {FFFFFF} Para Entrar]",-1,2244.317871,-1665.547485,15.476562,10.0,0,0);
    Create3DTextLabel("Mecanico [Pulsa {CCFF00} Y {FFFFFF} Para Vestirte]",-1,2131.174804,-2284.823486,20.664308,10.0,0,0);
    Create3DTextLabel("Trabajo Armero [Pulsa {CCFF00} Y {FFFFFF} Para Trabajar De Armero]",-1,CPTRABAJOARMERO,10.0,0,0);
    Create3DTextLabel("Fabrica De Armas [Pulsa {CCFF00} Y {FFFFFF} Para Crear Armas]",-1,CPCREARARMAS,10.0,0,0);
    Create3DTextLabel("Fabrica De Armas [Presiona {CCFF00} F {FFFFFF} Para Salir]",-1,CPSALIDAFABRICA,10.0,0,0);
    Create3DTextLabel("Fabrica De Armas [Presiona {CCFF00} F {FFFFFF} Para Entrar]",-1,CPENTRADAFABRICA,10.0,0,0);
    Create3DTextLabel("Casa De Ramiro El Mafioso [Pulsa {CCFF00} Y {FFFFFF} Para Entrar]",-1,691.362731,-1276.094360,13.560581,10.0,0,0);
    Create3DTextLabel("Trabajo Fedex[Pulsa {CCFF00} Y {FFFFFF} para Trabajar De Fedex]",-1,2509.668212,-2638.108886,13.796875,10.0,0,0);
    Create3DTextLabel("Trabajo Mecanico[Pulsa {CCFF00} Y {FFFFFF} Para Trabajar De Mecanico]",-1,2122.855468,-2275.192382,20.671875,10.0,0,0);
    Create3DTextLabel("Police[Pulsa {CCFF00} F {FFFFFF} Para Salir ]",-1,322.316101,302.359100,999.148437,10.0,0,0);
    Create3DTextLabel("Police[Pulsa {CCFF00} F {FFFFFF} Para Entrar ]",-1,275.806243,121.906959,1004.617187,10.0,0,0);
    Create3DTextLabel("LSPD [ Presiona {CCFF00} F {FFFFFF} Para Entrar]",-1,1555.491699,-1675.684448,16.195312,10.0,0,0);
    Create3DTextLabel("LSPD [ Presiona {CCFF00} F {FFFFFF} Para Salir]",-1,246.295333,107.299995, 1003.218750,10.0,0,0);
    Create3DTextLabel("El chalan[ Pulsa {CCFF00} Y {FFFFFF} Para Comprar Armas]",-1,2483.389404,-1293.238647,30.336767,10.0,0,0);
    Create3DTextLabel("El churches [ Pulsa {CCFF00} Y {FFFFFF} Para Comprarle Armas]",-1,2356.778076,-1046.714599,612.908874,10.0,0,0);
    Create3DTextLabel("Oxxo Unity [ Pulsa {CCFF00} F {FFFFFF} Para Entrar ]",-1,1833.780151,-1842.973266,13.578125,10.0,0,0); //Oxxo unity Entrada
    Create3DTextLabel("Oxxo Unity [ Pulsa {CCFF00} F {FFFFFF} Para Salir]",-1,-26.271457,-188.258941,1003.546875,10.0,0,0); //Oxxo unity Salida
    Create3DTextLabel("Oxxo Unity [ Usa {CCFF00} Y {FFFFFF} Para Comprar Objetos]",-1,-29.118547,-185.130172,1003.546875,10.0,0,0); //Oxxo Unity Comprar Objetos
    Create3DTextLabel("Oxxo Commerce [ Pulsa {CCFF00} F {FFFFFF} Para Salir]",-1,-30.876083,-92.011192,1003.546875,10.0,0,0); //Oxxo commerce Entrada
    Create3DTextLabel("Oxxo Commerce[ Pulsa {CCFF00} F {FFFFFF} Para Entrar]",-1,1352.368530,-1759.252075,13.507812,10.0,0,0); //Oxxo commerce Salida
    Create3DTextLabel("Oxxo Commerce[ Pulsa {CCFF00} Y {FFFFFF} Para Comprar]",-1,-27.628036,-89.944358,1003.546875,10.0,0,0); //Oxxo commerce Comprar Objetos
    Create3DTextLabel("Armamentos De Policias[ Pulsa {CCFF00} Y {FFFFFF} Para Armarte]",-1,327.232940,307.167846,999.148437,10.0,0,0); //Police Lobby
    Create3DTextLabel("Casa De NegruraNoob[Pulsa {CCFF00} F {FFFFFF} Para Entrar]",-1,2495.430664,-1691.139282,14.765625,10.0,0,0); //Casa NegruraNoob
    Create3DTextLabel("Casa De NegruraNoob[Pulsa {CCFF00} F {FFFFFF} Para Salir]",-1,2495.827148,-1692.083618,1014.742187,10.0,0,0); //Casa NegruraNoob
    Create3DTextLabel("Casa De El Admin Verdesito Ariel[Pulsa {CCFF00} F {FFFFFF} Para Entrar]",-1,1259.636718,-785.444091,92.031250,10.0,0,0); //Casa Ariel Entrada
    Create3DTextLabel("Zona De Carga[Pulsa {CCFF00} Y {FFFFFF} Para Cargar Tu Camion]",-1,CPFEDEXSALIDA,10.0,0,0); //Zona De Carga Fedex
    Create3DTextLabel("Casa De El Admin Verdesito[Pulsa {CCFF00} F {FFFFFF} Para Salir]",-1,1260.648559,-785.406738,1091.906250,10.0,1,0); //Casa Ariel
    Create3DTextLabel("Carcel[Usa /arrestar <ID> <minutos> <razón> ]",-1,1568.671142,-1692.713134,5.890625,10.0,0,0); //Arrestar LSPD
    Create3DTextLabel("Transportista [Pulsa {CCFF00} Y {FFFFFF} Para Tomar el trabajo]",-1,CPPEDIRTRABAJOTRANSPORTISTA,10.0,0,0); //Tomar trabajo transportista
    Create3DTextLabel("Zona de carga [Pulsa {CCFF00} Y {FFFFFF} Para Cargar tu Auto de trabajo]",-1,CPTOMARCARGA,10.0,0,0); //Zona de carga transportista
    Create3DTextLabel("FBI [Pulsa {CCFF00} F {FFFFFF} Para Entrar]",-1,EntradaFBI,10.0,0,0); //Entrada FBI
    Create3DTextLabel("FBI [Pulsa {CCFF00} F {FFFFFF} Para Salir]",-1,288.745971,169.350997,1007.171875,10.0,0,0); //Salida FBI
    Create3DTextLabel("Armario \n [Pulsa {CCFF00} Y {FFFFFF} Para Vestirte]",-1,TomarRopaFbi,10.0,0,0); //Salida FBI
    Create3DTextLabel("Hospital \n [Pulsa {CCFF00} F {FFFFFF} Para Entrar]",-1,1172.678955,-1323.328369,15.402153,10.0,0,0); //Entrada al hospital
    Create3DTextLabel("Hospital \n [Pulsa {CCFF00} F {FFFFFF} Para Salir]",-1,1145.790527,-1299.200073,701.647338,10.0,0,0); //Salida del hospital
    Create3DTextLabel("Fabrica de Armas \n [Pulsa {CCFF00} F {FFFFFF} Para Entrar]",-1,2814.782714,973.024841,10.750000,10.0,0,0); //Entrada de fabrica de armas mafia
    Create3DTextLabel("Fabrica de Armas \n [Pulsa {CCFF00} F {FFFFFF} Para Salir]",-1,2541.655517,-1304.076660,1025.070312,10.0,0,0); //Salida de fabrica de armas mafia
    Create3DTextLabel("Ayuntamiento Due?:Gobierno\n [Pulsa {CCFF00} F {FFFFFF} Para Entrar]",-1,1481.154663,-1771.711914,18.795755,10.0,0,0); //Entrada ayuntamiento
    Create3DTextLabel("Ayuntamiento Due?:Gobierno\n [Pulsa {CCFF00} F {FFFFFF} Para Salir]",-1,390.769866,173.863616,1008.382812,10.0,0,0); //Salida ayuntamiento
    Create3DTextLabel("Ayuntamiento \n [Pulsa{CCFF00} Y {FFFFFF}Para crear un DNI.]",-1,361.829895,173.703338,1008.382812,10.0,0,0); //Sacarse DNI
    Create3DTextLabel("Botiquines \n [Pulsa {CCFF00} Y {FFFFFF} Precio:1500$]",-1, 1146.484375,-1298.947875,705.274719,10.0,0,0); //Comprar botiquines.
    Create3DTextLabel("Vestimenta LSPD \n [Pulsa {CCFF00} Y {FFFFFF} Para Vestirte]",-1,261.592681,108.555244,1004.617187,10.0,0,0); //Vestimenta LSPD
    Create3DTextLabel("Reuniones LSPD \n [Pulsa {CCFF00} F {FFFFFF} Para Salir] ",-1,1038.531372,0.111030,1001.284484,10.0,0,0); //Salida Sala de reuniones LSPD
    Create3DTextLabel("Reuniones LSPD \n [Pulsa {CCFF00} F {FFFFFF} Para Entrar] ",-1,1564.825683,-1666.947631,28.394580,10.0,0,0); //Entrada Sala de reuniones LSPD
    Create3DTextLabel("Casa de Junior_Lucena\n [Pulsa {CCFF00} F {FFFFFF} Para Entrar] ",-1,1260.646240,-785.447387,1091.9062500,10.0,0,0); //Entrada Casa
    Create3DTextLabel("Casa de Junior_Lucena\n [Pulsa {CCFF00} F {FFFFFF} Para Salir] ",-1,1267.663208,-781.323242,1091.906250,10.0,0,0); //Salida Casa
    Create3DTextLabel("Casa de Han Seoul.\n [Pulsa {CCFF00} F {FFFFFF} Para Salir] ",-1,318.519134,1114.480468,1083.882812,10.0,0,0); //Salida Casa Marlon
    Create3DTextLabel("Casa de Han Seoul.\n [Pulsa {CCFF00} F {FFFFFF} Para Entrar] ",-1,2186.518798,-997.335083,66.468750,10.0,0,0); //Entrada Casa Marlon
    Create3DTextLabel("Servicios Hospital\n [Pulsa {CCFF00} N {FFFFFF} Para ver el menu.] ",-1, 1173.006958,-1299.851684,701.647338,10.0,0,0); //Servicio medico
    Create3DTextLabel("Garage Han Seoul\n [Pulsa {CCFF00} Y {FFFFFF}Para entrar] ",-1,2175.614501, -992.123779,63.017417,10.0,0,0); //Entrada Garage Han_Seoul
    Create3DTextLabel("Garage Han Seoul\n [Pulsa {CCFF00} Y {FFFFFF}Para Salir] ",-1,2190.6787, -931.5745, 39.9018,10.0,0,0); //Salida Garage Han_Seoul
    Create3DTextLabel("Medicamentos\n [Pulsa {CCFF00} Y {FFFFFF}Para comprar 5 por:1000$] ",-1,1146.491821,-1300.397338,705.274719,10.0,0,0); //Salida Garage Han_Seoul 
    Create3DTextLabel("ATM 1 \n [Pulsa {CCFF00} Y {FFFFFF}Para Interactuar] ",-1,1091.898803,-1181.286865,25.232538,10.0,0,0); //ATM 1
    Create3DTextLabel("ATM 2 \n [Pulsa {CCFF00} Y {FFFFFF}Para Interactuar] ",-1,1090.398315,-1181.040771,25.232538,10.0,0,0); //ATM 2
    Create3DTextLabel("ATM 3 \n [Pulsa {CCFF00} Y {FFFFFF}Para Interactuar] ",-1,1088.818359,-1181.253295,25.232538,10.0,0,0); //ATM 3
}

stock LoadGMVehicles()
{
    ///////////////////////////////////AUTOS POLICIA//////////////////////////////////////////////////
    CreateVehicle(596, 1591.5391, -1711.4823, 5.5897, 0.0000, -1, -1, 100);
    CreateVehicle(596, 1587.2688, -1711.5784, 5.5921, 0.0000, -1, -1, 100);
    CreateVehicle(596, 1583.6097, -1711.4058, 5.2890, 0.0000, -1, -1, 100);
    CreateVehicle(596, 1578.3536, -1711.5526, 5.4923, 0.0000, -1, -1, 100);
    CreateVehicle(596, 1574.3301, -1711.3544, 5.4873, 0.0000, -1, -1, 100);
    CreateVehicle(596, 1570.1345, -1710.9532, 5.5025, 0.0000, -1, -1, 100);
    CreateVehicle(598, 1602.7147, -1700.2241, 5.5878, 90.5342, -1, -1, 100);
    CreateVehicle(598, 1602.8470, -1684.0829, 5.5878, 90.5342, -1, -1, 100);
    CreateVehicle(598, 1602.7076, -1688.3584, 5.5878, 90.5342, -1, -1, 100);
    CreateVehicle(598, 1602.8015, -1692.1022, 5.5878, 90.5342, -1, -1, 100);
    CreateVehicle(598, 1602.7806, -1696.4355, 5.5878, 90.5342, -1, -1, 100);
    CreateVehicle(598, 1602.9198, -1704.2463, 5.5707, 92.3306, -1, -1, 100);
    AddStaticVehicleEx(413, 2499.3904, -2558.8845, 13.6565, 90.0465, -1, -1, 100); //Autos FEDEX
    AddStaticVehicleEx(413, 2499.7639, -2582.9714, 13.6565, 90.0465, -1, -1, 100); //Autos FEDEX
    AddStaticVehicleEx(413, 2499.6453, -2577.4753, 13.6565, 90.0465, -1, -1, 100); //Autos FEDEX
    AddStaticVehicleEx(413, 2499.5608, -2572.2793, 13.6565, 90.0465, -1, -1, 100); //Autos FEDEX
    AddStaticVehicleEx(413, 2499.4854, -2567.2778, 13.6565, 90.0465, -1, -1, 100); //Autos FEDEX
    AddStaticVehicleEx(413, 2499.3584, -2562.9963, 13.6565, 90.0465, -1, -1, 100); //Autos FEDEX
    AddStaticVehicleEx(573, 620.0924, 814.2216, -42.4560, 348.2696, -1, -1, 100);  //Autos Transportista
    AddStaticVehicleEx(573, 628.8099, 811.3769, -42.5289, 0.0000, -1, -1, 100); //Autos Transportista
    AddStaticVehicleEx(573, 657.2218, 871.5212, -40.9524, 322.7552, -1, -1, 100); //Autos Transportista
    AddStaticVehicleEx(578, 524.9443, 846.1005, -42.2719, 255.4962, -1, -1, 100); //Autos Transportista
    AddStaticVehicleEx(578, 679.5511, 839.3977, -42.5051, 58.4523, -1, -1, 100); //Autos Transportista
    return 1;
}

stock IsPlayerInRangeOfDoor(playerid)
{
    for(new i; i < MAX_HOUSES; i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, HouseInfo[i][xex], HouseInfo[i][yex], HouseInfo[i][zex]))
        {
            return true;
        }
    }
    return false;
}

stock GetNearbyDoor(playerid)
{
    for(new i; i < MAX_HOUSES; i ++)
    {
        if(IsPlayerInRangeOfDoor(playerid) || IsPlayerInRangeOfOutDoor(playerid))
        {
            return i;
        }
    }
    return -1;
}

stock IsPlayerInRangeOfOutDoor(playerid)
{
    for(new i; i < MAX_HOUSES; i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, HouseInfo[i][xin], HouseInfo[i][yin], HouseInfo[i][zin]))
        {
            return true;
        }
    }
    return false;
}

stock SetPlayerInHouse(playerid)
{
    for(new i; i < MAX_HOUSES; i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, HouseInfo[i][xex], HouseInfo[i][yex], HouseInfo[i][zex]))
        {
            if(!HouseInfo[i][Locked])
            {
                SetPlayerInterior(playerid, HouseInfo[i][interior]);
                SetPlayerVirtualWorld(playerid, HouseInfo[i][virtualworld]);
                SetPlayerPos(playerid, HouseInfo[i][xin], HouseInfo[i][yin], HouseInfo[i][zin]);
                return SetPlayerInInteriorOrExterior(playerid);
            }
            else return TextdrawError(playerid, "La puerta esta cerrada.");
        }
    }
    return 0;
}

stock LoadPickups()
{
    //-------------------------------------------------------------Pickups---------------------------------------------------------------------//
    CreatePickup(1210, 1, 2509.668212,-2638.108886,13.796875); // Tomar job FedEX
    CreatePickup(1240, 1,  1173.006958,-1299.851684,701.647338); // Servicio medico.
    CreatePickup(1318,1,1172.678955,-1323.328369,15.402153,0); // HP
    CreatePickup(1318,1,1145.790527,-1299.200073,701.647338,0); // HP
    CreatePickup(1318,1,CPSALIDAFABRICA,0);
    CreatePickup(1247,1,ARRESTAR,0); // Arrestar LSPD
    CreatePickup(1318,1,CPENTRADAFABRICA,0);
    CreatePickup(1239,1,CPCREARARMAS,0);
    CreatePickup(1239,1,CPTRABAJOARMERO,0);
    CreatePickup(1318,1,CPFEDEXSALIDA,0); //Zona De Carga Fedex
    CreatePickup(1239,1,CPPEDIRTRABAJOTRANSPORTISTA,0); // Trabajo Transportista
    CreatePickup(1318,1,CPTOMARCARGA,0); //Zona De carga de Transportista
    return 1;
}

stock SetPlayerOutHouse(playerid)
{
    for(new i; i < MAX_HOUSES; i ++)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, HouseInfo[i][xin], HouseInfo[i][yin], HouseInfo[i][zin]))
        {
            if(!HouseInfo[i][Locked])
            {
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, 0);
                SetPlayerPos(playerid, HouseInfo[i][xex], HouseInfo[i][yex], HouseInfo[i][zex]);
                return SetPlayerInInteriorOrExterior(playerid);
            }
            else return TextdrawError(playerid, "La puerta esta cerrada.");
        }
    }
    return 1;
}
stock ConnectDB()
{
    printf("Iniciando conexion MySQL: (Host: '%s', Usuario: '%s', Clave: '%s', Base de Datos: '%s')", MySQL_HOST, MySQL_USER, MySQL_PASSWORD, MySQL_DATABASE);
    new MySQLOpt: option_id = mysql_init_options();
    mysql_set_option(option_id, AUTO_RECONNECT, true); // Por si acaso se pierde la conexión volverá a reconectar o intentará almenos.
    MySQL = mysql_connect(MySQL_HOST, MySQL_USER, MySQL_PASSWORD, MySQL_DATABASE, option_id);
    if(MySQL == MYSQL_INVALID_HANDLE)
    {
        print("--------------------------------");
        print("[LatinRpMYSQL]: Error en la syntaxis de conexion.");
        print("--------------------------------");
    }
    if(mysql_errno(MySQL) == 0)
    {
        print("--------------------------------");
        print("[LatinRpMYSQL]: Conexion correcta con la base de datos.");
        print("--------------------------------");
    }
    else
    {
        print("--------------------------------");
        print("[LatinRpMYSQL]: Conexion fallida con la base de datos.");
        print("--------------------------------");
    }
    mysql_log(ALL); 
    return 1;
}

stock NoNeed(playerid)
{
	SCM(playerid,-1,"[Doctor] No necesitas que te internen.");
    TogglePlayerControllable(playerid, true);
    return 1;
}
/*
-------------------------------------------------------------------
------------------------Publics Nativos----------------------------
-------------------------------------------------------------------
*/
public OnGameModeInit()
{
    /*configuracion del servidor*/
    UsePlayerPedAnims();
    DisableInteriorEnterExits();
    ShowNameTags(1);
    SetNameTagDrawDistance(40.0);
    EnableStuntBonusForAll(0);
    SetWeather(10);
    SetWorldTime(15);
    ShowPlayerMarkers(0);
    ManualVehicleEngineAndLights();
    SetGameModeText(SERVER_GAMEMODE);
    SendRconCommand("hostname "SERVER_HOSTNAME"");
    SendRconCommand("language "SERVER_LANGUAGE"");
    SendRconCommand("weburl "SERVER_WEBSITE"");
    SendRconCommand("minconnectiontime 10000");
    SendRconCommand("ackslimit 5000");
    SendRconCommand("messageslimit 100");
    ConnectDB();
    //--Cargado de estructuras--//
    LoadHouses(); 
    LoadPickups(); 
    LoadTextDraws();
    LoadLabels();
    LoadGMVehicles();
    LoadGraffs();
    CreateGangZones();
    /* Puertas Funcionales*/
    PortonCasa = CreateObject(3037, 2256.61255, -1024.01550, 60.63360,   0.00000, 0.00000, 46.49998);
    PuertaGarage = CreateObject(1500, 1582.52600, -1637.88293, 12.35600,   0.00000, 0.00000, 360.00000);
    PortonLSPD = CreateObject(3037, 1589.67676, -1638.26611, 14.42560,   0.00000, 0.00000, 90.00000);
    BallaLSPD = CreateObject(2920, 1544.68286, -1630.89783, 13.31370,   -90.00000, 0.00000, 0.00000);
    PortonMafia = CreateObject(3037, 2777.11548, 913.25513, 11.94280,   0.00000, 0.00000, 0.00000);
    ///////////////////Mini Mapeos Importantes ///////////////////////////
    CreateObject(1267, 1805.89990, -1902.79688, 28.35285,   0.00000, 0.00000, 0.00000); // /ad1
    ///////////////////////////////////////Textos////////////////////////////////////
    TextLSPD = CreateObject(4731, 1553.49927, -1675.62207, 23.52857,   0.00000, 0.00000, 300.57324);
    SetObjectMaterialText(TextLSPD, " {0000FF}Policia {FFFFFF}Venezolana", 0, OBJECT_MATERIAL_SIZE_256x256,
    "Comic Sans MS", 28, 0, 0xFFFF8200, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
    TextFbi = CreateObject(19353, 1218.84900, -1811.38196, 23.29781,   0.00000, 0.00000, 269.20154);
    SetObjectMaterialText(TextFbi, " {0000FF}FBI", 0, OBJECT_MATERIAL_SIZE_256x256,
    "Comic Sans MS", 28, 0, 0xFFFF8200, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
    TextAD = CreateObject(4731, 1807.64185, -1902.21741, 33.94454,   0.00000, 0.00000, 127.42334);
    SetObjectMaterialText(TextAD, "No hay anuncios...", 0, OBJECT_MATERIAL_SIZE_512x256,
    "Calibri", 28, 0, 0xFFFF8200, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
    return 1;
}

public OnGameModeExit()
{
    TextDrawDestroy(latinrp);
    printf("saliendo...");
    /* Guardando estructuras */
    SaveHouses();
    // SaveGangs();
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    return 1;
}

public OnPlayerConnect(playerid)
{
    /* Textdraws Players */
    LoadPlayerTextdraws(playerid);
    /* Cadaveres */
    SetPlayerColor(playerid, 0xFFFFFF00);
    Actors[playerid] = -1;
    //-.-.-.-.-.-.-.-.-.-.-..-.-.-.-.-.-.-.-.-.-.-.-.-..--.-.-.-.-.-.-.-.-.-.-.-//
    TextDrawShowForPlayer(playerid, Spawn0);
    TextDrawShowForPlayer(playerid, Spawn1);
    FPS[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    PlayAudioStreamForPlayer(playerid,"https://sndup.net/4xhd/Bienvenida+a+LatinRP.wav");
    ClearPlayerChat(playerid);
    Chequear(playerid);
    new bienvenida[41], name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    if(strfindex(name, '_') == 0 && strcmp(name, "Negrura", true) == 1)
    {
        new msgadmins[128],msgplayerid[128];
        format(msgplayerid, sizeof(msgplayerid), "%s es un nombre antirol utiliza el formato del sv ejemplo: Daniel_Zamora", name);
        SendClientMessage(playerid,-1,msgplayerid);
        format(msgadmins, sizeof(msgadmins), "%s fue kickeado. Razon: Nombre Anti Rol.", name);
        SendMessageToAdmin(msgadmins);
        Kick(playerid);
        return 1;
    }
    RemoveBuildingForPlayer(playerid, 713, 1304.7734, -1839.8672, 12.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 4055, 1394.3594, -1620.6641, 32.1484, 0.25);
    RemoveBuildingForPlayer(playerid, 4220, 1370.6406, -1643.4453, 33.1797, 0.25);
    RemoveBuildingForPlayer(playerid, 4006, 1394.3594, -1620.6641, 32.1484, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4453, -1713.3047, 14.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1709.6406, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.2969, -1702.6016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1693.3906, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1689.9844, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1687.1016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1664.6250, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1658.3438, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1661.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4766, -1648.4531, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1642.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.7422, -1638.9141, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1879.9922, -1879.8906, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1885.2578, -1879.8984, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1864.1797, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1869.4609, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 1874.7344, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 1890.5234, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 4983, 1961.0313, -1871.4063, 23.7734, 0.25);
    RemoveBuildingForPlayer(playerid, 5134, 2045.4922, -1903.6172, 16.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 1525, 2065.4375, -1897.2344, 13.6094, 0.25);
    RemoveBuildingForPlayer(playerid, 5321, 2045.4922, -1903.6172, 16.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 5374, 2085.2813, -1909.7109, 23.0000, 0.25);
    RemoveBuildingForPlayer(playerid, 955, 2060.1172, -1897.6406, 12.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 5935, 1120.1563, -1303.4531, 18.5703, 0.25);
    RemoveBuildingForPlayer(playerid, 5937, 1093.1406, -1170.4063, 42.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 1107.5313, -1163.5000, 37.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 5764, 1065.1406, -1270.5781, 25.7109, 0.25);
    RemoveBuildingForPlayer(playerid, 5768, 1093.1406, -1170.4063, 42.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 5770, 1094.2031, -1168.6875, 29.1406, 0.25);
    RemoveBuildingForPlayer(playerid, 1297, 1092.6563, -1154.1641, 26.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 617, 1178.6016, -1332.0703, 12.8906, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1353.5000, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1343.2656, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 5737, 1120.1563, -1303.4531, 18.5703, 0.25);
    RemoveBuildingForPlayer(playerid, 618, 1177.7344, -1315.6641, 13.2969, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.8125, -1292.9141, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.8125, -1303.1484, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 1297, 1190.7734, -1320.8594, 15.9453, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1107.5313, -1163.5000, 37.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 3731, 1046.0234, -647.8516, 121.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 3598, 1046.0234, -647.8516, 121.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 13245, 666.7109, -565.1328, 17.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 13484, 738.3984, -553.9844, 21.9609, 0.25);
    RemoveBuildingForPlayer(playerid, 12854, 666.4922, -571.1797, 17.3125, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 630.7266, -578.7734, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 12853, 666.7109, -565.1328, 17.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 780, 628.1953, -557.3438, 15.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 630.2188, -564.2500, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 629.5781, -547.2188, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 780, 604.0156, -542.3438, 15.0703, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 169.9688, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 170.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 170.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 170.6016, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.2813, 171.3047, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 171.5469, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 170.9453, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 171.9844, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3203, 173.4453, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 211.3828, 174.2344, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 215.2188, 172.3125, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 174.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 172.9609, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 174.0234, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 172.6172, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.3203, 175.4688, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 175.5938, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 175.0000, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 218.1484, 174.5781, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.2969, 162.9531, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.3203, 167.1172, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3203, 160.9297, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 161.6875, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 163.0156, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3125, 165.0938, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 165.8281, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3047, 169.2813, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 167.1484, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 162.5078, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 163.2813, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 164.5547, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 165.2969, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 215.2188, 166.8516, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 167.3359, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 164.3203, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 162.3047, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 166.3594, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 162.9375, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 164.9609, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 166.9375, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 5639, 2184.9844, -1054.7813, 49.3906, 0.25);
    RemoveBuildingForPlayer(playerid, 713, 1304.7734, -1839.8672, 12.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 4055, 1394.3594, -1620.6641, 32.1484, 0.25);
    RemoveBuildingForPlayer(playerid, 4220, 1370.6406, -1643.4453, 33.1797, 0.25);
    RemoveBuildingForPlayer(playerid, 4006, 1394.3594, -1620.6641, 32.1484, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4453, -1713.3047, 14.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1709.6406, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.2969, -1702.6016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1693.3906, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1689.9844, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1687.1016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1664.6250, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1658.3438, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1661.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4766, -1648.4531, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1642.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.7422, -1638.9141, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1879.9922, -1879.8906, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1885.2578, -1879.8984, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1864.1797, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1869.4609, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 1874.7344, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 1890.5234, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 4983, 1961.0313, -1871.4063, 23.7734, 0.25);
    RemoveBuildingForPlayer(playerid, 5134, 2045.4922, -1903.6172, 16.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 1525, 2065.4375, -1897.2344, 13.6094, 0.25);
    RemoveBuildingForPlayer(playerid, 5321, 2045.4922, -1903.6172, 16.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 5374, 2085.2813, -1909.7109, 23.0000, 0.25);
    RemoveBuildingForPlayer(playerid, 955, 2060.1172, -1897.6406, 12.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 5935, 1120.1563, -1303.4531, 18.5703, 0.25);
    RemoveBuildingForPlayer(playerid, 5937, 1093.1406, -1170.4063, 42.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 1107.5313, -1163.5000, 37.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 5764, 1065.1406, -1270.5781, 25.7109, 0.25);
    RemoveBuildingForPlayer(playerid, 5768, 1093.1406, -1170.4063, 42.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 5770, 1094.2031, -1168.6875, 29.1406, 0.25);
    RemoveBuildingForPlayer(playerid, 1297, 1092.6563, -1154.1641, 26.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 617, 1178.6016, -1332.0703, 12.8906, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1353.5000, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1343.2656, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 5737, 1120.1563, -1303.4531, 18.5703, 0.25);
    RemoveBuildingForPlayer(playerid, 618, 1177.7344, -1315.6641, 13.2969, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.8125, -1292.9141, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.8125, -1303.1484, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 1297, 1190.7734, -1320.8594, 15.9453, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1107.5313, -1163.5000, 37.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 3731, 1046.0234, -647.8516, 121.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 3598, 1046.0234, -647.8516, 121.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 13245, 666.7109, -565.1328, 17.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 13484, 738.3984, -553.9844, 21.9609, 0.25);
    RemoveBuildingForPlayer(playerid, 12854, 666.4922, -571.1797, 17.3125, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 630.7266, -578.7734, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 12853, 666.7109, -565.1328, 17.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 780, 628.1953, -557.3438, 15.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 630.2188, -564.2500, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 629.5781, -547.2188, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 780, 604.0156, -542.3438, 15.0703, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 169.9688, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 170.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 170.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 170.6016, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.2813, 171.3047, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 171.5469, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 170.9453, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 171.9844, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3203, 173.4453, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 211.3828, 174.2344, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 215.2188, 172.3125, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 174.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 172.9609, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 174.0234, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 172.6172, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.3203, 175.4688, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 175.5938, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 175.0000, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 218.1484, 174.5781, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.2969, 162.9531, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.3203, 167.1172, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3203, 160.9297, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 161.6875, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 163.0156, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3125, 165.0938, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 165.8281, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3047, 169.2813, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 167.1484, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 162.5078, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 163.2813, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 164.5547, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 165.2969, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 215.2188, 166.8516, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 167.3359, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 164.3203, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 162.3047, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 166.3594, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 162.9375, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 164.9609, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 166.9375, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 713, 1304.7734, -1839.8672, 12.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 4055, 1394.3594, -1620.6641, 32.1484, 0.25);
    RemoveBuildingForPlayer(playerid, 4220, 1370.6406, -1643.4453, 33.1797, 0.25);
    RemoveBuildingForPlayer(playerid, 4006, 1394.3594, -1620.6641, 32.1484, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4453, -1713.3047, 14.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1709.6406, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.2969, -1702.6016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1693.3906, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1689.9844, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1687.1016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1664.6250, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1658.3438, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1661.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4766, -1648.4531, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1642.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.7422, -1638.9141, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1879.9922, -1879.8906, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1885.2578, -1879.8984, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1864.1797, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1869.4609, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 1874.7344, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 1890.5234, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 4983, 1961.0313, -1871.4063, 23.7734, 0.25);
    RemoveBuildingForPlayer(playerid, 5134, 2045.4922, -1903.6172, 16.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 1525, 2065.4375, -1897.2344, 13.6094, 0.25);
    RemoveBuildingForPlayer(playerid, 5321, 2045.4922, -1903.6172, 16.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 5374, 2085.2813, -1909.7109, 23.0000, 0.25);
    RemoveBuildingForPlayer(playerid, 955, 2060.1172, -1897.6406, 12.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 5935, 1120.1563, -1303.4531, 18.5703, 0.25);
    RemoveBuildingForPlayer(playerid, 5937, 1093.1406, -1170.4063, 42.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 1107.5313, -1163.5000, 37.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 5764, 1065.1406, -1270.5781, 25.7109, 0.25);
    RemoveBuildingForPlayer(playerid, 5768, 1093.1406, -1170.4063, 42.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 5770, 1094.2031, -1168.6875, 29.1406, 0.25);
    RemoveBuildingForPlayer(playerid, 1297, 1092.6563, -1154.1641, 26.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 617, 1178.6016, -1332.0703, 12.8906, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1353.5000, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1343.2656, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 5737, 1120.1563, -1303.4531, 18.5703, 0.25);
    RemoveBuildingForPlayer(playerid, 618, 1177.7344, -1315.6641, 13.2969, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.8125, -1292.9141, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.8125, -1303.1484, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 1297, 1190.7734, -1320.8594, 15.9453, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1107.5313, -1163.5000, 37.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 3731, 1046.0234, -647.8516, 121.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 3598, 1046.0234, -647.8516, 121.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 13245, 666.7109, -565.1328, 17.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 13484, 738.3984, -553.9844, 21.9609, 0.25);
    RemoveBuildingForPlayer(playerid, 12854, 666.4922, -571.1797, 17.3125, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 630.7266, -578.7734, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 12853, 666.7109, -565.1328, 17.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 780, 628.1953, -557.3438, 15.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 630.2188, -564.2500, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 629.5781, -547.2188, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 780, 604.0156, -542.3438, 15.0703, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 169.9688, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 170.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 170.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 170.6016, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.2813, 171.3047, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 171.5469, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 170.9453, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 171.9844, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3203, 173.4453, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 211.3828, 174.2344, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 215.2188, 172.3125, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 174.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 172.9609, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 174.0234, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 172.6172, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.3203, 175.4688, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 175.5938, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 175.0000, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 218.1484, 174.5781, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.2969, 162.9531, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.3203, 167.1172, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3203, 160.9297, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 161.6875, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 163.0156, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3125, 165.0938, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 165.8281, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3047, 169.2813, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 167.1484, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 162.5078, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 163.2813, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 164.5547, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 165.2969, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 215.2188, 166.8516, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 167.3359, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 164.3203, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 162.3047, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 166.3594, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 162.9375, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 164.9609, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 166.9375, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 713, 1304.7734, -1839.8672, 12.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 4055, 1394.3594, -1620.6641, 32.1484, 0.25);
    RemoveBuildingForPlayer(playerid, 4220, 1370.6406, -1643.4453, 33.1797, 0.25);
    RemoveBuildingForPlayer(playerid, 4006, 1394.3594, -1620.6641, 32.1484, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4453, -1713.3047, 14.4297, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1709.6406, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.2969, -1702.6016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1693.3906, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1689.9844, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1687.1016, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.6016, -1664.6250, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1546.8672, -1658.3438, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1547.5703, -1661.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.4766, -1648.4531, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1541.4531, -1642.0313, 13.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.7422, -1638.9141, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1879.9922, -1879.8906, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1885.2578, -1879.8984, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1864.1797, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, 1869.4609, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 1874.7344, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 1890.5234, -1879.6641, 13.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 4983, 1961.0313, -1871.4063, 23.7734, 0.25);
    RemoveBuildingForPlayer(playerid, 5134, 2045.4922, -1903.6172, 16.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 1525, 2065.4375, -1897.2344, 13.6094, 0.25);
    RemoveBuildingForPlayer(playerid, 5321, 2045.4922, -1903.6172, 16.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 5374, 2085.2813, -1909.7109, 23.0000, 0.25);
    RemoveBuildingForPlayer(playerid, 955, 2060.1172, -1897.6406, 12.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 5935, 1120.1563, -1303.4531, 18.5703, 0.25);
    RemoveBuildingForPlayer(playerid, 5937, 1093.1406, -1170.4063, 42.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 1107.5313, -1163.5000, 37.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 5764, 1065.1406, -1270.5781, 25.7109, 0.25);
    RemoveBuildingForPlayer(playerid, 5768, 1093.1406, -1170.4063, 42.4453, 0.25);
    RemoveBuildingForPlayer(playerid, 5770, 1094.2031, -1168.6875, 29.1406, 0.25);
    RemoveBuildingForPlayer(playerid, 1297, 1092.6563, -1154.1641, 26.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1353.5000, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1184.0078, -1343.2656, 12.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 5737, 1120.1563, -1303.4531, 18.5703, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1107.5313, -1163.5000, 37.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 3731, 1046.0234, -647.8516, 121.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 3598, 1046.0234, -647.8516, 121.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 13245, 666.7109, -565.1328, 17.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 13484, 738.3984, -553.9844, 21.9609, 0.25);
    RemoveBuildingForPlayer(playerid, 12854, 666.4922, -571.1797, 17.3125, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 630.7266, -578.7734, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 12853, 666.7109, -565.1328, 17.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 780, 628.1953, -557.3438, 15.3359, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 630.2188, -564.2500, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 781, 629.5781, -547.2188, 15.1328, 0.25);
    RemoveBuildingForPlayer(playerid, 780, 604.0156, -542.3438, 15.0703, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 169.9688, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 170.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 170.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 170.6016, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.2813, 171.3047, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 171.5469, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 170.9453, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 171.9844, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3203, 173.4453, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 211.3828, 174.2344, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 215.2188, 172.3125, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 174.2266, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 172.9609, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 174.0234, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 172.6172, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.3203, 175.4688, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 175.5938, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 175.0000, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 218.1484, 174.5781, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.2969, 162.9531, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 210.3203, 167.1172, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3203, 160.9297, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 161.6875, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 163.0156, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3125, 165.0938, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 165.8281, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2193, 211.3047, 169.2813, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 210.9844, 167.1484, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 162.5078, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 163.2813, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 215.5625, 164.5547, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 165.2969, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2356, 215.2188, 166.8516, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 216.1953, 167.3359, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 164.3203, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 162.3047, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 2172, 217.1875, 166.3594, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 162.9375, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 164.9609, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 1806, 217.8516, 166.9375, 1002.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 8548, 2750.0703, 907.5859, 11.0000, 0.25);
    RemoveBuildingForPlayer(playerid, 8960, 2787.0000, 953.4375, 13.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 8961, 2797.6250, 885.4531, 13.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 8962, 2797.6250, 865.4063, 13.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 8963, 2885.5313, 919.2266, 13.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 1365, 2801.0703, 858.1016, 10.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 1374, 2757.9844, 907.6016, 11.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 1219, 2800.9453, 879.3047, 9.9766, 0.25);
    RemoveBuildingForPlayer(playerid, 1219, 2800.9453, 876.6406, 9.9766, 0.25);
    RemoveBuildingForPlayer(playerid, 8886, 2797.6250, 865.4063, 13.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 1219, 2806.6094, 892.3828, 9.9766, 0.25);
    RemoveBuildingForPlayer(playerid, 8885, 2797.6250, 885.4531, 13.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 1373, 2757.3281, 909.1953, 12.3750, 0.25);
    RemoveBuildingForPlayer(playerid, 1294, 2747.6328, 917.4219, 14.3047, 0.25);
    RemoveBuildingForPlayer(playerid, 1373, 2773.9688, 919.2500, 12.0781, 0.25);
    RemoveBuildingForPlayer(playerid, 1374, 2773.3125, 920.8438, 10.8672, 0.25);
    RemoveBuildingForPlayer(playerid, 8883, 2885.5313, 919.2266, 13.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 8884, 2787.0000, 953.4375, 13.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 1231, 2801.9219, 933.8281, 12.7109, 0.25);
    RemoveBuildingForPlayer(playerid, 1231, 2834.5078, 933.8281, 12.7109, 0.25);
    RemoveBuildingForPlayer(playerid, 1365, 2849.5391, 945.0156, 10.7813, 0.25);
    RemoveBuildingForPlayer(playerid, 1294, 2747.6328, 917.4219, 14.3047, 0.25);
    RemoveBuildingForPlayer(playerid, 1373, 2773.9688, 919.2500, 12.0781, 0.25);
    RemoveBuildingForPlayer(playerid, 1374, 2773.3125, 920.8438, 10.8672, 0.25);
    RemoveBuildingForPlayer(playerid, 16085, 627.8672, 850.2734, -42.7734, 0.25);
    RemoveBuildingForPlayer(playerid, 16309, 566.6484, 874.4844, -39.5313, 0.25);
    RemoveBuildingForPlayer(playerid, 16310, 581.3750, 875.6094, -43.9609, 0.25);
    RemoveBuildingForPlayer(playerid, 16311, 585.8438, 869.6328, -39.3672, 0.25);
    RemoveBuildingForPlayer(playerid, 16325, 590.2969, 870.2734, -44.2656, 0.25);
    RemoveBuildingForPlayer(playerid, 4064, 1571.6016, -1675.7500, 35.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 1538.5234, -1609.8047, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 3976, 1571.6016, -1675.7500, 35.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1538.5234, -1609.8047, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 1722, 228.8203, 148.3281, 1002.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 4063, 1578.4688, -1676.4219, 13.0703, 0.25);
    RemoveBuildingForPlayer(playerid, 4064, 1571.6016, -1675.7500, 35.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 4129, 1595.0000, -1603.0234, 27.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 4130, 1595.0000, -1603.0234, 27.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 1261, 1638.5859, -1721.4766, 27.9922, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 1538.5234, -1609.8047, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 1565.4141, -1722.3125, 25.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 1266, 1648.0156, -1795.0703, 25.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 4229, 1597.9063, -1699.7500, 30.2109, 0.25);
    RemoveBuildingForPlayer(playerid, 4230, 1597.9063, -1699.7500, 30.2109, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1565.4141, -1722.3125, 25.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 3975, 1578.4688, -1676.4219, 13.0703, 0.25);
    RemoveBuildingForPlayer(playerid, 3976, 1571.6016, -1675.7500, 35.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1267, 1638.5859, -1721.4766, 27.9922, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1648.0156, -1795.0703, 25.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 647, 1541.7422, -1638.9141, 14.4375, 0.25);
    RemoveBuildingForPlayer(playerid, 1260, 1538.5234, -1609.8047, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1703.4688, -1846.7109, 10.8047, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1710.8359, -1846.7109, 10.8047, 0.25);
    RemoveBuildingForPlayer(playerid, 620, 1721.1563, -1846.7109, 10.8047, 0.25);
    RemoveBuildingForPlayer(playerid, 5024, 1748.8438, -1883.0313, 14.1875, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 1774.7578, -1901.5391, 16.3750, 0.25);
    RemoveBuildingForPlayer(playerid, 3686, 2169.1172, -2276.5859, 15.9063, 0.25);
    RemoveBuildingForPlayer(playerid, 3686, 2195.0859, -2216.8438, 15.9063, 0.25);
    RemoveBuildingForPlayer(playerid, 3686, 2220.7813, -2261.0547, 15.9063, 0.25);
    RemoveBuildingForPlayer(playerid, 3686, 2464.3047, -2617.0156, 16.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 708, 2798.0547, -1993.2734, 12.3047, 0.25);
    RemoveBuildingForPlayer(playerid, 3744, 2437.2109, -2490.0938, 15.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 3744, 2179.9219, -2334.8516, 14.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 3744, 2165.2969, -2317.5000, 14.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 3744, 2193.2578, -2286.2891, 14.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 3744, 2183.1719, -2237.2734, 14.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 3744, 2174.6406, -2215.6563, 15.1016, 0.25);
    RemoveBuildingForPlayer(playerid, 3744, 2193.0625, -2196.6406, 15.1016, 0.25);
    RemoveBuildingForPlayer(playerid, 5304, 2197.1875, -2325.5391, 27.5313, 0.25);
    RemoveBuildingForPlayer(playerid, 5305, 2198.8516, -2213.9219, 14.8828, 0.25);
    RemoveBuildingForPlayer(playerid, 3747, 2234.3906, -2244.8281, 14.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 3747, 2226.9688, -2252.1406, 14.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 3747, 2219.4219, -2259.5234, 14.8828, 0.25);
    RemoveBuildingForPlayer(playerid, 3747, 2212.0938, -2267.0703, 14.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 3747, 2204.6328, -2274.4141, 14.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 5325, 2488.9922, -2509.2578, 18.5156, 0.25);
    RemoveBuildingForPlayer(playerid, 3769, 2464.1250, -2571.6328, 15.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 3769, 2400.9063, -2577.3359, 15.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 3625, 2400.9063, -2577.3359, 15.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 3574, 2179.9219, -2334.8516, 14.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 5126, 2197.1875, -2325.5391, 27.5313, 0.25);
    RemoveBuildingForPlayer(playerid, 3574, 2165.2969, -2317.5000, 14.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2184.6250, -2308.3281, 17.4766, 0.25);
    RemoveBuildingForPlayer(playerid, 3578, 2165.0703, -2288.9688, 13.2578, 0.25);
    RemoveBuildingForPlayer(playerid, 3574, 2193.2578, -2286.2891, 14.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 3627, 2169.1172, -2276.5859, 15.9063, 0.25);
    RemoveBuildingForPlayer(playerid, 3577, 2131.3438, -2274.6641, 14.4688, 0.25);
    RemoveBuildingForPlayer(playerid, 3569, 2204.6328, -2274.4141, 14.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 3577, 2126.8516, -2270.4453, 14.4688, 0.25);
    RemoveBuildingForPlayer(playerid, 5129, 2148.7813, -2269.6406, 17.3281, 0.25);
    RemoveBuildingForPlayer(playerid, 5130, 2139.8594, -2271.7813, 16.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 3631, 2140.0391, -2271.5391, 14.1016, 0.25);
    RemoveBuildingForPlayer(playerid, 3569, 2212.0938, -2267.0703, 14.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 3631, 2149.1406, -2266.9063, 12.8750, 0.25);
    RemoveBuildingForPlayer(playerid, 5260, 2161.3438, -2264.9141, 14.0156, 0.25);
    RemoveBuildingForPlayer(playerid, 3631, 2161.8516, -2264.0938, 16.3516, 0.25);
    RemoveBuildingForPlayer(playerid, 3631, 2163.3750, -2262.6875, 16.3516, 0.25);
    RemoveBuildingForPlayer(playerid, 3627, 2220.7813, -2261.0547, 15.9063, 0.25);
    RemoveBuildingForPlayer(playerid, 3569, 2219.4219, -2259.5234, 14.8828, 0.25);
    RemoveBuildingForPlayer(playerid, 3633, 2142.9141, -2256.3359, 13.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2144.2969, -2258.1484, 13.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 3631, 2142.3047, -2255.8984, 12.8750, 0.25);
    RemoveBuildingForPlayer(playerid, 5262, 2152.7109, -2256.7813, 15.2109, 0.25);
    RemoveBuildingForPlayer(playerid, 3633, 2158.0078, -2257.2656, 16.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 3633, 2167.6641, -2256.7813, 12.7500, 0.25);
    RemoveBuildingForPlayer(playerid, 3633, 2167.6641, -2256.7813, 13.7109, 0.25);
    RemoveBuildingForPlayer(playerid, 3633, 2167.6641, -2256.7813, 14.6719, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2167.8047, -2257.3516, 16.3828, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2167.1719, -2257.1250, 16.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 3577, 2170.0781, -2257.6641, 16.0391, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2169.3516, -2258.0703, 17.2422, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2168.8281, -2257.5234, 17.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 3633, 2140.3828, -2254.1016, 13.9297, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2150.6641, -2251.5547, 12.7656, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2150.2813, -2250.8516, 12.7656, 0.25);
    RemoveBuildingForPlayer(playerid, 3633, 2150.6953, -2252.9141, 16.2344, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2149.8125, -2253.3672, 16.2344, 0.25);
    RemoveBuildingForPlayer(playerid, 5261, 2152.2578, -2239.4609, 14.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 5269, 2146.3750, -2248.7969, 14.6172, 0.25);
    RemoveBuildingForPlayer(playerid, 3633, 2153.7734, -2253.0859, 14.2031, 0.25);
    RemoveBuildingForPlayer(playerid, 3633, 2154.5078, -2254.4766, 14.2109, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2158.5703, -2251.0156, 15.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 3632, 2158.0469, -2250.5078, 15.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 5132, 2163.2891, -2251.6094, 14.1406, 0.25);
    RemoveBuildingForPlayer(playerid, 5259, 2168.8438, -2246.7813, 13.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 3578, 2194.4766, -2242.8750, 13.2578, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2217.2188, -2250.3594, 16.3672, 0.25);
    RemoveBuildingForPlayer(playerid, 3569, 2226.9688, -2252.1406, 14.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 3569, 2234.3906, -2244.8281, 14.9375, 0.25);
    RemoveBuildingForPlayer(playerid, 3574, 2183.1719, -2237.2734, 14.8125, 0.25);
    RemoveBuildingForPlayer(playerid, 3577, 2160.5625, -2234.8047, 14.5625, 0.25);
    RemoveBuildingForPlayer(playerid, 3577, 2160.5781, -2234.8203, 13.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 3578, 2235.1641, -2231.8516, 13.2578, 0.25);
    RemoveBuildingForPlayer(playerid, 3574, 2174.6406, -2215.6563, 15.1016, 0.25);
    RemoveBuildingForPlayer(playerid, 3627, 2195.0859, -2216.8438, 15.9063, 0.25);
    RemoveBuildingForPlayer(playerid, 5244, 2198.8516, -2213.9219, 14.8828, 0.25);
    RemoveBuildingForPlayer(playerid, 3574, 2193.0625, -2196.6406, 15.1016, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2215.8047, -2199.2188, 16.3125, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2207.8750, -2191.2500, 16.3125, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2223.7422, -2207.1875, 16.3125, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2240.7813, -2240.8984, 16.3672, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2450.0156, -2632.7734, 16.3594, 0.25);
    RemoveBuildingForPlayer(playerid, 1306, 2469.6016, -2645.3203, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 3578, 2470.1406, -2628.2656, 13.1719, 0.25);
    RemoveBuildingForPlayer(playerid, 3627, 2464.3047, -2617.0156, 16.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2450.0156, -2604.9297, 16.3594, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2480.3281, -2588.3281, 16.3594, 0.25);
    RemoveBuildingForPlayer(playerid, 1306, 2469.6016, -2579.9844, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 3625, 2464.1250, -2571.6328, 15.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2489.3516, -2625.7109, 16.2969, 0.25);
    RemoveBuildingForPlayer(playerid, 1306, 2498.3438, -2612.6563, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2489.3516, -2566.2734, 16.2969, 0.25);
    RemoveBuildingForPlayer(playerid, 1306, 2498.3438, -2547.3203, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 1278, 2470.2734, -2539.0234, 26.6719, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2480.3281, -2536.4375, 16.3594, 0.25);
    RemoveBuildingForPlayer(playerid, 3578, 2470.1406, -2530.5547, 13.1719, 0.25);
    RemoveBuildingForPlayer(playerid, 1306, 2469.6016, -2514.6484, 19.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 3574, 2437.2109, -2490.0938, 15.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 946, 2768.1563, -2019.6172, 14.6016, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 2792.1797, -2003.7266, 13.7500, 0.25);
    RemoveBuildingForPlayer(playerid, 946, 2795.4922, -2019.6172, 14.5938, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 2802.8203, -2008.7734, 13.7500, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 2802.7266, -2003.4922, 13.7500, 0.25);
    RemoveBuildingForPlayer(playerid, 1226, 2773.9531, -1979.0859, 16.3672, 0.25);
    RemoveBuildingForPlayer(playerid, 5234, 2786.7734, -1970.0625, 20.0625, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 2794.7188, -2001.0313, 13.7500, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, 2800.0000, -2000.8906, 13.7500, 0.25);
    RemoveBuildingForPlayer(playerid, 5851, 1323.6641, -884.6328, 36.2500, 0.25);
    RemoveBuildingForPlayer(playerid, 5852, 1315.3672, -887.4688, 41.7031, 0.25);
    RemoveBuildingForPlayer(playerid, 617, 1178.6016, -1332.0703, 12.8906, 0.25);
    RemoveBuildingForPlayer(playerid, 673, 1307.0781, -904.7266, 37.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 1522, 1314.7266, -897.2656, 38.4688, 0.25);
    RemoveBuildingForPlayer(playerid, 1268, 356.2969, -1717.4766, 20.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 1268, 516.3516, -1728.4141, 25.7422, 0.25);
    RemoveBuildingForPlayer(playerid, 1268, 598.1797, -1742.0781, 27.3984, 0.25);
    RemoveBuildingForPlayer(playerid, 1268, 587.3438, -1767.2891, 17.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 6415, 154.2109, -1950.1953, 26.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 1259, 587.3438, -1767.2891, 17.8438, 0.25);
    RemoveBuildingForPlayer(playerid, 1259, 598.1797, -1742.0781, 27.3984, 0.25);
    RemoveBuildingForPlayer(playerid, 1259, 516.3516, -1728.4141, 25.7422, 0.25);
    RemoveBuildingForPlayer(playerid, 6295, 154.2109, -1950.1953, 26.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 1259, 356.2969, -1717.4766, 20.8203, 0.25);
    RemoveBuildingForPlayer(playerid, 10840, -1666.1250, -62.0781, 10.9453, 0.25);
    RemoveBuildingForPlayer(playerid, 10843, -1711.4688, -107.5703, 10.6172, 0.25);
    RemoveBuildingForPlayer(playerid, 10892, -1711.4688, -107.5703, 10.6172, 0.25);
    RemoveBuildingForPlayer(playerid, 10910, -1681.1094, -24.6797, 5.4766, 0.25);
    RemoveBuildingForPlayer(playerid, 10911, -1711.2031, -47.7109, 5.6094, 0.25);
    RemoveBuildingForPlayer(playerid, 10912, -1666.1250, -62.0781, 10.9453, 0.25);
    RemoveBuildingForPlayer(playerid, 10913, -1731.6563, -18.6719, 8.8828, 0.25);
    RemoveBuildingForPlayer(playerid, 10845, -1711.2031, -47.7109, 5.6094, 0.25);
    RemoveBuildingForPlayer(playerid, 10847, -1731.6563, -18.6719, 8.8828, 0.25);
    RemoveBuildingForPlayer(playerid, 10844, -1681.1094, -24.6797, 5.4766, 0.25);
    RemoveBuildingForPlayer(playerid, 652, -8.0234, 1232.8516, 18.3906, 0.25);
    RemoveBuildingForPlayer(playerid, 1411, 761.7266, 2037.7656, 7.2969, 0.25);
    RemoveBuildingForPlayer(playerid, 3338, -287.8672, -1570.2500, 5.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 3338, -194.4141, -1464.6953, 7.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 3338, -170.0313, -1359.1563, 1.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 3338, -113.4063, -1235.7266, 1.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 17350, -54.9922, -1130.7266, 4.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 3244, -194.4141, -1464.6953, 7.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 3244, -170.0313, -1359.1563, 1.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 3336, -128.2891, -1317.9375, 1.1016, 0.25);
    RemoveBuildingForPlayer(playerid, 3244, -113.4063, -1235.7266, 1.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -109.1641, -1181.3438, 1.6719, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -84.2422, -1180.2656, 0.8516, 0.25);
    RemoveBuildingForPlayer(playerid, 1415, -77.2188, -1188.3672, 0.8359, 0.25);
    RemoveBuildingForPlayer(playerid, 1440, -103.6875, -1172.5781, 2.2656, 0.25);
    RemoveBuildingForPlayer(playerid, 1447, -89.9297, -1133.7500, 1.3906, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -87.0547, -1132.6797, 0.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 1462, -79.2500, -1137.7188, 0.0547, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -77.4219, -1165.5547, 1.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 3285, -73.8047, -1141.4219, 1.9844, 0.25);
    RemoveBuildingForPlayer(playerid, 17072, -54.9922, -1130.7266, 4.5781, 0.25);
    RemoveBuildingForPlayer(playerid, 17073, -56.1250, -1130.1719, 4.4922, 0.25);
    RemoveBuildingForPlayer(playerid, 1462, -84.3750, -1116.0938, 0.2578, 0.25);
    RemoveBuildingForPlayer(playerid, 1447, -84.0547, -1117.2188, 1.3906, 0.25);
    RemoveBuildingForPlayer(playerid, 1415, -68.3516, -1104.9922, 0.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 1462, -60.3594, -1116.9375, 0.2578, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -63.6719, -1125.6953, 0.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -63.4141, -1115.4141, 0.0469, 0.25);
    RemoveBuildingForPlayer(playerid, 1415, -63.8125, -1106.4219, 0.2188, 0.25);
    RemoveBuildingForPlayer(playerid, 3244, -287.8672, -1570.2500, 5.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 790, -141.2813, -1618.9531, 5.7109, 0.25);
    RemoveBuildingForPlayer(playerid, 790, -130.3203, -1602.4922, 5.7109, 0.25);
    RemoveBuildingForPlayer(playerid, 670, -141.8906, -1584.0156, 6.3438, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -88.1094, -1598.7188, 1.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 1370, -86.5703, -1595.1406, 2.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 3173, -93.0938, -1593.5234, 1.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 1462, -93.6797, -1588.0781, 1.5078, 0.25);
    RemoveBuildingForPlayer(playerid, 3174, -75.1719, -1596.3047, 1.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -79.2578, -1593.4688, 1.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 1447, -74.8203, -1607.2578, 3.4609, 0.25);
    RemoveBuildingForPlayer(playerid, 1370, -72.4141, -1596.7734, 2.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 1370, -74.1875, -1583.9922, 2.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 3175, -101.8203, -1577.6875, 1.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 1457, -91.0156, -1576.6250, 3.1953, 0.25);
    RemoveBuildingForPlayer(playerid, 1370, -100.8203, -1580.4219, 2.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -93.2109, -1569.4844, 1.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 3175, -77.9375, -1581.3125, 1.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 1472, -75.5859, -1581.0703, 2.0234, 0.25);
    RemoveBuildingForPlayer(playerid, 727, -73.8203, -1569.1719, 1.3516, 0.25);
    RemoveBuildingForPlayer(playerid, 670, -111.7734, -1553.6875, 2.7422, 0.25);
    RemoveBuildingForPlayer(playerid, 3173, -90.6406, -1562.9375, 1.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -77.0625, -1542.6016, 1.6172, 0.25);
    RemoveBuildingForPlayer(playerid, 693, -81.5625, -1522.3828, 5.6875, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, -70.4141, -1604.3750, 3.4609, 0.25);
    RemoveBuildingForPlayer(playerid, 1447, -66.2891, -1601.2266, 3.2109, 0.25);
    RemoveBuildingForPlayer(playerid, 1457, -71.0000, -1574.0859, 3.1953, 0.25);
    RemoveBuildingForPlayer(playerid, 3175, -64.3828, -1572.2109, 1.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -62.2734, -1569.2891, 1.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 1370, -61.6641, -1573.4609, 2.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 1413, -53.8125, -1585.8594, 3.0859, 0.25);
    RemoveBuildingForPlayer(playerid, 1438, -56.0625, -1575.6563, 1.5000, 0.25);
    RemoveBuildingForPlayer(playerid, 1447, -50.8281, -1581.7656, 3.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, -47.5547, -1577.6484, 3.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 1412, -44.5625, -1573.3672, 3.1641, 0.25);
    RemoveBuildingForPlayer(playerid, 1370, -64.0000, -1550.2578, 2.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 3175, -55.2813, -1557.4531, 1.4063, 0.25);
    RemoveBuildingForPlayer(playerid, 1370, -56.1563, -1560.4609, 2.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 727, -49.3984, -1560.0078, 1.4609, 0.25);
    RemoveBuildingForPlayer(playerid, 3174, -44.2891, -1561.3125, 1.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 1370, -43.7422, -1563.6875, 2.1563, 0.25);
    RemoveBuildingForPlayer(playerid, 3173, -67.2344, -1544.2188, 1.5547, 0.25);
    RemoveBuildingForPlayer(playerid, 790, -47.3125, -1543.0703, 5.7891, 0.25);
    RemoveBuildingForPlayer(playerid, 3335, -32.3516, -1527.3750, 1.0078, 0.25);
    RemoveBuildingForPlayer(playerid, 4504, 56.3828, -1531.4531, 6.7266, 0.25);
    RemoveBuildingForPlayer(playerid, 4505, 14.4609, -1347.3281, 11.6797, 0.25);
    RemoveBuildingForPlayer(playerid, 4506, -18.2266, -1335.9844, 12.7266, 0.25);
    RemoveBuildingForPlayer(playerid, 4521, -84.6797, -909.3438, 18.2422, 0.25);
    RemoveBuildingForPlayer(playerid, 4514, 440.0469, 587.4453, 19.7344, 0.25);
    RemoveBuildingForPlayer(playerid, 4515, 604.5234, 352.5391, 19.7344, 0.25);
    RemoveBuildingForPlayer(playerid, 4517, -193.8281, 269.5078, 12.8906, 0.25);
    RemoveBuildingForPlayer(playerid, 4523, -1592.7813, 622.7813, 42.9688, 0.25);
    RemoveBuildingForPlayer(playerid, 4524, -1141.7188, 1098.0547, 39.4766, 0.25);
    RemoveBuildingForPlayer(playerid, 4527, -1009.5859, 943.8125, 35.4766, 0.25);
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if (EsAdmin[i] == true)
        {
            format(bienvenida, sizeof(bienvenida), "%s se conecto...", name);
            TextDrawSetString(coneccion, bienvenida);
            TextDrawShowForAll(coneccion);
        }
    }
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if(PlayerInfo[playerid][pLogged] == true)
    {
   	KillTimer(TimeJailQuitVar[playerid]);
    GuardarJugador(playerid);
    PlayerInfo[playerid][pUsingText] = false;
    SavePlayerVehicles(playerid);
    TextDrawHideForPlayer(playerid, latinrp);
    TextDrawShowForPlayer(playerid, latinrp);
    KillTimer(PintarDisputa[playerid]);
    new nombre[MAX_PLAYER_NAME],string[128];
    switch (reason)
    {
        case 0:
        {
            GetPlayerName(playerid, nombre, sizeof(nombre));
            format(string, sizeof(string), "%s[%d] se desconecto [Crash]", nombre, playerid);
            SendClientMessageToAll(COLOR_RED,string);
        }
        case 1:
        {
            GetPlayerName(playerid, nombre, sizeof(nombre));
            format(string, sizeof(string), "%s[%d] ha salido del server [/q]", nombre, playerid);
            SendClientMessageToAll(COLOR_RED,string);
            ResetPlayerWeapons(playerid);
        }
        case 2:
        {
            GetPlayerName(playerid, nombre, sizeof(nombre));
            format(string, sizeof(string), "%s[%d] se desconecto [Baneado o Kickeado]", nombre, playerid);
            SendClientMessageToAll(COLOR_RED,string);
        }
    }
    }
    return 1;
}

public OnPlayerSpawn(playerid)
{
    if(PlayerInfo[playerid][pLogged] == false)
    {
        return Kick(playerid);
    }
    LoadGangZones(playerid);
    ///////////////////////////////////////Gang Zones//////////////
    ////////////////////////Textdraw coneccion//////////////////
    TextDrawHideForAll(coneccion);
    ///////////////////////////////////Skills Armas///////////////////
    SetPlayerSkillLevel(playerid,WEAPONSKILL_PISTOL,999);                        /*<-- 9MM*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_PISTOL_SILENCED,99);                /*<-- Silenciada*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_DESERT_EAGLE,999);                  /*<-- DK*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_MICRO_UZI,150);                     /*<-- UZI Y TEC9*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_MP5,999);                           /*<-- MP5*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SPAS12_SHOTGUN,999);                /*<-- EDC*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SHOTGUN,999);                       /*<-- ESCOBA*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SAWNOFF_SHOTGUN, 200);              /*<-- RECORTADA*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_AK47,999);                          /*<-- AK47*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_M4,999);                            /*<-- M4*/
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SNIPERRIFLE,999);                   /*<-- SNIPER*/
    /* Spec */
    if(IsPlayerSpectating(playerid))
    {
        SetPlayerInterior(playerid, pSpectatingInterior[playerid]);
        SetPlayerVirtualWorld(playerid, pSpectatingVirtualWorld[playerid]);
        SetPlayerPos(playerid, pSpectatingPos[playerid][0], pSpectatingPos[playerid][1], pSpectatingPos[playerid][2]);
        SetPlayerFacingAngle(playerid, pSpectatingPos[playerid][3]);
        SetCameraBehindPlayer(playerid);
        sSpectating[playerid] = false;
        sBeingSpectated[pSpectatingPlayer[playerid]] = false;
        pSpectatingPlayer[playerid] = -1;
    }
    /* Cargar animaciones */
    PreloadAnimLib(playerid,"BOMBER"); PreloadAnimLib(playerid,"RAPPING");
    PreloadAnimLib(playerid,"SHOP"); PreloadAnimLib(playerid,"BEACH");
    PreloadAnimLib(playerid,"SMOKING"); PreloadAnimLib(playerid,"FOOD");
    PreloadAnimLib(playerid,"ON_LOOKERS"); PreloadAnimLib(playerid,"DEALER");
    PreloadAnimLib(playerid,"CRACK"); PreloadAnimLib(playerid,"CARRY");
    PreloadAnimLib(playerid,"COP_AMBIENT"); PreloadAnimLib(playerid,"PARK");
    PreloadAnimLib(playerid,"INT_HOUSE"); PreloadAnimLib(playerid,"PED");
    PreloadAnimLib(playerid,"MISC"); PreloadAnimLib(playerid,"OTB");
    PreloadAnimLib(playerid,"BD_Fire"); PreloadAnimLib(playerid,"BENCHPRESS");
    PreloadAnimLib(playerid,"KISSING"); PreloadAnimLib(playerid,"BSKTBALL");
    PreloadAnimLib(playerid,"MEDIC"); PreloadAnimLib(playerid,"SWORD");
    PreloadAnimLib(playerid,"POLICE"); PreloadAnimLib(playerid,"SUNBATHE");
    PreloadAnimLib(playerid,"FAT"); PreloadAnimLib(playerid,"WUZI");
    PreloadAnimLib(playerid,"SWEET"); PreloadAnimLib(playerid,"ROB_BANK");
    PreloadAnimLib(playerid,"GANGS"); PreloadAnimLib(playerid,"RIOT");
    PreloadAnimLib(playerid,"GYMNASIUM"); PreloadAnimLib(playerid,"CAR");
    PreloadAnimLib(playerid,"CAR_CHAT"); PreloadAnimLib(playerid,"GRAVEYARD");
    PreloadAnimLib(playerid,"POOL");
    return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
    SetVehicleToRespawn(vehicleid);
    return 1;
}

public OnPlayerText(playerid, text[])
{
    if(PlayerInfo[playerid][pLogged] == false)
    {
        return Kick(playerid);
    }
    if(text[0] == '!')
    {
        if(PlayerInfo[playerid][pPolicia] >= 1)
        {
            new rango[15];
            switch(PlayerInfo[playerid][pPolicia])
            {
                    case 1: rango = "Alumno";
                    case 2: rango = "Oficial";
                    case 3: rango = "Agente";
                    case 4: rango = "Comisario";
                    case 5: rango = "Sargento";
            }
            new string[128];
            format(string, sizeof(string), "[Radio Policia]{ff6529} %s %s {FFFFFF} %s", rango, pName(playerid),text[1]);
            RadioPolicia(string);
            return 0;
        }
    }
    if(PlayerInfo[playerid][pAcento] >= 1)
    {
        new conacento[128];
        new acento[25];
        switch(PlayerInfo[playerid][pAcento])
        {
            case 1:  acento = "Mexicano";
            case 2:  acento = "Chileno";
            case 3:  acento = "Argentino";
            case 4:  acento = "Venezolano";
            case 5:  acento = "Paraguayo";
            case 6:  acento = "Portugues";
            case 7:  acento = "Arabe";
            case 8:  acento = "Ruso";
            case 9:  acento = "Ingles";
            case 10: acento = "Colombiano";
            case 11: acento = "Japones";
            case 12: acento = "Chino";
            case 13: acento = "Coreano";
            case 14: acento = "Boliviano";
            case 15: acento = "Gangster";
            case 16: acento = "Puerto riquense";
            case 17: acento = "Salvadoreño";
            case 18: acento = "Tailandes";
            case 19: acento = "Castellano";
        }
        format(conacento, sizeof(conacento), "%s *Acento %s dice: %s", NombreJugador(playerid),acento,text);
        SendClientMessageToNearby(playerid, -1, 10.0, conacento);
    }
    else 
    {
        new noacento[128];
        format(noacento, sizeof(noacento), "%s dice: %s", pName(playerid), text);
        SendClientMessageToNearby(playerid, -1, 10.0, noacento);
    }
    return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
    new message[128];
    format(message, sizeof(message), "Debug: este vehiculo tiene %i litros de gasolina.", CarsInfo[vehicleid][Gasolina]);
    SCM(playerid, -1, message);
    }
    return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof name);
    printf("* %s(ID:%d) uso el comando: %s", name, playerid, cmdtext);
    return 1;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
    if(PlayerInfo[playerid][pLogged] == false)
    {
        return Kick(playerid);
    }
    if(!success)
    {
        TextdrawError(playerid, "Error: comando inexistente.");
        return 1;
    }
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER || PLAYER_STATE_PASSENGER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(emisoraon[vehicleid] == true)
		{ 
			switch(emisora[vehicleid])
			{
				case 0:
				{
					StopAudioStreamForPlayer(playerid);
	    			/*----------------------------------ESPACIO------------------------------------*/
					PlayAudioStreamForPlayer(playerid, "http://23603.live.streamtheworld.com/LOS40.mp3");
    			}
   				case 1:
   				{
    				StopAudioStreamForPlayer(playerid);
    				/*----------------------------------ESPACIO------------------------------------*/
    				PlayAudioStreamForPlayer(playerid, "http://21933.live.streamtheworld.com/CADENA3.mp3");
    			}
    			case 2:
    			{
    				StopAudioStreamForPlayer(playerid);
    				/*----------------------------------ESPACIO------------------------------------*/
    				PlayAudioStreamForPlayer(playerid, "http://22823.live.streamtheworld.com/RADIO_POPULAR.mp3");
    			}	
    			case 3:
    			{
    				StopAudioStreamForPlayer(playerid);
    				/*----------------------------------ESPACIO------------------------------------*/
    				PlayAudioStreamForPlayer(playerid, "http://online-kissfm.tavrmedia.ua/KissFM");
    			}
    			case 4:
    			{
    				StopAudioStreamForPlayer(playerid);
    				/*----------------------------------ESPACIO------------------------------------*/
    				PlayAudioStreamForPlayer(playerid, "http://20823.live.streamtheworld.com/LA_MEGA_BOG.mp3");
    			}
    			case 5:
    			{
    				StopAudioStreamForPlayer(playerid);
    				/*----------------------------------ESPACIO------------------------------------*/
   			 		PlayAudioStreamForPlayer(playerid, "http://46.160.36.66:8000/rmf_maxxx.mp3");
   			 	}
    		}
    	}
    }
    else if(newstate == PLAYER_STATE_EXIT_VEHICLE)
    {
    	new vehicleid = GetPlayerVehicleID(playerid);
    	if(emisoraon[vehicleid] == true)
    	{
    	StopAudioStreamForPlayer(playerid);
    	}
    }
    return 1;
}
public OnPlayerEnterCheckpoint(playerid)
{
    ///////////////////////////////FedEX ////////////////////////////////
    if(EstaEn(playerid, 7.0, CPFEDEXRECORRIDOuno))
    {
        PlayerInfo[playerid][pDinero] += 3500;
        SetPlayerCheckpoint(playerid,CPFEDEXENTREGA,5.0);
        GameTextForPlayer(playerid,"Descargando Camion...",3500,5);
        SetTimer("CargaCamion", 3500,false);
    }
    else if(EstaEn(playerid,7.0,CPFEDEXRECORRIDOdos))
    {
        PlayerInfo[playerid][pDinero] += 3000;
        SetPlayerCheckpoint(playerid,CPFEDEXENTREGA,5.0);
        GameTextForPlayer(playerid,"Descargando Camion...",3500,5);
        SetTimer("CargaCamion", 3500,false);
    }
    else if(EstaEn(playerid,7.0,CPFEDEXRECORRIDOtres))
    {
        PlayerInfo[playerid][pDinero] += 2500;
        SetPlayerCheckpoint(playerid,CPFEDEXENTREGA,5.0);
        GameTextForPlayer(playerid,"Descargando Camion...",3500,5);
        SetTimer("CargaCamion", 3500,false);
    }
    else if(EstaEn(playerid,7.0,CPFEDEXRECORRIDOcuatro))
    {
        PlayerInfo[playerid][pDinero] += 1000;
        GameTextForPlayer(playerid,"Descargando Camion...",3500,5);
        SetPlayerCheckpoint(playerid,CPFEDEXENTREGA,5.0);
        SetTimer("CargaCamion", 3500,false);

    }
    else if(EstaEn(playerid,7.0,CPFEDEXRECORRIDOcinco))
    {
        SetPlayerCheckpoint(playerid,CPFEDEXENTREGA,5.0);
        PlayerInfo[playerid][pDinero] += 5000;
        GameTextForPlayer(playerid,"Descargando Camion...",3500,5);
        SetTimer("CargaCamion", 3500,false);
    }
    else if(IsPlayerInRangeOfPoint(playerid, 7.0,CPFEDEXRECORRIDOseis))
    {
        SetPlayerCheckpoint(playerid,CPFEDEXENTREGA,5.0);
        PlayerInfo[playerid][pDinero] += 10000;
        GameTextForPlayer(playerid,"Descargando Camion...",3500,5);
        SetTimer("CargaCamion", 3500,false);
    }
    ///////////////////////////////TRANSPORTISTA//////////////////////////////
    else if(IsPlayerInRangeOfPoint(playerid, 7.0,CPTRANSPORTISTARECORRIDO1))
    {
        PlayerInfo[playerid][pDinero] += 1200;
        SetPlayerCheckpoint(playerid,CPTOMARCARGA,5.0);
        SendClientMessage(playerid,-1,"Regresa El Camion A Su Lugar");
    }
    if(IsPlayerInRangeOfPoint(playerid, 7.0,CPTRANSPORTISTARECORRIDO2))
    {
        PlayerInfo[playerid][pDinero] += 2000;
        SetPlayerCheckpoint(playerid,CPTOMARCARGA,5.0);
        SendClientMessage(playerid,-1,"Regresa El Camion A Su Lugar");
    }
    else if(IsPlayerInRangeOfPoint(playerid, 7.0,CPTRANSPORTISTARECORRIDO3))
    {
        PlayerInfo[playerid][pDinero] += 1800;
        SetPlayerCheckpoint(playerid,CPTOMARCARGA,5.0);
        SendClientMessage(playerid,-1,"Regresa El Camion A Su Lugar");
    }
    DisablePlayerCheckpoint(playerid);
    return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
    return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
    DisablePlayerCheckpoint(playerid);
    return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
    return 1;
}

public OnRconCommand(cmd[])
{
    printf("[CMD RCON]:Se ha ejecutado el comando:'/rcon %s'!",cmd);
    return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    if(PlayerInfo[playerid][pLogged] == false)
    {
        return Kick(playerid);
    }
    return 1;
}

public OnObjectMoved(objectid)
{
    return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
    return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
    for(new i; i < MAX_HOUSES; i ++)
    {
        if(pickupid == HouseInfo[i][pid])
        {
            new string[128];
            TextDrawShowForPlayer(playerid, TdCasa[0]);
            format(string, sizeof(string), "Propietario: %s", HouseInfo[i][owner]);
            TextDrawSetString(TdCasa[1], string);
            TextDrawShowForPlayer(playerid, TdCasa[1]);
            switch(HouseInfo[i][Buyed])
            {
                case 0: format(string, sizeof(string), "Comprada: No");
                case 1: format(string, sizeof(string), "Comprada: Si");
            }
            TextDrawSetString(TdCasa[2], string);
            TextDrawShowForPlayer(playerid, TdCasa[2]);
            format(string, sizeof(string), "Precio: %i", HouseInfo[i][hPrice]);
            TextDrawSetString(TdCasa[3], string);
            TextDrawShowForPlayer(playerid, TdCasa[3]);
            switch(HouseInfo[i][Locked])
            {
                case 0: format(string, sizeof(string), "Cerrada: No");
                case 1: format(string, sizeof(string), "Cerrada: Si");
            }
            TextDrawSetString(TdCasa[4], string);
            TextDrawShowForPlayer(playerid, TdCasa[4]);
            SetTimerEx("HideHouseTextdraws", 6000, false, "i", playerid);
        }
    }
    return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
    return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
    return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
    return 1;
}

public OnPlayerExitedMenu(playerid)
{
    return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
if(PRESSED(KEY_YES))
{
if(usandoescudo[playerid] == true)
{
SetPlayerAttachedObject(playerid,0,18637,1,0.439000,0.258999,-0.054999,-93.199935,42.499984,-93.099922,1.000000,1.359999,1.206000);
new string[64];
format(string, sizeof(string), "{9933FF} %s * Usa el escudo de policia *",pName(playerid));
SendClientMessageToNearby(playerid, -1, 10.0, string);
WantSave[playerid] = true;
usandoescudo[playerid] = false;
}
else if(WantSave[playerid] == true)
{
usandoescudo[playerid] = false;
WantSave[playerid] = false;
new string[64];
format(string, sizeof(string), "{9933FF} %s * Guarda el escudo de policia *",pName(playerid));
SendClientMessageToNearby(playerid, -1, 10.0, string);
RemovePlayerAttachedObject(playerid, 0);
}
}
if(PRESSED(KEY_YES))
{
if(EstaEn(playerid,3.0,WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],WeaponSystem[playerid][Wz]))
{
    if(WeaponSystem[playerid][WPuedeTomarse] == true)
    {
        switch(WeaponSystem[playerid][Wid])
        {
            case 4:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(knifetext);
            GivePlayerWeapon(playerid, 4, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 5:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(batetext);
            GivePlayerWeapon(playerid, 5, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 22:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(pistoltext);
            GivePlayerWeapon(playerid, 22, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 23:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(pistolsilencedtext);
            GivePlayerWeapon(playerid, 23, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 24:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(deserttext);
            GivePlayerWeapon(playerid, 24, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 25:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(shotguntext);
            GivePlayerWeapon(playerid, 25, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 26:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(recortadatext);
            GivePlayerWeapon(playerid, 26, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 27:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(edctext);
            GivePlayerWeapon(playerid, 27, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 28:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(uzitext);
            GivePlayerWeapon(playerid, 28, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 29:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(mp5text);
            GivePlayerWeapon(playerid, 29, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 30:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(aktext);
            GivePlayerWeapon(playerid, 30, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 31:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(m4text);
            GivePlayerWeapon(playerid, 31, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 32:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(tectext);
            GivePlayerWeapon(playerid, 32, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 33:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(rifletext);
            GivePlayerWeapon(playerid, 33, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
            case 34:
            {
            WeaponSystem[playerid][WPuedeTomarse] = false;
            Delete3DTextLabel(snipertext);
            GivePlayerWeapon(playerid, 34, WeaponSystem[playerid][Wammo]);
            DestroyObject(WeaponSystem[playerid][idobject]);
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
            }
        }
    } 
}
}
if(PRESSED(KEY_FIRE) && GetPlayerWeapon(playerid) == 41)
    {
if(EstaEn(playerid, 3.0, 2064.731689,-999.049194,54.367187))
        {   
            if(Grafo0 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo0",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2221.707031,-1042.938110,57.933547))
        {
            if(Grafo1 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo1",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2789.516601,-1079.378417,30.718750))
        {
            if(Grafo2 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo2",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2662.825195,-1001.582214,86.117431))
        {
            if(Grafo3 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo3",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2820.704101,-1160.303588,25.340770))
        {
            if(Grafo4 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo4",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 824.957031,-1361.526123,25.856620))
        {
            if(Grafo5 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo5",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2710.410156,-1332.166870,47.693832))
        {
            if(Grafo6 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo6",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2659.709716,-1598.294555,12.479801))
        {
            if(Grafo7 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo7",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2757.252685,-2026.808837,13.554687))
        {
            if(Grafo8 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo8",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0,2639.729736,-2044.164306,13.550000))
        {
            if(Grafo9 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo9",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2458.383056,-1973.378906,13.461771))
        {
            if(Grafo10 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo10",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2440.219238,-1686.466430,13.804687))
        {
            if(Grafo11 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo11",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2280.905029,-1694.869140,13.610664))
        {
            if(Grafo12 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo12",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2197.714111,-1593.377685,14.339325))
        {
            if(Grafo13 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo13",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0,2112.727050,-1595.591064,13.551040))
        {
            if(Grafo14 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo14",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 1929.786010,-2025.660034,13.5468754))
        {
            if(Grafo15 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo15",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 1681.920166,-2163.286621,13.554687 ))
        {
            if(Grafo16 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo16",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 1020.265625,-2089.253662,13.292871))
        {
            if(Grafo17 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo17",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 1151.324829,-1877.339477,13.546358))
        {
            if(Grafo18 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo18",1000, true,"d",playerid);
            }
        }
else if(EstaEn(playerid, 3.0, 2391.946289,-1240.706787,24.855270))
        {
            if(Grafo19 == true)
            {
                PintarDisputa[playerid] = SetTimerEx("ActualizarGraffo19",1000, true,"d",playerid);
            }
        }
    }
if(PRESSED(KEY_HANDBRAKE) && GetPlayerWeapon(playerid) == 24)
    {
if(EstaEn(playerid,2.0,-29.118547,-185.130172,1003.546875))
        {
            foreach(new i : Player)
            {
                if((gettime() - tsrobotienda1[i]) < 60 * 30) return SendClientMessage(playerid, -1, "La tienda ha sido robada recientemente.");
                {
                    timerEnRobo[i] = SetTimerEx("robandotienda",10000,false,"d",playerid);
                    ApplyAnimation(playerid,"BUDDY","buddy_reload",4.1,0,1,1,1,1);
                    GameTextForPlayer(playerid,"Robando tienda...",10000,1);
                    tsrobotienda1[i] = gettime();
                }
            }
        }
else if(EstaEn(playerid,2.0,-27.628036,-89.944358,1003.546875))
        {
            foreach(new i : Player)
            {
                if((gettime() - tsrobotienda1[i]) < 60 * 30) return SendClientMessage(playerid, -1, "La tienda ha sido robada recientemente.");
                {
                    timerEnRobo[i] = SetTimerEx("robandotienda",10000,false,"d",playerid);
                    ApplyAnimation(playerid,"BUDDY","buddy_reload",4.1,0,1,1,1,1);
                    GameTextForPlayer(playerid,"Robando tienda...",10000,1);
                    tsrobotienda1[i] = gettime();
                }
            }
        }
    }
if(RELEASED(KEY_FIRE) && GetPlayerWeapon(playerid) == 41)
    {
        if(Grafo0 == true)
        {
        if(EstaEn(playerid, 3.0, 2064.731689,-999.049194,54.367187))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo1 == true)
        {
        if(EstaEn(playerid, 3.0, 2221.707031,-1042.938110,57.933547))
        {
        CancelarGraff(playerid);
        }
        } 
        else if(Grafo2 == true)
        {
        if (EstaEn(playerid, 3.0, 2789.516601,-1079.378417,30.718750))
        {
        CancelarGraff(playerid);
        } 
        }
        else if(Grafo3 == true)
        {
        if (EstaEn(playerid, 3.0, 2662.825195,-1001.582214,86.117431))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo4 == true)
        {
        if (EstaEn(playerid, 3.0, 2820.704101,-1160.303588,25.340770))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo5 == true)
        {
        if (EstaEn(playerid, 3.0, 824.957031,-1361.526123,25.856620))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo6 == true)
        {
        if (EstaEn(playerid, 3.0, 2710.410156,-1332.166870,47.693832))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo7 == true)
        {
        if (EstaEn(playerid, 3.0, 2659.709716,-1598.294555,12.479801))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo8 == true)
        {
        if (EstaEn(playerid, 3.0, 2757.252685,-2026.808837,13.554687))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo9 == true)
        {
        if (EstaEn(playerid, 3.0,2639.729736,-2044.164306,13.550000))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo10 == true)
        {
        if (EstaEn(playerid, 3.0, 2458.383056,-1973.378906,13.461771))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo11 == true)
        {
        if (EstaEn(playerid, 3.0, 2440.219238,-1686.466430,13.804687))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo12 == true)
        {
        if (EstaEn(playerid, 3.0, 2280.905029,-1694.869140,13.610664))
        { 
        CancelarGraff(playerid);
        }
        }
        else if(Grafo13 == true)
        {
        if (EstaEn(playerid, 3.0, 2197.714111,-1593.377685,14.339325))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo14 == true)
        {
        if (EstaEn(playerid, 3.0,2112.727050,-1595.591064,13.551040))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo15 == true)
        {
        if (EstaEn(playerid, 3.0, 1929.786010,-2025.660034,13.5468754))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo16 == true)
        {
        if (EstaEn(playerid, 3.0, 1681.920166,-2163.286621,13.554687 ))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo17 == true)
        {
        if (EstaEn(playerid, 3.0, 1020.265625,-2089.253662,13.292871))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo18 == true)
        {
        if (EstaEn(playerid, 3.0, 1151.324829,-1877.339477,13.546358))
        {
        CancelarGraff(playerid);
        }
        }
        else if(Grafo19 == true)
        {
        if (EstaEn(playerid, 3.0, 2391.946289,-1240.706787,24.855270))
        {
        CancelarGraff(playerid);
        }
        }
    }
    /* Anti cbug */
if((newkeys & KEY_FIRE) && (newkeys & KEY_CROUCH) || (newkeys & KEY_SPRINT) && (newkeys & KEY_FIRE) && (newkeys & KEY_CROUCH))
    {
        if(GetPlayerWeapon(playerid) == 24)
        {
            if(IsPlayerInAnyVehicle(playerid)) return 1;
            TogglePlayerControllable(playerid,0);
            SetTimerEx("descongelar",2000,false,"d",playerid);
            SetPlayerArmedWeapon(playerid, 0);
        }
    }
if(PRESSED(KEY_YES)) 
    {
        if(IsPlayerInRangeOfDoor(playerid))
        {
            SetPlayerInHouse(playerid);
        }
        else if(IsPlayerInRangeOfOutDoor(playerid))
        {
            SetPlayerOutHouse(playerid);
        }
        else if(EstaEn(playerid,1.0,1091.898803,-1181.286865,25.232538)) // 1 ATM
        {
            ShowPlayerDialog(playerid, DIALOG_BANCO, DIALOG_STYLE_LIST, "ATM", "Depositar\nRetirar", "Aceptar", "Cancelar");
        }
        else if(EstaEn(playerid,1.0,1090.398315,-1181.040771,25.232538)) // 2do ATM
        {
            ShowPlayerDialog(playerid, DIALOG_BANCO, DIALOG_STYLE_LIST, "ATM", "Depositar\nRetirar", "Aceptar", "Cancelar");
        }
        else if(EstaEn(playerid,1.0,1088.818359,-1181.253295,25.232538)) // 3er ATM
        {
            ShowPlayerDialog(playerid, DIALOG_BANCO, DIALOG_STYLE_LIST, "ATM", "Depositar\nRetirar", "Aceptar", "Cancelar");
        }
        else if(EstaEn(playerid, 1.0,1146.491821,-1300.397338,705.274719)) // Comprar medicamentos
        {
            ShowPlayerDialog(playerid,DIALOG_COMPRARMEDICAMENTOS,DIALOG_STYLE_LIST,"Hospital\tPrecio:","5 Medicamentos\t1000$\n10 Medicamentos\t2000$","Comprar", "Cancelar");
        }
        else if(EstaEn(playerid,2.0,207.430175,-100.326667,1005.257812)) // Binco
        {
            TextDrawShowForPlayer(playerid, CajaSelect);
            TextDrawShowForPlayer(playerid, BotonSelect);
            TextDrawShowForPlayer(playerid, CajaDerecha);
            TextDrawShowForPlayer(playerid, BotonDerecha);
            TextDrawShowForPlayer(playerid, CajaIzquierda);
            TextDrawShowForPlayer(playerid, BotonIzquierda);
            SelectTextDraw(playerid, 0x000000BB);
            SetPlayerCameraPos(playerid, 215.1072, -99.7593, 1005.2578);
            SetPlayerCameraLookAt(playerid, 217.2820, -98.3583, 1005.2578);
            SetPlayerPos(playerid, 217.2820, -98.3583, 1005.2578);
            SetPlayerFacingAngle(playerid, 122.7422);
            new int = random(21);
            new intvar = random(11) + int;
            SetPlayerVirtualWorld(playerid, intvar);
            PlayerInfo[playerid][SelectingSkin] = true;
            PlayerInfo[playerid][FakeSkin] = PlayerInfo[playerid][pRopa];
        }
        else if(EstaEn(playerid, 1.0,1146.484375,-1298.947875,705.274719)) // botiquines
        {
            ShowPlayerDialog(playerid,DIALOG_COMPRARBOTIS,DIALOG_STYLE_LIST, "Hospital\tPrecio:","1 Botiquin\t1500$\n5 Botiquines\t5000$","Comprar", "Cancelar");
        }
        else if(EstaEn(playerid,2.0,2175.7561, -992.3737, 61.9645)) // Entrada Garage Han Seoul
        {
            new vehiculo = GetPlayerVehicleID(playerid);
            TP(playerid,2190.5283, -932.3796, 1140.7251);
            SetVehiclePos(vehiculo,2190.5283, -932.3796, 1140.7251);
            PutPlayerInVehicle(playerid, vehiculo, 0);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,2.0,2190.5283, -932.3796, 1140.7251)) // Salida Garage Han Seoul
        {
            new vehiculo = GetPlayerVehicleID(playerid);
            TP(playerid,2175.7561, -992.3737, 61.9645);
            SetVehiclePos(vehiculo,2175.7561, -992.3737, 61.9645);
            PutPlayerInVehicle(playerid, vehiculo, 0);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,2.0,2175.7561, -992.3737, 61.9645)) // Entrada
        {
            new vehiculo = GetPlayerVehicleID(playerid);
            TP(playerid,2190.5283, -932.3796, 1140.7251);
            SetVehiclePos(vehiculo,2190.5283, -932.3796, 1140.7251);
            PutPlayerInVehicle(playerid, vehiculo, 0);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2.0,361.829895,173.703338,1008.382812))
        {
            if(PlayerInfo[playerid][pDNI] != 1)
            {
                ShowPlayerDialog(playerid,DIALOG_CREATEDNI,DIALOG_STYLE_INPUT,"Ayuntamiento | DNI.","{005EF7}->{FFFFFF}Ingresa tu fecha de nacimiento:","Aceptar","Cancelar");
            }
            else SCM(playerid,-1,"Ya tienes un DNI");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2.0,261.592681,108.555244,1004.617187)) // vestimenta lspd
        {
            if(PlayerInfo[playerid][pPolicia] >=1)
            {
                ShowPlayerDialog(playerid,DIALOG_ROPALSPD,DIALOG_STYLE_LIST,"Vestimenta LSPD","{005EF7}->{FFFFFF}Alumno\n{005EF7}->{FFFFFF}Policia\n{005EF7}->{FFFFFF}Agente\n{005EF7}->{FFFFFF}Comisario\n{005EF7}->{FFFFFF}Sargento\n{005EF7}->{FFFFFF}Anti Disturbios\n{005EF7}->{FFFFFF}Oficial Mujer.", "Vestirse","Cancelar");
            }
        }
        else if(EstaEn(playerid, 8.0,2775.471923,913.280944,10.812595)) //mafia pixula
        {
            if(PlayerInfo[playerid][pMafioso] >= 1)
            {
                MoveObject(PortonMafia,2777.23364, 913.34528, 16.04040,0.50,0.00000, 0.00000, 0.00000);
                SetTimer("CerrarPuertaMafia", 10000,false);
            }
        }
        else if(EstaEn(playerid, 8.0,2774.326660,913.230163,10.858775)) //mafia pixula
        {
            if(PlayerInfo[playerid][pMafioso] >= 1)
            {
                MoveObject(PortonMafia,2777.23364, 913.34528, 16.04040,0.50,0.00000, 0.00000, 0.00000);
                SetTimer("CerrarPuertaMafia", 10000,false);
            }
        }
        else if(EstaEn(playerid, 8.0,2772.704101,913.145690,10.924201)) //mafia pixula
        {
            if(PlayerInfo[playerid][pMafioso] >= 1)
            {
                MoveObject(PortonMafia,2777.23364, 913.34528, 16.04040,0.50,0.00000, 0.00000, 0.00000);
                SetTimer("CerrarPuertaMafia", 5000,false);
            }
        }
        else if(EstaEn(playerid, 8.0,2785.126464,913.516967,10.531415)) //mafia pixula
        {
            if(PlayerInfo[playerid][pMafioso] >= 1)
            {
                MoveObject(PortonMafia,2777.23364, 913.34528, 16.04040,0.50,0.00000, 0.00000, 0.00000);
                SetTimer("CerrarPuertaMafia", 5000,false);
            }
        }
        else if(EstaEn(playerid, 8.0,2780.468994,913.351318,10.532233)) //mafia pixula
        {
            if(PlayerInfo[playerid][pMafioso] >= 1)
            {
                MoveObject(PortonMafia,2777.23364, 913.34528, 16.04040,0.50,0.00000, 0.00000, 0.00000);
                SetTimer("CerrarPuertaMafia", 5000,false);
            }
        }
        else if(EstaEn(playerid, 8.0,2781.818359,913.374755,10.531710)) //mafia pixula
        {
            if(PlayerInfo[playerid][pMafioso] >= 1)
            {
                MoveObject(PortonMafia,2777.23364, 913.34528, 16.04040,0.50,0.00000, 0.00000, 0.00000);
                SetTimer("CerrarPuertaMafia", 5000,false);
            }
        }
        else if(EstaEn(playerid,8.0,2784.060546,914.182434,10.750000)) //mafia pixula
        {
            if(PlayerInfo[playerid][pMafioso] >= 1)
            {
                MoveObject(PortonMafia,2777.23364, 913.34528, 16.04040,0.50,0.00000, 0.00000, 0.00000);
                SetTimer("CerrarPuertaMafia", 5000,false);
            }
        }
        else if(EstaEn(playerid, 4.0,1540.451171,-1626.944946,13.131381)) // LSPD
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                MoveObject(BallaLSPD,1544.64758, -1630.63892, 13.31370,0.50,0.00000, 0.00000, 0.00000);
                SetTimer("CerrarPuerta", 5000,false);
            }
        }
        else if(EstaEn(playerid,4.0,1548.821166,-1627.407104,13.134495))
            {
                if(PlayerInfo[playerid][pPolicia] >= 1)
                {
                    MoveObject(BallaLSPD,1544.64758, -1630.63892, 13.31370,0.50,0.00000, 0.00000, 0.00000);
                    SetTimer("CerrarPuerta", 5000,false);
                }
            }
        else if(EstaEn(playerid, 7.0,1583.045776,-1637.133789,13.398077)) // LSPD
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                MoveObject(PortonLSPD, 1589.67676, -1638.26611, 18.64515,0.50,0.00000, 0.00000, 90.00000);
                SetTimer("CerrarPorton", 8000,false);
            }
        }
        else if(EstaEn(playerid, 7.0,1589.087524,-1641.022216,12.727549)) // LSPD
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                MoveObject(PortonLSPD, 1589.67676, -1638.26611, 18.64515,0.50,0.00000, 0.00000, 90.00000);
                SetTimer("CerrarPorton", 8000,false);
            }
        }
        else if(EstaEn(playerid, 7.0,1591.865722, -1641.621582,12.611860)) // LSPD
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                MoveObject(PortonLSPD, 1589.67676, -1638.26611, 18.64515,0.50,0.00000, 0.00000, 90.00000);
                SetTimer("CerrarPorton", 8000,false);
            }
        }
        else if(EstaEn(playerid, 7.0,1586.361328,-1641.230834,12.679018)) // LSPD
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                MoveObject(PortonLSPD, 1589.67676, -1638.26611, 18.64515,0.50,0.00000, 0.00000, 90.00000);
                SetTimer("CerrarPorton", 8000,false);
            }
        }
        else if(EstaEn(playerid, 7.0,1588.293579,-1647.799560,10.784315)) // LSPD
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                MoveObject(PortonLSPD, 1589.67676, -1638.26611, 18.64515,0.50,0.00000, 0.00000, 90.00000);
                SetTimer("CerrarPorton", 8000,false);
            }
        }
        else if(EstaEn(playerid,7.0,1588.686889,-1643.406738,12.464655)) // LSPD
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                MoveObject(PortonLSPD, 1589.67676, -1638.26611, 18.64515,0.50,0.00000, 0.00000, 90.00000);
                SetTimer("CerrarPorton", 8000,false);
            }
        }
        else if(IsPlayerInRangeOfPoint(playerid,5.0,CPTOMARCARGA)) // Recorridos
        {
            if(PlayerInfo[playerid][pJob] == 2)
            {
                if(IsPlayerInAnyVehicle(playerid))
                {
                    ShowPlayerDialog(playerid,RECORRIDOSTRANSPORTISTA, DIALOG_STYLE_LIST, "Recorridos Transportista \t Paga","Piezas de autos \t 1200$ \n Material Para Radio \t 1800$ \n Auto deportivo \t 2000$", "Seleccionar", "Cancelar");
                }
            }
        }
        else if(IsPlayerInRangeOfPoint(playerid,1.0,-26.271457,-188.258941,1003.546875))
        {
            ShowPlayerDialog(playerid,DIALOGO_COMPRAS,  DIALOG_STYLE_LIST, "Oxxo|| Compras || \t Precio"," GPS\t ($500)\nLata de aerosol \t ($600)","Comprar","Cancelar");
        }
        else if(IsPlayerInRangeOfPoint(playerid,1.0,-27.628036,-89.944358,1003.546875))
        {
            ShowPlayerDialog(playerid,DIALOGO_COMPRAS,  DIALOG_STYLE_LIST, "Oxxo|| Compras || \t Precio"," GPS\t ($500)\nLata de aerosol \t ($600)","Comprar","Cancelar");
        }
        else if(IsPlayerInRangeOfPoint(playerid,1.0,2356.801025,-1046.776000,612.908874))
        {
            ShowPlayerDialog(playerid,DIALOGO_ARMAS2,DIALOG_STYLE_LIST,"Que Quieres wey?","Sniper($50,000)\nEDC($25,000)\nAK47($15,000)\nM4($50000)","Comprar","Cancelar");
        }
        else if(PlayerInfo[playerid][pMecanico] >= 1) // Mecanico
        {
            if(IsPlayerInRangeOfPoint(playerid, 1.0, 2122.835693,-2275.215576,20.671875))
            {
                ShowPlayerDialog(playerid,DIALOGO_MECANICOS,DIALOG_STYLE_LIST, "MECANICOS","Ropa De Mecanico \n Ropa De Jefe De Mecanicos \n Tomar Servicio De Mecanico \n Dejar Servicio De Mecanico","Aceptar","Cerrar");
            }
        }
        else if(IsPlayerInRangeOfPoint(playerid,2.0,CPPEDIRTRABAJOTRANSPORTISTA)) // Trabajo Transportista
        {
            if(PlayerInfo[playerid][pJob] == 4)
            {
                return SendClientMessage(playerid, -1, "Ya eres armero");
            }
            if(PlayerInfo[playerid][pJob] != 0)
            {
                return SendClientMessage(playerid, -1, "Ya tienes trabajo, utiliza /renunciar para renunciar de tu trabajo actual.");
            }
            PlayerInfo[playerid][pJob] = 2;
            SendClientMessage(playerid,COLOR_YELLOW,"Felicidades eres TRANSPORTISTA!");
            SetPlayerCheckpoint(playerid,CPTOMARCARGA,5.0);
            SendClientMessage(playerid,-1,"Ve a por un auto de transportista");
            SendClientMessage(playerid,-1,"Ve a la zona de carga y comienza a trabajar");
        }
        else if(IsPlayerInRangeOfPoint(playerid,7.0,CPTOMARCARGA2)) // Transportista
        {
            if(PlayerInfo[playerid][pJob] == 2)
            {
                if(IsPlayerInAnyVehicle(playerid))
                {
                    ShowPlayerDialog(playerid,RECORRIDOSTRANSPORTISTA, DIALOG_STYLE_LIST, "Recorridos Transportista \t Paga","Piezas de autos \t 1200$ \n Material Para Radio \t 1800$ \n Auto deportivo \t 2000$", "Seleccionar", "Cancelar");
                }
            }
        }
        else if(EstaEn(playerid,2.0,-29.118547,-185.130172,1003.546875))
        {
            ShowPlayerDialog(playerid,DIALOGO_COMPRAS,  DIALOG_STYLE_LIST, "Oxxo|| Compras || \t Precio"," GPS\t ($500)\nLata de aerosol \t ($600)","Comprar","Cancelar");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3.0,2483.389404,-1293.238647,30.336767))
        {
            ShowPlayerDialog(playerid,DIALOGO_ARMAS1, DIALOG_STYLE_LIST, "Que Desea comprar?", "DK ($4,000)\nRifle ($15,000)\nRecortada ($8,000)\nTec9($6500)\nChaleco($10.000)", "Comprar", "Cancelar");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0,CPFEDEXSALIDA))
        {
            if(IsPlayerInAnyVehicle(playerid))
            {
                if(PlayerInfo[playerid][pJob] == 1)
                {
                    ShowPlayerDialog(playerid,RECORRIDOSFEDEX, DIALOG_STYLE_LIST, "Recorridos FedEX","Entrega de videojuegos\nProductos de supermercado\nMedicamentos\nPapeles Ayuntamiento\nVerduras congeladas\nCasinos", "Cargar", "Cancelar");
                }
            }
        }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0,CPPEDIRTRABAJO))
        {
            if(PlayerInfo[playerid][pJob] == 4)
            {
                return SendClientMessage(playerid, -1, "Ya eres de fedex");
            }
            if(PlayerInfo[playerid][pJob] != 0)
            {
                return SendClientMessage(playerid, -1, "Ya tienes trabajo, utiliza /renunciar para renunciar de tu trabajo actual.");
            }
            PlayerInfo[playerid][pJob] = 1;
            SendClientMessage(playerid,COLOR_YELLOW,"?FELICIDADES Ya Trabajas En Fedex!");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2.0,327.232940,307.167846,999.148437))
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                ShowPlayerDialog(playerid,DIALOGO_POLICIA, DIALOG_STYLE_LIST, "Armamento De Policias", "Porra\nTaser\nDesert-Eagle\nMP5\nM4\nEscopeta-De-Combate\nSniper\nChaleco-AnitBalas", "Obtenerlo", "Cancelar");
            }
        }
        else if(IsPlayerInRangeOfPoint(playerid, 4.0,CPTRABAJOARMERO))
        {
            if(PlayerInfo[playerid][pJob] == 4)
            {
                return SendClientMessage(playerid, -1, "Ya eres armero");
            }
            if(PlayerInfo[playerid][pJob] != 0)
            {
                return SendClientMessage(playerid, -1, "Ya tienes trabajo, utiliza /renunciar para renunciar de tu trabajo actual.");
            }
            PlayerInfo[playerid][pJob] = 4;
            SendClientMessage(playerid,COLOR_YELLOW,"FELICIDADES Ya Trabajas De Armero");
        }
        else if(IsPlayerInRangeOfPoint(playerid,3.0,2123.164794,-2275.063720,20.671875))
        {      
            if(PlayerInfo[playerid][pMecanico] >= 1)
            {
                return SendClientMessage(playerid, -1, "Ya eres mecanico");
            }
            PlayerInfo[playerid][pMecanico] = 1;
            SendClientMessage(playerid,COLOR_YELLOW,"FELICIDADES Ya Trabajas De Mecanico");
        }
        else if(IsPlayerInRangeOfPoint(playerid,3.0,CPCREARARMAS))
        {
            if(PlayerInfo[playerid][pJob] == 4)
            {
                ShowPlayerDialog(playerid,DIALOGO_ARMERO, DIALOG_STYLE_LIST, "Armero"," Desert-Eagle \n EDC \n M4 \n Escopeta-Recortada \n tec9 \n Rifle De Caza", "Seleccionar", "Cancelar");
            }
        }
    }
if(PRESSED(KEY_NO)) 
    {
        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
            ShowPlayerDialog(playerid,DialogoControl,DIALOG_STYLE_LIST,"{FFFFFF}Control del Vehiculo",
             "\
                {005EF7}->{FFFFFF}Encender/Apagar auto\n\
                {005EF7}->{FFFFFF}Abrir/Cerrar Capo\n\
                {005EF7}->{FFFFFF}Abrir/Cerrar Maletero\n\
                {005EF7}->{FFFFFF}Apagar/Encender Luces \n\
                {005EF7}->{FFFFFF}Emisoras\n\
             ","Elegir","Cancelar");
        }
        else if(EstaEn(playerid,2.0,1173.006958,-1299.851684,701.647338))  // Menu HP
        {
            ShowPlayerDialog(playerid,DIALOG_HPMENU,DIALOG_STYLE_LIST,"{005EF7}->{FFFFFF}Hospital Central\t{005EF7}->{FFFFFF} Precio:","{005EF7}->{FFFFFF} Servicio medico \t{005EF7}->{FFFFFF} 1200$ (VIP:1000$). ","Aceptar","Cancelar");
        }
    }
if(PRESSED(KEY_CTRL_BACK))
    {
        if(PlayerInfo[playerid][pAbatido] >= 1)
        {
            ShowPlayerDialog(playerid,DIALOG_MUERTE, DIALOG_STYLE_LIST, "Estas Abatido","Solicitar Medico \nAceptar PK", "Aceptar", "Cancelar");
        }
        else if(EstaEn(playerid, 2.0,1583.007934,-1637.131103,13.398077))
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                MoveObject(PuertaGarage,1582.60107, -1637.84277, 12.35710,0.50,0.00000, 0.00000, -76.00000);
                SetTimer("CerrarPuertaGarage", 5000, false);
            }
            if(EstaEn(playerid,2.0,1583.620483,-1639.822875,13.216165))
            {
                if(PlayerInfo[playerid][pPolicia] >= 1)
                {
                    MoveObject(PuertaGarage,1582.60107, -1637.84277, 12.35710,0.50,0.00000, 0.00000, -76.00000);
                    SetTimer("CerrarPuertaGarage", 5000, false);
                }
            }
        }
    }
if(PRESSED(KEY_SECONDARY_ATTACK))
    {
        if(EstaEn(playerid,4.0,318.564971,1118.209960,1083.882812))
        {
            SetPlayerInterior(playerid,0);
            TP(playerid,2186.518798,-997.335083,66.468750);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,4.0,2186.518798,-997.335083,66.468750)) 
        {
            SetPlayerInterior(playerid,5);
            TP(playerid,318.564971,1118.209960,1083.882812);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,2.0,1038.531372,0.111030,1001.284484)) 
        {
            SetPlayerInterior(playerid,0);
            TP(playerid,1564.825683,-1666.947631,28.394580);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,2.0,1564.825683,-1666.947631,28.394580)) 
        {
            SetPlayerInterior(playerid,3);
            TP(playerid,1038.531372,0.111030,1001.284484);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,2.0,1481.154663,-1771.711914,18.795755)) 
        {
            SetPlayerInterior(playerid, 3);
            TP(playerid,390.769866,173.863616,1008.382812);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,2.0,390.769866,173.863616,1008.382812)) 
        {
            SetPlayerInterior(playerid, 0);
            TP(playerid,1481.154663,-1771.711914,18.795755);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,2.0,2324.419921,-1145.568359,1050.710083))
        {
            SetPlayerInterior(playerid, 0);
            TP(playerid,2259.69556, -1019.49811, 59.31470);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,2.0,2259.69556, -1019.49811, 59.31470))
        {
            SetPlayerInterior(playerid, 12);
            TP(playerid,2324.419921,-1145.568359,1050.710083);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,4.0,2541.655517,-1304.076660,1025.070312))
        {
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
            SetPlayerInterior(playerid,0);
            TP(playerid,2814.782714,973.024841,10.750000);
        }
        else if(EstaEn(playerid,4.0,2814.782714,973.024841,10.750000))
        {
            SetPlayerInterior(playerid,2);
            TP(playerid,2541.655517,-1304.076660,1025.070312);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,4.0,1145.790527,-1299.200073,701.647338))
        {
            TP(playerid,1172.678955,-1323.328369,15.402153);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,4.0,1172.678955,-1323.328369,15.402153)) // Entrada HP
        {
            TP(playerid,1146.4980, -1299.1240, 700.8493);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,3.0,288.745971,169.350997,1007.171875))
        {
            SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,EntradaFBI);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,3.0,EntradaFBI))
        {
            SetPlayerInterior(playerid,3);
            SetPlayerPos(playerid, 288.745971,169.350997,1007.171875);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,1.0,1352.368530,-1759.252075,13.507812))
        {
            SetPlayerInterior(playerid,18);
            SetPlayerPos(playerid, -30.946699,-89.609596,1003.546875);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,3.0,1830.872558,-1842.831542,13.578125))
        {
            SetPlayerInterior(playerid,17);
            SetPlayerPos(playerid, -25.786819,-188.249694,1003.546875);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,1.0,-30.876083,-92.011192,1003.546875))
        {
            SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid, 1352.368530,-1759.252075,13.507812);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,1.0,-25.786819,-188.249694,1003.546875))
        {
            SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid, 1833.780151,-1842.973266,13.578125);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,3.0,246.375991,109.245994,1003.218750))
        {
            SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid, 1555.491699,-1675.684448,16.195312);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,3.0,2405.0063, -1033.5554, 612.1299))
        {
            SetPlayerPos(playerid,2356.366943,-1045.656005,54.155509);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,1.0,1555.491699,-1675.684448,16.195312))
        {
            SetPlayerInterior(playerid,10);
            SetPlayerPos(playerid, 246.295333,107.299995, 1003.218750);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,3.0,2405.0063, -1033.5554, 612.1299))
        {
            SetPlayerPos(playerid,2356.366943,-1045.656005,54.155509);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,1.0,2355.536132,-1038.581909,54.335803))
        {
            SetPlayerPos(playerid,2405.0063, -1033.5554, 612.1299);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,4.0,1260.646240,-785.447387,1091.9062500)) // Casa de Junior
        {
            GameTextForPlayer(playerid, "~w~Casa De ~r~ ...", 4000, 1);
            SetPlayerInterior(playerid,5);
            SetPlayerPos(playerid,1267.663208,-781.323242,1091.906250);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,4.0,1267.663208,-781.323242,1091.906250)) // salida de casa
        {
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
            SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,1260.646240,-785.447387,1091.9062500);
        }
        else if(EstaEn(playerid, 2.0,322.316101,302.359100,999.148437))
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                SetPlayerInterior(playerid,10);
                SetPlayerPos(playerid,276.176269,122.152526,1004.617187);
                GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
                SetTimerEx("descongelar", 4000, false, "d", playerid);
                TogglePlayerControllable(playerid,false);
                SetPlayerVirtualWorld(playerid,0);
            }
        }
        else if(EstaEn(playerid, 2.0,276.176269,122.152526,1004.617187))
        {
            if(PlayerInfo[playerid][pPolicia] >= 1)
            {
                SetPlayerInterior(playerid,5);
                SetPlayerPos(playerid,322.197998,302.497985,999.148437);
                GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
                SetTimerEx("descongelar", 4000, false, "d", playerid);
                TogglePlayerControllable(playerid,false);
                SetPlayerVirtualWorld(playerid,0);
            }
        }
        else if(EstaEn(playerid, 2.0, 2495.430664,-1691.139282,14.765625))
        {
            SetPlayerInterior(playerid,3);
            SetPlayerPos(playerid,2495.827148,-1692.083618,1014.742187);
            GameTextForPlayer(playerid, "~w~Casa De ~r~ NegruraNoob", 3000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid, 2.0,2495.827148,-1692.083618,1014.742187))
        {
            if(PlayerInfo[playerid][pAdmin] == 5)
            {
            SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,2495.430664,-1691.139282,14.765625);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
            }
        }
        else if(EstaEn(playerid,4.0,207.737991,-109.019996,1005.132812))
        {
            SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,2244.317871,-1665.547485,15.476562);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,4.0,2244.317871,-1665.547485,15.476562))
        {
            SetPlayerInterior(playerid,15);
            SetPlayerPos(playerid,207.820220,-111.266334,1005.132812);
            GameTextForPlayer(playerid, "~w~Binco Ganton", 5000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,4.0,CPSALIDAFABRICA))
        {
            SetPlayerInterior(playerid,0);
            SetPlayerPos(playerid,CPENTRADAFABRICA);
            GameTextForPlayer(playerid, "~w~Cargando Objetos...", 4000, 1);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
        else if(EstaEn(playerid,4.0,CPENTRADAFABRICA))
        {
            GameTextForPlayer(playerid, "~w~Fabrica De Armas", 4000, 1);
            SetPlayerInterior(playerid,6);
            SetPlayerPos(playerid,316.524993,-167.706985,999.593750);
            SetTimerEx("descongelar", 4000, false, "d", playerid);
            TogglePlayerControllable(playerid,false);
            SetPlayerVirtualWorld(playerid,0);
        }
    }
return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
    return 1;
}

public OnPlayerUpdate(playerid)
{
    if(GetPlayerMoney(playerid) != PlayerInfo[playerid][pDinero])
    {
        ResetPlayerMoney(playerid);
        GivePlayerMoney(playerid, PlayerInfo[playerid][pDinero]);
    }
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
    GetVehicleParamsEx(vehicleid,engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, 0, lights, alarm, doors, bonnet, boot, objective);
    Motor[vehicleid] = 0;
    return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
    return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
    return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
    return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
    	case DIALOG_EMISORAS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: // Los 40
                    {
                    new vehicleid = GetPlayerVehicleID(playerid);
                    StopAudioStreamForPlayer(playerid);
                    /*----------------------------------ESPACIO------------------------------------*/
                    emisoraon[vehicleid] = true;
                    emisora[vehicleid] = 0;
                    PlayAudioStreamForPlayer(playerid,"http://23603.live.streamtheworld.com/LOS40.mp3");
                    }
                    case 1: // Cadena 3
                    {
                    new vehicleid = GetPlayerVehicleID(playerid);
                    StopAudioStreamForPlayer(playerid);
                    /*----------------------------------ESPACIO------------------------------------*/
                    emisoraon[vehicleid] = true;
                    emisora[vehicleid] = 1;
                    PlayAudioStreamForPlayer(playerid, "http://21933.live.streamtheworld.com/CADENA3.mp3");
                    }
                    case 2: // La popu
                    {
                    new vehicleid = GetPlayerVehicleID(playerid);
                    StopAudioStreamForPlayer(playerid);
                    /*----------------------------------ESPACIO------------------------------------*/
                    emisoraon[vehicleid] = true;
                    emisora[vehicleid] = 2;
                    PlayAudioStreamForPlayer(playerid, "http://22823.live.streamtheworld.com/RADIO_POPULAR.mp3");
                    }
                    case 3: //Kiss FM
                    {
                    new vehicleid = GetPlayerVehicleID(playerid);
                    StopAudioStreamForPlayer(playerid);
                    /*----------------------------------ESPACIO------------------------------------*/
                    emisoraon[vehicleid] = true;
                    emisora[vehicleid] = 3;
                    PlayAudioStreamForPlayer(playerid, "http://online-kissfm.tavrmedia.ua/KissFM");
                    }
                    case 4: // La mega
                    {
                    new vehicleid = GetPlayerVehicleID(playerid);
                    StopAudioStreamForPlayer(playerid);
                    /*----------------------------------ESPACIO------------------------------------*/
                    emisoraon[vehicleid] = true;
                    emisora[vehicleid] = 4;
                    PlayAudioStreamForPlayer(playerid, "http://20823.live.streamtheworld.com/LA_MEGA_BOG.mp3");
                    }
                    case 5: // Radio FM max
                    {
                    new vehicleid = GetPlayerVehicleID(playerid);
                    StopAudioStreamForPlayer(playerid);
                    /*----------------------------------ESPACIO------------------------------------*/
                    emisora[vehicleid] = 5;
                    PlayAudioStreamForPlayer(playerid, "http://46.160.36.66:8000/rmf_maxxx.mp3");
                    emisoraon[vehicleid] = true;
                    }
                    case 6:
                    {
                    if(IsPlayerInAnyVehicle(playerid))
                    {
                    new vehicleid = GetPlayerVehicleID(playerid);
                    StopAudioStreamForPlayer(playerid);
                    emisoraon[vehicleid] = false;
                    SendClientMessage(playerid,-1,"Apagaste tu radio.");
                    }
                }
            }
        }
    }
        case DIALOG_BANCO:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0:
                    {
                        ShowPlayerDialog(playerid, DIALOG_BANCODEPOSITAR, DIALOG_STYLE_INPUT, "Banco", "Ingrese la cantidad que desea depositar\n en su cuenta bancaria:", "Depositar", "Cancelar");
                    }
                    case 1:
                    {
                        new string[144];
                        format(string, sizeof(string), "Cantidad dinero en el banco:%d\t\nCuenta:%s\nIngrese la cantidad que desea retirar de su cuenta bancaria:",PlayerInfo[playerid][pBanco],pName(playerid));
                        ShowPlayerDialog(playerid, DIALOG_BANCORETIRAR, DIALOG_STYLE_INPUT, "Banco", string, "Retirar", "Cancelar");  
                    }    
                }
            }
        }
        case DIALOG_ACENTOS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: 
                    {
                        PlayerInfo[playerid][pAcento] = 1;
                    }
                    case 1: 
                    {
                        PlayerInfo[playerid][pAcento] = 2;
                    }
                    case 2: 
                    {
                        PlayerInfo[playerid][pAcento] = 3;
                    }
                    case 3: 
                    {
                        PlayerInfo[playerid][pAcento] = 4;
                    }
                    case 4: 
                    {
                        PlayerInfo[playerid][pAcento] = 5;
                    }
                    case 5:
                    {
                        PlayerInfo[playerid][pAcento] = 6;
                    }
                    case 6:
                    {
                        PlayerInfo[playerid][pAcento] = 7;
                    }
                    case 7:
                    {
                        PlayerInfo[playerid][pAcento] = 8;
                    }
                    case 8:
                    {
                        PlayerInfo[playerid][pAcento] = 9;
                    }
                    case 9:
                    {
                        PlayerInfo[playerid][pAcento] = 10;
                    }
                    case 10:
                    {
                        PlayerInfo[playerid][pAcento] = 11;
                    }
                    case 11:
                    {
                        PlayerInfo[playerid][pAcento] = 12;
                    }
                    case 12:
                    {
                        PlayerInfo[playerid][pAcento] = 13;
                    }
                    case 13:
                    {
                        PlayerInfo[playerid][pAcento] = 14;
                    }
                    case 14:
                    {
                        PlayerInfo[playerid][pAcento] = 15;
                    }
                    case 15:
                    {
                        PlayerInfo[playerid][pAcento] = 16;
                    }
                    case 16:
                    {
                        PlayerInfo[playerid][pAcento] = 17;
                    }
                    case 17:
                    {
                        PlayerInfo[playerid][pAcento] = 18;
                    }
                    case 18:
                    {
                        PlayerInfo[playerid][pAcento] = 19;
                    }
                }
            }
        }
        case DIALOG_ROPALSPD:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Ropa de alumno
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 1)
                        {
                            SCM(playerid,-1,"Te vestiste con la ropa de Alumno.");
                            SetPlayerSkin(playerid,71);
                        }
                    }
                    case 1: //Ropa de Oficial
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 2)
                        {
                            SCM(playerid,-1,"Te vestiste con la ropa de Oficial.");
                            SetPlayerSkin(playerid,300);
                        }
                    }
                    case 2: //Ropa de Agente
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 3)
                        {
                            SCM(playerid,-1,"Te vestiste con la ropa de Agente");
                            SetPlayerSkin(playerid,302);
                        }
                    }
                    case 3: //Ropa de Comisario
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 4)
                        {
                            SCM(playerid,-1,"Te vestiste con la ropa de Comisario.");
                            SetPlayerSkin(playerid,288);
                        }
                    }
                    case 4: //Ropa de sargento.
                    {
                        if(PlayerInfo[playerid][pPolicia] == 5)
                        {
                            SCM(playerid,-1,"Te vestiste con la ropa de Sargento.");
                            SetPlayerSkin(playerid,287);
                        }
                    }
                    case 5: // Anti disturbios
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 1)
                        {
                            SCM(playerid,-1,"Te vestiste con la ropa anti disturbios.");
                            SetPlayerSkin(playerid,285);
                        }
                    }
                    case 6: // Mujer
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 1)
                        {
                            SCM(playerid,-1,"Te vestiste con la ropa de mujer.");
                            SetPlayerSkin(playerid,306);
                        }
                    }
                }
            }
        }
        case DIALOGO_GPS1:
        {
            if(response)
            {
                switch(listitem)
                {   
                    case 0: //Trabajos
                    {
                        ShowPlayerDialog(playerid,DIALOGO_GPSTRABAJOS,DIALOG_STYLE_LIST, "Gps | Trabajos","Fedex\nArmero\nTransportista","Aceptar","Cerrar");
                    }
                    case 1: //Lugares Urbanos
                    {
                        ShowPlayerDialog(playerid,DIALOGO_GPSLUGARESURBANOS,DIALOG_STYLE_LIST, "Gps | Lugares Urbanos","El chalan\nFabrica De Armas","Aceptar","Cerrar");
                    }
                    case 2: //Lugares Publicos
                    {
                        ShowPlayerDialog(playerid,DIALOGO_GPSLUGARESPUBLICOS,DIALOG_STYLE_LIST, "Gps | Lugares Publicos ","Hospital\nPolicia\nBanco","Aceptar","Cerrar");
                    }
                    case 3: //Tiendas
                    {
                        ShowPlayerDialog(playerid,DIALOGO_GPSTIENDAS,DIALOG_STYLE_LIST, "Gps | Tiendas"," Oxxo unity\nOxxo Vinewood\nOxxo Commerce\nBinco.","Aceptar","Cerrar");
                    }
                    case 4: //Concesionarios
                    {
                        ShowPlayerDialog(playerid,DIALOGO_GPSCONCES,DIALOG_STYLE_LIST, "Gps | Concesionarios","Otto Cars","Aceptar","Cerrar");
                    }
                }
            }
        }
        case DIALOG_CONFIG:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Primera Persona
                    {
                        if(camaraon[playerid] == 0)
                        { 
                            camaraon[playerid] = 1;
                            SendClientMessage(playerid, -1, "{9ACD32}[SERVIDOR]: {00CED3}¡Has cambiado la cámara a primera persona!");
                            AttachObjectToPlayer(FPS[playerid], playerid, 0.0, 0.10, 0.65, 0.0, 0.0, 0.0);
                            AttachCameraToObject(playerid, FPS[playerid]);
                        }
                        else if(camaraon[playerid] == 1)
                        {
                            camaraon[playerid] = 0;
                            SendClientMessage(playerid, -1, "{9ACD32}[SERVIDOR]: {00CED3}¡Has cambiado la cámara a la normal!");
                            SetCameraBehindPlayer(playerid);
                        }
                    }
                    case 1:
                    {
                        if(anonimodb[playerid] == 1)
                        {
                            anonimodb[playerid] =0;
                            SCM(playerid,-1,"Tu nombre aparecera en la deep web");
                        }
                        else if(anonimodb[playerid] == 0)
                        {
                            anonimodb[playerid] =1;
                            SCM(playerid,-1,"Tu nombre no aparecera en la deep web");
                        }
                    }
                    case 2:
                    {
                        if(twitanonimo[playerid] == 1)
                        {
                            twitanonimo[playerid] =0;
                            SCM(playerid,-1,"Tu nombre aparecera en twitter");
                        }
                        else if(twitanonimo[playerid] == 0)
                        {
                            twitanonimo[playerid] =1;
                            SCM(playerid,-1,"Tu nombre no aparecera en twitter");
                        }   
                    }
                    case 3:
                    {
                        if(PlayerInfo[playerid][ChangesName] >= 1)
                        {
                            ShowPlayerDialog(playerid, DIALOG_CM, DIALOG_STYLE_INPUT, "Cambio de nombre", "Ingrese su nuevo nombre:", "Aceptar", "Cancelar");
                        }
                        else
                        {
                            SCM(playerid,-1,"Ya no te quedan cambios de nombre...");
                        }
                    }
                }
            }
        }
        case DIALOG_CM:
        {
            if(response)
            {
            new newname[24],oldname[24],avisostaff[64],msgplayerid[64];
            if(sscanf(inputtext,"s[24]",newname)) return TextdrawError(playerid, "USO: /nombre [Nombre nuevo]");
            GetPlayerName(playerid, oldname, sizeof(oldname));
            format(avisostaff,sizeof(avisostaff),"[Staff] %s[%d] cambio su nombre a %s",oldname,playerid,newname);
            SendMessageToAdmin(avisostaff);
            format(msgplayerid,sizeof(msgplayerid),"Antiguo nombre: %s nuevo nombre:%s",oldname,newname);
            SCM(playerid,-1,msgplayerid);
            SetPlayerName(playerid, newname);
            PlayerInfo[playerid][ChangesName] --;
            GuardarJugador(playerid);
            new confirm[64];
            format(confirm,sizeof(confirm),"Ahora te quedan %d oportunidades para cambiar tu nombre",PlayerInfo[playerid][ChangesName]);
            } 
        }
        case DIALOG_HPMENU:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Servicio Medico
                    {
                        if(PlayerInfo[playerid][pVip] == 1)
                        {
                            new Float:health;
                            GetPlayerHealth(playerid,health);
                            TogglePlayerControllable(playerid, false);
                            if(health > 99) return NoNeed(playerid);
                            timeruplife[playerid] = SetTimerEx("SubirVida", 2000, true, "if", playerid, health);
                            TP(playerid, 1169.980468,-1295.737304,705.749267);
                            ResetPlayerWeapons(playerid);
                            timerAbatido[playerid] = SetTimerEx("abatido", 2000, true, "i", playerid);
                            PlayerInfo[playerid][pDinero] -= 1000;
                        }
                        else 
                        {
                            new Float:health;
                            GetPlayerHealth(playerid,health);
                            TogglePlayerControllable(playerid, false);
                            if(health > 99) return NoNeed(playerid);
                            timeruplife[playerid] = SetTimerEx("SubirVida", 2000, true, "if", playerid, health);
                            TP(playerid, 1169.980468,-1295.737304,705.749267);
                            ResetPlayerWeapons(playerid);
                            timerAbatido[playerid] = SetTimerEx("abatido", 2000, true, "i", playerid);
                            PlayerInfo[playerid][pDinero] -= 1200;
                        }
                    }
                }
            } 
        }
        case DIALOG_MUERTE:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Pedir Medico
                    {
                        new name[MAX_PLAYER_NAME];
                        new str[256];
                        new zone[MAX_ZONE_NAME];
                        GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
                        GetPlayerName(playerid,name,sizeof(name));
                        format(str, sizeof(str), "[LSMD]%s Esta solicitando un medico en %s",name,zone);
                        MensajeMedicos(str);
                        foreach(new i : Player) if(PlayerInfo[i][pMedico] >= 1) SetPlayerMarkerForPlayer(i, playerid, 0x3399FFFF);
                    }
                    case 1: //Aceptar Muerte
                    {
                        new name[MAX_PLAYER_NAME];
                        new string2[256];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string2, sizeof(string2), "[LSMD]El paciente %s se ha desangrado fue trasladado a el hospital.",name);
                        MensajeMedicos(string2);
                        SetPlayerPos(playerid, 1172.678955,-1323.328369,15.402153);
                        TogglePlayerControllable(playerid, false);
                        PlayerInfo[playerid][pMuerto] = 1;
                        timerporhp[playerid] = SetTimerEx("AtendidoPorHP", 30000, false, "u", playerid);
                        KillTimer(timerAbatido[playerid]);
                    }
                }
            }
        }
        case DIALOGO_JUNTAS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Estadio
                    {
                        TP(playerid,1383.017333,2184.931640,11.023437);
                        new name[MAX_PLAYER_NAME];
                        new str[256];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(str, sizeof(str), "[Staff]{ff6529} %s se teletransporto al estadio con la funcion /juntas",name);
                        SendMessageToAdmin(str);
                    }
                    case 1: //Barco
                    {
                        TP(playerid,-2469.291503,1547.320678,36.804687);
                        new name[MAX_PLAYER_NAME];
                        new string2[256];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string2, sizeof(string2), "[Staff]{ff6529} %s se teletransporto al barco con la funcion /juntas",name);
                        SendMessageToAdmin(string2);
                    }
                }  
            }
        }
        case DialogoControl:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: // MOTOR
                    {
                        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                        {
                            SetTimerEx("encenderauto",3000, false,"i",playerid);
                        } 
                        else return SCM(playerid,-1,"No estas conduciendo un auto.");
                    }
                    case 1: // CAPO
                    {
                        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                        {
                            new car = GetPlayerVehicleID(playerid);
                            if(Capo[car] == 0)
                            {
                                GetVehicleParamsEx(car,engine, lights, alarm, doors, bonnet, boot, objective);
                                SetVehicleParamsEx(car, engine, lights, alarm, doors, 1, boot, objective);
                                Capo[car] = 1;
                                GameTextForPlayer(playerid,"~g~~h~Capo Abierto",1000,3);
                            } 
                            else 
                            {
                                GetVehicleParamsEx(car,engine, lights, alarm, doors, bonnet, boot, objective);
                                SetVehicleParamsEx(car, engine, lights, alarm, doors, 0, boot, objective);
                                Capo[car] = 0;
                                GameTextForPlayer(playerid,"~r~~h~Capo Cerrado",1000,3);
                            }
                        }
                        else return SCM(playerid,-1,"No estas conduciendo un auto.");
                    }
                    case 2: //BAUL
                    {
                        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                        {
                            new car = GetPlayerVehicleID(playerid);
                            if(Baul[car] == 0)
                            {
                                GetVehicleParamsEx(car,engine, lights, alarm, doors, bonnet, boot, objective);
                                SetVehicleParamsEx(car, engine, lights, alarm, doors, bonnet, 1, objective);
                                Baul[car] = 1;
                                GameTextForPlayer(playerid,"~g~~h~Maletero Abierto",1000,3);
                            } 
                            else if(Baul[car] == 1)
                            { 
                                GetVehicleParamsEx(car,engine, lights, alarm, doors, bonnet, boot, objective);
                                SetVehicleParamsEx(car, engine, lights, alarm, doors, bonnet, 0, objective);
                                Baul[car] = 0;
                                GameTextForPlayer(playerid,"~r~~h~Maletero Cerrado",1000,3);
                            }
                        }
                        else return SCM(playerid,-1,"No estas conduciendo un auto.");
                    }
                    case 3: // LUCES
                    {
                        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                        {
                            new car = GetPlayerVehicleID(playerid);
                            if(Luces[car] == 0)
                            {
                                GetVehicleParamsEx(car,engine, lights, alarm, doors, bonnet, boot, objective);
                                SetVehicleParamsEx(car, engine, 1, alarm, doors, bonnet, boot, objective);
                                Luces[car] = 1;
                                GameTextForPlayer(playerid,"~g~~h~Luces encendidas",1000,3);
                            } 
                            else 
                            {
                                GetVehicleParamsEx(car,engine, lights, alarm, doors, bonnet, boot, objective);
                                SetVehicleParamsEx(car, engine, 0, alarm, doors, bonnet, boot, objective);
                                Luces[car] = 0;
                                GameTextForPlayer(playerid,"~r~~h~Luces apgagadas",1000,3);
                            }
                        }
                        else return SCM(playerid,-1,"No estas conduciendo un auto.");
                    }
                    case 4:
                    {
						if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
                        {
                    		ShowPlayerDialog(playerid,DIALOG_EMISORAS, DIALOG_STYLE_LIST, "Emisoras disponibles.","Los 40\nCadena 3\nLa popu\nKiss FM\nLa mega\nRadio RFM max\nApagar emisora", "Sintonizar", "Cerrar");
                    	}
                    }
                }
            }
        }
        case DIALOG_TIENDA_VIP:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //vender latin coins
                    {
                        if(PlayerInfo[playerid][LatinCoins] >= 1)
                        {
                            PlayerInfo[playerid][pDinero] += 250000;
                            PlayerInfo[playerid][LatinCoins] -= 1;
                        }
                        else return SCM(playerid, -1, "No tienes [x1] LatinCoins");
                    }
                    case 1: //Comprarvip
                    {
                        if(PlayerInfo[playerid][LatinCoins] >= 5)
                        {
                            PlayerInfo[playerid][LatinCoins] -= 5;  
                            PlayerInfo[playerid][pVip] = 1;
                            GameTextForPlayer(playerid,"Felicidades Ya eres vip",5000,5);
                        }
                        else return SCM(playerid,-1,"Debes de tener 5 latincoins para comprar el VIP.");
                    }
                }
            }
        }
        case DIALOG_MUSIC:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //BlackBear
                    {
                        foreach(new i : Player)
                        {
                            PlayAudioStreamForPlayer(i, "https://sndup.net/53sw/blackbear+-+fashion+week.mp3");
                        }
                        new name[MAX_PLAYER_NAME];
                        new str[256];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(str, sizeof(str), "[Anuncios Staff]%s esta reproduciendo la cancion: Fashion Week",name);
                        SendClientMessageToAll(COLOR_ROJO,str);
                    }
                    case 1: //Give me your cum
                    {
                        foreach(new i : Player)
                        {
                            PlayAudioStreamForPlayer(i, "https://sndup.net/44d4/Give+me+your+cum.mp3");
                        }
                        new name[MAX_PLAYER_NAME];
                        new string2[256];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string2, sizeof(string2), "[Anuncios Staff]%s esta reproduciendo la cancion: Give me your cum",name);
                        SendClientMessageToAll(COLOR_ROJO,string2);
                    }
                    case 2: //Salio el sol
                    {
                        foreach(new i : Player)
                        {
                            PlayAudioStreamForPlayer(i, "https://sndup.net/52xv/Salio+el+sol+remix.mp3");
                        }
                        new name[MAX_PLAYER_NAME];
                        new string2[256];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string2, sizeof(string2), "[Anuncios Staff]%s esta reproduciendo la cancion: Salio el soool",name);
                        SendClientMessageToAll(COLOR_ROJO,string2);
                    }
                    case 3: //The banjo beat
                    {
                        foreach(new i : Player)
                        {
                            PlayAudioStreamForPlayer(i, "https://sndup.net/2c8p/THE+BANJO+BEAT.mp3");
                        }
                        new name[MAX_PLAYER_NAME];
                        new string2[256];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string2, sizeof(string2), "[Anuncios Staff]%s esta reproduciendo la cancion: The banjo beat",name);
                        SendClientMessageToAll(COLOR_ROJO,string2);
                    }
                    case 4: // Ayer me llamo mi ex
                    {
                        for(new i; i < MAX_PLAYERS; i++)
                        {
                            PlayAudioStreamForPlayer(i, "https://sndup.net/9syj/Ayer+Me+LLam%C3%B3+Mi+Ex.mp3");
                        }
                        new name[MAX_PLAYER_NAME];
                        new string2[256];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string2, sizeof(string2), "[Anuncios Staff]%s esta reproduciendo la cancion: The banjo beat",name);
                        SendClientMessageToAll(COLOR_ROJO,string2);
                    }
                }
            }
        }
        case DIALOGO_TP:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //LSPD
                    {
                        SetPlayerPos(playerid,1539.870849,-1675.413330,13.549486);
                        new name[MAX_PLAYER_NAME];
                        new string[128];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string, sizeof(string), "[Staff]{ff6529} %s se teletransporto a LSPD con la funcion /tp.",name);
                        SendMessageToAdmin(string);
                    }
                    case 1: //Hospital(Ganton)
                    {
                        SetPlayerPos(playerid, 2034.523315,-1409.273681,17.164062);
                        new name[MAX_PLAYER_NAME];
                        new string[128];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string, sizeof(string), "[Staff]{ff6529} %s se teletransporto al Hospital de Ganton con la funcion /tp.",name);
                        SendMessageToAdmin(string);
                    }
                    case 2: //Hospital(central)
                    {
                        SetPlayerPos(playerid, 1172.678955,-1323.328369,15.402153);
                        new name[MAX_PLAYER_NAME];
                        new string[256];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string, sizeof(string), "[Staff]{ff6529} %s se teletransporto al Hospital Central con la funcion /tp.",name);
                        SendMessageToAdmin(string);
                    }
                    case 3: //Spawn
                    {
                        SetPlayerPos(playerid, 1702.620849,-1851.958251,13.564262);
                        new name[MAX_PLAYER_NAME];
                        new string[144];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string, sizeof(string), "[Staff]{ff6529} %s se teletransporto al spawn con la funcion /tp.",name);
                        SendMessageToAdmin(string);
                    }
                    case 4: // CONCESIONARIO DE EAST LOS SANTOS
                    {
                        SetPlayerPos(playerid, 2413.206787,-1544.566284,23.793006);
                        new name[MAX_PLAYER_NAME];
                        new string[144];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string, sizeof(string), "[Staff]{ff6529} %s se teletransporto al Concesionario De East Los Santos con la funcion /tp.",name);
                        SendMessageToAdmin(string);
                    }
                    case 5: //MERCADONEGRO 1
                    {
                        SetPlayerPos(playerid,2483.389404,-1293.238647,30.336767);
                        new name[MAX_PLAYER_NAME];
                        new string1[144];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(string1, sizeof(string1), "[Staff]{ff6529} %s se teletransporto al Mercado Negro con la Funcion /tp.",name);
                        SendMessageToAdmin(string1);
                    }
                    case 6: //MERCADONEGRO2
                    {
                        SetPlayerPos(playerid,2405.0063, -1033.5554, 612.1299);
                        new name[MAX_PLAYER_NAME];
                        new str3[144];
                        GetPlayerName(playerid,name,sizeof(name));
                        format(str3, sizeof(str3), "[Staff]{ff6529} %s se teletransporto al Mercado Negro 2 con la funcion /tp.",name);
                        SendMessageToAdmin(str3);
                    }
                    case 7: //Click Mapa
                    {
                        new string[144];
                        format(string, sizeof(string), "Puedes abrir el mapa, clickear y te teletransportaras.");
                        SendClientMessage(playerid, -1, string);
                    }
                }
            }
        }
        case DIALOGO_POLICIA:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Porra
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 1)
                        {
                            GivePlayerWeapon(playerid, 3, 1);
                        }
                    }
                    case 1: // Taser
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 1)
                        {
                        GivePlayerWeapon(playerid, 23, 150);
                        }
                    }
                    case 2: //Desert-Eagle
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 1)
                        {
                            GivePlayerWeapon(playerid, 24, 250);
                        }
                    }
                    case 3: //MP5
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 2)
                        {
                            GivePlayerWeapon(playerid, 29, 150);
                        }
                    }
                    case 4: //M4
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 2)
                        {
                            GivePlayerWeapon(playerid, 31, 250);
                        }
                    }
                    case 5: //EDC
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 2)
                        {
                            GivePlayerWeapon(playerid, 27, 250);
                        }
                    }
                    case 6: //Sniper
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 3)
                        {
                            GivePlayerWeapon(playerid, 34, 250);
                        }
                    }
                    case 7: //Chaleco
                    {
                        if(PlayerInfo[playerid][pPolicia] >= 1)
                        {
                            SetPlayerArmour(playerid,100);
                        }
                    }
                }
            }
        }
        case DIALOGO_GPSCONCES:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Otto Cars
                    {
                        SetPlayerCheckpoint(playerid,-1638.757202,1211.052978,7.039062,5.0);
                    }
                }
            }
        }
        case DIALOGO_GPSTRABAJOS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Fedex
                    {
                        SetPlayerCheckpoint(playerid,CPPEDIRTRABAJO,5.0);
                    }
                    case 1: //Armero
                    {
                        SetPlayerCheckpoint(playerid,CPTRABAJOARMERO,5.0);
                    }
                    case 2: //Transportista
                    {
                        SetPlayerCheckpoint(playerid,CPPEDIRTRABAJOTRANSPORTISTA,5.0);
                    }
                }
            }
        }
        case DIALOGO_V1:
        {
            if(response)
            {
                if(PlayerInfo[playerid][pDinero] < 150000) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar Este auto");
                PlayerInfo[playerid][pDinero] -= 150000;
                GameTextForPlayer(playerid,"?Felicidades Compraste un Euros \n precio: 150.000$",5000,5);
                TogglePlayerControllable(playerid, true);
                new vehicleid = GetPlayerVehicleID(playerid);
                CreateVehicle(587,-1632.2871, 1202.9672, 7.0347, 319.2133, -1, -1, 0);
                SetPlayerPos(playerid,-1632.2871, 1202.9672, 7.0347);
                PutPlayerInVehicle(playerid, vehicleid, 1);
            }
            else
            {
                SendClientMessage(playerid,-1,"Cancelaste tu compra");
                TogglePlayerControllable(playerid, true);
            }
        }
        case DIALOGO_V2:
        {
            if(response)
            {
                if(PlayerInfo[playerid][pDinero] < 170000) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar este auto");
                new modelid = GetPlayerVehicleID(playerid);
                SetVehiclePos(560,-1632.2871, 1202.9672, 7.0347);
                SetPlayerPos(playerid,-1632.2871, 1202.9672, 7.0347);
                PlayerInfo[playerid][pDinero] -= 170000;
                GameTextForPlayer(playerid,"?Felicidades Compraste un Sultan \n precio: 150.000$",5000,5);
                TogglePlayerControllable(playerid, true);
                PutPlayerInVehicle(playerid, modelid, 1);
                CreateVehicle(560, -1632.2871, 1202.9672, 7.0347, 319.2133, -1, -1,0);
            }
            else
            {
                SendClientMessage(playerid,-1,"Cancelaste tu compra");
                TogglePlayerControllable(playerid, true);
            }
        }
        case DIALOGO_AYUDA:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Trabajos
                    {
                        ShowPlayerDialog(playerid,DIALOGO_AYUDATRABAJOS,DIALOG_STYLE_LIST, "Ayuda | Trabajos ","{005EF7}->{FFFFFF} FEDEX \n{005EF7}->{FFFFFF} Armero \n{005EF7}->{FFFFFF} Transportista","Aceptar","Cerrar");
                    }
                    case 1: // Vehiculos
                    {
                        ShowPlayerDialog(playerid,AYUDAVEHICULOS,DIALOG_STYLE_MSGBOX, "Ayuda | Vehiculos ","Puedes usar la tecla N para abrir el panel de control de autos \n Puedes Encender Apagar Abrir o cerrar capo y maltero.","Aceptar","Cerrar");
                    }
                    case 2: //Comandos
                    {
                        ShowPlayerDialog(playerid,AYUDACOMANDOS,DIALOG_STYLE_MSGBOX, "Ayuda | Comandos ","Comandos de rol: \n{005EF7}->{FFFFFF} /me /do /entorno /ame /dudaentorno \n Comandos Generales: \n  /duda /twit /deepweb /ad /ad1.","Aceptar","Cerrar");
                    }
                    case 3: //Informacion
                    {
                        ShowPlayerDialog(playerid,AYUDAINFORMACION,DIALOG_STYLE_MSGBOX, "Ayuda | Informacion","{FFFFFF}El servidor aun esta en fase {25EF53}[BETA]{FFFFFF} estamos en proceso... Habran mas actualizaciones para el servidor disfruta del servior","Aceptar","Cancelar");
                    }
                }
            }
        }
        case DIALOG_UPDATES:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Update v0.1
                    {
                        ShowPlayerDialog(playerid, DIALOG_UPDATES1, DIALOG_STYLE_MSGBOX,"Actualizaciones | LatinRP","v0.3\nSistema de sacar y guardar autos mediante comandos\n\nv0.3\nSe implementaron los latincoins en una version beta\n\nv0.3\nYa se implemento un mini sistema de robo a tiendas","Aceptar","Cancelar");
                    }
                    case 1:
                    {
                        ShowPlayerDialog(playerid, DIALOG_UPDATES2, DIALOG_STYLE_MSGBOX, "Actualizaciones | LatinRP","v0.4\nNuevo iphone totalmente interactivo\n\nv0.4\nTableta de entretenimiento.\n\nv0.4\nSistema de guardado y cargado de autos funcional\n\nv0.4\nSistema de Deep Web funcional desde el Iphone\n\nv0.4\nDeepweb y twitter anonimos con /config y desde el iphone","Aceptar","Cancelar");
                    }
                }
            }
        }
        case DIALOGO_AYUDATRABAJOS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Trabajos
                    {
                        ShowPlayerDialog(playerid, DIALOGO_AYUDAFEDEX, DIALOG_STYLE_MSGBOX, "AYUDA || TRABAJOS || FedEX", "{005EF7}->{FFFFFF} Usa /gps --> Trabajos --> Fedex una vez alli Pulsa Y Para Trabajar \n Toma Un Camion De Fedex Y Ve A La Zona De Carga, Cuando Estes ahi pulsa Y En La Zona De Carga Escoje Un Recorrido \n Una Vez llegue ahi y regreses con el camion recibiras tu paga.", "Aceptar", "Cancelar");
                    }
                    case 1:
                    {
                        ShowPlayerDialog(playerid, DIALOGO_AYUDAFEDEX, DIALOG_STYLE_MSGBOX, "AYUDA || TRABAJOS || Armero", "{005EF7}->{FFFFFF} Usa /gps --> Trabajos --> Armero una vez alli Pulsa Y Para Trabajar, Ve A La Fabrica La Cual Esta En /gps --> Lugares Urbanos --> Fabrica De Armas Puedes Fabricar Unas Armas Y Venderlas.", "Aceptar", "Cancelar");
                    }
                    case 2:
                    {
                        ShowPlayerDialog(playerid, DIALOGO_AYUDATRANSPORTISTA, DIALOG_STYLE_MSGBOX, "AYUDA || TRABAJOS || Transportista", "{005EF7}->{FFFFFF} Usa /gps --> Trabajos --> Transportista una vez alli Pulsa Y Para Trabajar, Ve A La Zona de carga para cargar tu camion.", "Aceptar", "Cancelar");
                    }
                }
            }
        }
        case RECORRIDOSFEDEX:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Entrega Videojuegos
                    {
                        SetPlayerCheckpoint(playerid,CPFEDEXRECORRIDOuno,5.0);
                        SetTimer("CargaCamion", 3500,false);
                        TogglePlayerControllable(playerid, false);
                        GameTextForPlayer(playerid,"Cargando Camion...",3500,3);
                    }
                    case 1: //productos Oxxo
                    {
                        SetPlayerCheckpoint(playerid,CPFEDEXRECORRIDOdos,5.0);
                        SetTimer("CargaCamion", 3500, false);
                        TogglePlayerControllable(playerid, false);
                        GameTextForPlayer(playerid,"Cargando Camion...",3500,3);
                    }
                    case 2: //Entrega Verduras congeladas
                    {
                        SetPlayerCheckpoint(playerid,CPFEDEXRECORRIDOtres,5.0);
                        GameTextForPlayer(playerid,"Cargando Camion...",3500,3);
                        SetTimer("CargaCamion", 3500, false);
                        TogglePlayerControllable(playerid, false);
                    }
                    case 3: //medicamentos
                    {
                        SetPlayerCheckpoint(playerid,CPFEDEXRECORRIDOcuatro,5.0);
                        GameTextForPlayer(playerid,"Cargando Camion...",3500,3);
                        SetTimer("CargaCamion", 3500, false);
                        TogglePlayerControllable(playerid, false);
                    }
                    case 4: //Papeles ayuntamiento
                    {
                        SetPlayerCheckpoint(playerid,CPFEDEXRECORRIDOcinco,5.0);
                        GameTextForPlayer(playerid,"Cargando Camion...",3500,3);
                        SetTimer("CargaCamion", 3500, false);
                        TogglePlayerControllable(playerid, false);
                    }
                     case 5: //Inventario Casinos
                    {
                        SetPlayerCheckpoint(playerid,CPFEDEXRECORRIDOseis,5.0);
                        GameTextForPlayer(playerid,"Cargando Camion...",3500,3);
                        SetTimer("CargaCamion", 3500, false);
                        TogglePlayerControllable(playerid, false);
                    }
                }
            }
        }
        case RECORRIDOSTRANSPORTISTA:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Piezas de auto
                    {
                        SetPlayerCheckpoint(playerid,CPTRANSPORTISTARECORRIDO1,5.0);
                        SetTimer("CargaCamion", 3500, false);
                        TogglePlayerControllable(playerid, false);
                        GameTextForPlayer(playerid,"Cargando Camion...",3500,3);
                    }
                    case 1: //Microfonos
                    {
                        SetPlayerCheckpoint(playerid,CPTRANSPORTISTARECORRIDO2,5.0);
                        SetTimer("CargaCamion", 3500, false);
                        TogglePlayerControllable(playerid, false);
                        GameTextForPlayer(playerid,"Cargando Camion...",3500,3);
                    }
                    case 2: //Auto Deportivo
                    {
                        SetPlayerCheckpoint(playerid,CPTRANSPORTISTARECORRIDO3,5.0);
                        GameTextForPlayer(playerid,"Cargando Camion...",3500,3);
                        SetTimer("CargaCamion", 3500, false);
                        TogglePlayerControllable(playerid, false);
                    }
                }
            }
        }
        case DIALOGO_GPSLUGARESURBANOS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: // Casa del cholo
                    {
                        SetPlayerCheckpoint(playerid,2483.389404,-1293.238647,30.336767 , 3.0);
                    }
                    case 1: // Fabrica
                    {
                        SetPlayerCheckpoint(playerid,CPENTRADAFABRICA, 3.0);
                    }
                }
            }
        }
        case DIALOGO_COMPRAS:
        {
            if(response)
            {
               switch(listitem)
                {
                    case 0: //Gps
                    {
                        PlayerInfo[playerid][pDinero] -= 500;
                        PlayerInfo[playerid][pGps] = 1;
                        SCM(playerid,-1,"[Vendedor] El Gps le costo 500$.");
                    }
                    case 1: // Spray
                    {
                        GivePlayerWeapon(playerid, 41, 2000);
                        PlayerInfo[playerid][pDinero] -= 600;
                        SCM(playerid,-1,"[Vendedor] El Spray le costo 600$.");
                    }
                } 
            }
        }
        case DIALOGO_GPSLUGARESPUBLICOS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Hospital
                    {
                        SetPlayerCheckpoint(playerid,1190.235961,-1325.712646,13.234524, 3.0);//cambiar cordenadas
                    }
                    case 1: //LSPD
                    {
                        SetPlayerCheckpoint(playerid,1539.870849,-1675.413330,13.549486, 3.0);
                    }
                    case 2: // Banco
                    {
                        SetPlayerCheckpoint(playerid,1092.079589,-1154.635131,23.828125, 3.0);
                    }
                }
            }
        }
        case DIALOGO_GPSTIENDAS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Oxxo unity
                    {
                        SetPlayerCheckpoint(playerid,1830.872558,-1842.831542,13.578125, 4.0);
                    }
                    case 1: //Oxxo Vinewood
                    {
                        SetPlayerCheckpoint(playerid,1313.195068,-917.556823,38.377235, 4.0);
                    }
                        case 2: //Oxxo Commerce
                    {
                        SetPlayerCheckpoint(playerid,1348.366088,-1748.834960,13.037858, 4.0);
                    }
                    case 3: //Binco
                    {
                        SetPlayerCheckpoint(playerid,2244.317871,-1665.547485,15.476562, 4.0);
                    }
                }
            }
        }
        case DIALOGO_ARMERO:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Desert-Eagle
                    {
                        GivePlayerWeapon(playerid,24,150);
                    }
                    case 1: //EDC
                    {
                        GivePlayerWeapon(playerid,27,150);
                    }
                    case 2: //M4
                    {
                        GivePlayerWeapon(playerid,31,250);
                    }
                    case 3: //Recortada
                    {
                        GivePlayerWeapon(playerid,26,150);
                    }
                    case 4: //Tec9
                    {
                        GivePlayerWeapon(playerid,32,200);
                    }
                    case 5: //Rifle De Caza
                    {
                        GivePlayerWeapon(playerid,33,150); //rifle
                    }
                }
            }
        }
        case DIALOGO_ARMAS1:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //DK
                    {
                        if(PlayerInfo[playerid][pDinero] < 4001) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar La Desert-Eagle");
                        PlayerInfo[playerid][pDinero] -= 4000;
                        GivePlayerWeapon(playerid, 24,250);
                    }
                    case 1: //RIFLE DE CAZA
                    {
                        if(PlayerInfo[playerid][pDinero] < 15001) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar El Rifle De Caza");
                        PlayerInfo[playerid][pDinero] -= 15000;
                        GivePlayerWeapon(playerid, 33,250);
                    }
                    case 2: //RECORTADA
                    {
                        if(PlayerInfo[playerid][pDinero] < 8001) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar La Recortada");
                        PlayerInfo[playerid][pDinero] -= 8000;
                        GivePlayerWeapon(playerid, 26,200);
                    }
                    case 3: //TEC9
                    {
                        if(PlayerInfo[playerid][pDinero] < 6501) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar La TEC9");
                        PlayerInfo[playerid][pDinero] -= 6500;
                        GivePlayerWeapon(playerid, 32,250);
                    }
                    case 4: //CHALECO
                    {
                        if(PlayerInfo[playerid][pDinero] < 10001) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar EL Chaleco Antibalas");
                        PlayerInfo[playerid][pDinero] -= 10000;
                        SetPlayerArmour(playerid,100);
                    }
                }
            }
        }
        case DIALOGO_ARMAS2:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0: //Sniper
                    {
                        if(PlayerInfo[playerid][pDinero] < 50001) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar El Sniper");
                        PlayerInfo[playerid][pDinero] -= 50000;
                        GivePlayerWeapon(playerid, 34,250);
                    }
                    case 1: //EDC
                    {
                        if(PlayerInfo[playerid][pDinero] < 40001) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar La EDC");
                        PlayerInfo[playerid][pDinero] -= 40000;
                        GivePlayerWeapon(playerid, 27,250);
                    }
                    case 2: //ak-47
                    {
                        if(PlayerInfo[playerid][pDinero] < 25001) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar La Ak-47");
                        PlayerInfo[playerid][pDinero] -= 25000;
                        GivePlayerWeapon(playerid, 30,250);
                    }
                    case 3: //M4
                    {
                        if(PlayerInfo[playerid][pDinero] < 25001) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para pagar Esta M4");
                        PlayerInfo[playerid][pDinero] -= 25000;
                        GivePlayerWeapon(playerid, 31,250);
                    }
                }
            }
        }
        case DIALOG_COMPRARBOTIS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0:
                    {
                        if(PlayerInfo[playerid][pDinero] < 1500) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para Comprar 1 Botiquin");
                        PlayerInfo[playerid][pBotis] += 1;
                        SCM(playerid,-1,"Compraste 1 Botiquin");
                        PlayerInfo[playerid][pDinero] -= 1500;
                    }
                    case 1:
                    {
                        if(PlayerInfo[playerid][pDinero] < 5000) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para Comprar 5 Botiquines");
                        PlayerInfo[playerid][pBotis] += 5;
                        SCM(playerid,-1,"Compraste 5 Botiquines");
                        PlayerInfo[playerid][pDinero] -= 5000;
                    }
                }
            }
        }
        case DIALOG_COMPRARMEDICAMENTOS:
        {
            if(response)
            {
                switch(listitem)
                {
                    case 0:
                    {
                        if(PlayerInfo[playerid][pDinero] < 1000) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para Comprar 5 Medicamentos");
                        PlayerInfo[playerid][pMedicamentos] += 5;
                        SCM(playerid,-1,"Compraste 5 Medicamentos");
                        PlayerInfo[playerid][pDinero] -= 1000;
                    }
                    case 1:
                    {
                        if(PlayerInfo[playerid][pDinero] < 1500) return SendClientMessage(playerid, 0xFFFFFF, "Usted no tiene suficiente dinero para Comprar 10 Medicamentos");
                        PlayerInfo[playerid][pMedicamentos] += 10;
                        SCM(playerid,-1,"Compraste 10 Medicamentos");
                        PlayerInfo[playerid][pDinero] -= 2000;
                    }
                }
            }
        }
        case DIALOG_BANCODEPOSITAR:
        {
            if(response)
            {
                new dinerodepositado;
                if(sscanf(inputtext, "i", dinerodepositado)) return ShowPlayerDialog(playerid, DIALOG_BANCODEPOSITAR, DIALOG_STYLE_INPUT, "Banco", "Error: ingrese un monto valido. \n(Caracteres aceptados: 1, 2, 3, 4, 5, 6, 7, 8, 9, 0)", "Depositar", "Cancelar");
                new msg1[256]; //
                new name[MAX_PLAYER_NAME];
                if(dinerodepositado > PlayerInfo[playerid][pDinero]) return SendClientMessage(playerid, -1, "Error : No tienes esa cantidad de dinero");
                if(dinerodepositado <= 0) return SendClientMessage(playerid, -1, "Error: monto invalido.");
                PlayerInfo[playerid][pDinero] -= dinerodepositado;
                GetPlayerName(playerid, name, sizeof(name));
                format(msg1, sizeof(msg1), " {9933FF}*%s deposito %i$ en el banco*",name,dinerodepositado);
                SendClientMessageToNearby(playerid, -1, 10.0, msg1);
                PlayerInfo[playerid][pDinero] -= dinerodepositado;
                PlayerInfo[playerid][pBanco] += dinerodepositado;
            } 
        }
        case DIALOG_BANCORETIRAR:
        {
            if(response)
            {
                new dineroretirado = strval(inputtext); 
                new msg2[256],name[MAX_PLAYER_NAME];
                if(dineroretirado > PlayerInfo[playerid][pBanco]) return SendClientMessage(playerid, -1, "Error : No tienes esa cantidad de dinero en el banco.");
                if(dineroretirado <= 0) return SendClientMessage(playerid, -1, "Error: monto invalido.");
                PlayerInfo[playerid][pDinero] += dineroretirado;
                GetPlayerName(playerid, name, sizeof(name));
                format(msg2, sizeof(msg2), "*%s retiro %i de el banco*",name, dineroretirado);
                SendClientMessageToNearby(playerid, -1, 10.0, msg2);
                PlayerInfo[playerid][pDinero] += dineroretirado;
                PlayerInfo[playerid][pBanco] -= dineroretirado;
            }
        }
        case DIALOG_CREATEDNI:
        {
            if(response)
            {
                format(PlayerInfo[playerid][pFecha], 128, "%s", inputtext);
                ShowPlayerDialog(playerid,DIALOG_CREATEDNI2,DIALOG_STYLE_INPUT, "Ayuntamiento | Dni", "Ingresa tu edad:","Aceptar", "Cancelar");
            } 
        }
        case DIALOG_CREATEDNI2:
        {
            if(response)
            {
                //new edad = strval(inputtext);
                new edad;
                if(sscanf(inputtext, "i", edad)) return ShowPlayerDialog(playerid,DIALOG_CREATEDNI2,DIALOG_STYLE_INPUT, "Ayuntamiento | Dni", "Edad invalida, intenta otra vez:","Aceptar", "Cancelar");
                new string[128];
                format(string, sizeof(string), "Edad: %i",edad);
                SCM(playerid,-1,string);
                PlayerInfo[playerid][pEdad] = edad;
                ShowPlayerDialog(playerid, DIALOG_CREATEDNI3,DIALOG_STYLE_INPUT, "Ayuntamiento | DNI", "Ingrese el lugar de donde viene", "Aceptar", "Caneclar");
            }
        }
        case DIALOG_CREATEDNI3:
        {
            if(response)
            {
                format(PlayerInfo[playerid][pLugar],128, "%s", inputtext);
                SCM(playerid,-1,"Dni creado correctamente.");
                PlayerInfo[playerid][pDNI] = 1;
                PlayerInfo[playerid][pDinero] -= 600;
                SCM(playerid,-1,"El costo del dni fue de 600$");
            }
        }
        case DIALOG_ESTADO:
        {
            if(response)
            {
                new str[128];
                if(sscanf(inputtext, "s[64]", str)) return ShowPlayerDialog(playerid,DIALOG_ESTADO,DIALOG_STYLE_INPUT,"Estado","Escribe tu estado:","Aceptar","Cancelar");
                format(str, sizeof(str), "%s", inputtext);
                Update3DTextLabelText(estado[playerid], 0xEAD055FF, str);
                Attach3DTextLabelToPlayer(estado[playerid], playerid, 0.0, 0.0, 5.0);
                PlayerInfo[playerid][pUsingText] = true;
                if(PlayerInfo[playerid][pUsingText] == false)
                {
                    PlayerInfo[playerid][pTextState] = CreateDynamic3DTextLabel(str, 0xFFFFFFFF, 0.0, 0.0, 100.0, 10.0);
                    Attach3DTextLabelToPlayer(estado[playerid], playerid, 0.0, 0.0, 5.0);
                }
                else if(PlayerInfo[playerid][pUsingText] == true)
                {
                    DestroyDynamic3DTextLabel(estado[playerid]);
                }
            }
        }
        case DIALOG_REGISTRO:
        {
            if(response)
            {
                new encript[129];
                SCM(playerid, VERDECLARO, "Bien!{FFFFFF} Continuemos con el registro.");
                ShowPlayerDialog(playerid, DIALOG_GENERO, DIALOG_STYLE_MSGBOX, "Registro | Genero", "Seleccione su genero.", "Masculino", "Femenino");
                WP_Hash(encript, sizeof(encript), inputtext);
                PlayerInfo[playerid][pContra] = encript;
            }
            else return Kick(playerid);
        }
        case DIALOG_GENERO:
        {
            if(response)
            {
                PlayerInfo[playerid][pGenero] = 0;
                PlayerInfo[playerid][pRopa] = 250;
                SCM(playerid,-1,"Has seleccionado {FFFF00}masculino{FFFFFF}.");
                ShowPlayerDialog(playerid, DIALOG_EDAD, DIALOG_STYLE_INPUT, "Registro | Edad", "Ingrese su edad\n\nMinimo 18 - Maximo 90.", "Continuar", "Cancelar");
            }
            else
            {
                PlayerInfo[playerid][pGenero] = 1;
                PlayerInfo[playerid][pRopa] = 12;
                SCM(playerid,-1,"Has seleccionado {FFFF00}femenino{FFFFFF}.");
                ShowPlayerDialog(playerid, DIALOG_EDAD, DIALOG_STYLE_INPUT, "Registro | Edad", "Ingrese su edad\n\nMinimo 18 - Maximo 90.", "Continuar", "Cancelar");
            }
        }
        case DIALOG_EDAD:
        {
            if(response)
            {
                new edad;
                if(sscanf(inputtext, "i", edad)) return ShowPlayerDialog(playerid, DIALOG_EDAD, DIALOG_STYLE_INPUT, "Registro | Edad", "Ingrese su edad\n\nMinimo 18 - Maximo 100.", "Continuar", "Cancelar");
                if(edad < 18 || edad > 100) return ShowPlayerDialog(playerid, DIALOG_EDAD, DIALOG_STYLE_INPUT, "Registro | Edad", "Ingrese su edad\n\nMinimo 18 - Maximo 100.", "Continuar", "Cancelar");
                PlayerInfo[playerid][pEdad] = edad;
                SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pRopa],1296.033935,-1866.021850,13.549837, 0.0000, 0,0,0,0,0,0); // Cambiar cordenadas B)
                SetPVarInt(playerid, "PuedeIngresar", 1);
                SpawnPlayer(playerid);
                CrearCuenta(playerid);
            }
            else return Kick(playerid);
        }
        case DIALOG_INGRESO:
        {
            if(response)
            {
                new encript[129];
                WP_Hash(encript, sizeof(encript), inputtext);
                if(!strcmp(encript, PlayerInfo[playerid][pContra], true))
                {
                    new query[656];
                    mysql_format(MySQL,query,sizeof(query),"SELECT * FROM `cuentas` WHERE `Nombre`='%s'", NombreJugador(playerid));
                    mysql_pquery(MySQL, query, "IngresoJugador","d", playerid);
                }

                else return ShowPlayerDialog(playerid, DIALOG_INGRESO, DIALOG_STYLE_PASSWORD, "Login","{FFFFFF}Bienvenido nuevamente a {ff6529}LatinRP{FFFFFF}\nPassword invalida, intenta otra vez.", "Continuar", "Cancelar");
            }
            else return Kick(playerid);
        }
    }
    return 1;
}
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
    new str[128];
    new nombre[MAX_PLAYER_NAME];
    if(clickedplayerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "Error: {15FF00}id de jugador invalida.");
    GetPlayerName(clickedplayerid, nombre, sizeof(nombre));
    GetPlayerScore(clickedplayerid);
    format(str, sizeof(str), "ID DB:%d | ID:%d | Nombre:%s | Nivel:%d | Ping:%i | P: %.2f", PlayerInfo[clickedplayerid][mID],clickedplayerid, nombre, GetPlayerScore(clickedplayerid), GetPlayerPing(clickedplayerid), NetStats_PacketLossPercent(clickedplayerid));
    SendClientMessage(playerid,-1, str);
    return 1;
}
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
    if(issuerid != INVALID_PLAYER_ID && weaponid == 23)
    {
    SetPlayerChatBubble(playerid, "\n\n\n\n* Cae al piso al recibir el choque eléctrico de un tazer.\n\n\n", 0x13CBECFF, 20.0, 5000);
    TogglePlayerControllable(playerid, false);
    SetTimer("descongelar",3000, false);
    ApplyAnimation(playerid,"PED","BIKE_fallR",4.0,0,1,1,1,0);
    GameTextForPlayer(playerid, "~y~Te dieron una descarga electrica con un Tazer.",3000,3);
    }
    return 1;
}
public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if(_:playertextid != INVALID_TEXT_DRAW)
    {
        if(playertextid == Close[playerid])
        {
            HidePlayerDni(playerid);
        }
    }
    return 1;
}
public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(_:clickedid != INVALID_TEXT_DRAW)
    {
        if(clickedid == CajaSelect)
        {
            Dialog_Show(playerid, DialogSkin, DIALOG_STYLE_MSGBOX, "Advertencia", "Estas seguro de que quieres comprar este ropa?", "Si", "No");
        }
        if(clickedid == CajaDerecha)
        {
            PlayerInfo[playerid][FakeSkin] ++;
            if(PlayerInfo[playerid][FakeSkin] > 311) PlayerInfo[playerid][FakeSkin] = 1;
            if(PlayerInfo[playerid][FakeSkin] < 1) PlayerInfo[playerid][FakeSkin] = 311;
            SetPlayerSkin(playerid, PlayerInfo[playerid][FakeSkin]);
        }
        if(clickedid == CajaIzquierda)
        {
            PlayerInfo[playerid][FakeSkin] --;
            if(PlayerInfo[playerid][FakeSkin] > 311) PlayerInfo[playerid][FakeSkin] = 1;
            if(PlayerInfo[playerid][FakeSkin] < 1) PlayerInfo[playerid][FakeSkin] = 311;
            SetPlayerSkin(playerid, PlayerInfo[playerid][FakeSkin]);
        }
    }
    else 
    {
        if(PlayerInfo[playerid][SelectingSkin] == true)
        {
            SetCameraBehindPlayer(playerid);
            PlayerInfo[playerid][FakeSkin] = 0;
            SetPlayerSkin(playerid, PlayerInfo[playerid][pRopa]);
            PlayerInfo[playerid][SelectingSkin] = false;
            SetPlayerVirtualWorld(playerid, 15);
        }
        TextDrawHideForPlayer(playerid, CajaSelect);
        TextDrawHideForPlayer(playerid, BotonSelect);
        TextDrawHideForPlayer(playerid, CajaDerecha);
        TextDrawHideForPlayer(playerid, BotonDerecha);
        TextDrawHideForPlayer(playerid, CajaIzquierda);
        TextDrawHideForPlayer(playerid, BotonIzquierda);
    }
    return 1;
}
/* Dialogos */

Dialog:DialogSkin(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        if(PlayerInfo[playerid][pDinero] < 801) return SendClientMessage(playerid, -1, "No tienes suficiente dinero para comprar esta ropa ($800)");
        PlayerInfo[playerid][pDinero] -= 800;
        PlayerInfo[playerid][SelectingSkin] = false;
        PlayerInfo[playerid][pRopa] = PlayerInfo[playerid][FakeSkin];
        SetPlayerSkin(playerid, PlayerInfo[playerid][pRopa]);
        SetCameraBehindPlayer(playerid);
        CancelSelectTextDraw(playerid);
        SetPlayerVirtualWorld(playerid,0);
    }
    return 1;
}

public OnPlayerClickMap(playerid, Float: fX, Float: fY, Float: fZ)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        SetPlayerPos(playerid, fX, fY, fZ);
        new string[64];
        format(string, sizeof(string), "[Staff]{ff6529} %s se teletransporto a una parte del mapa.", pName(playerid));
        SendMessageToAdmin(string);
    }
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
if(PlayerInfo[playerid][pAbatido] == 1)
{
AtendidoPorHP(playerid);
}
else 
{
PlayerInfo[playerid][pAbatido] = 1;
/* Spawn en el lugar que lo abatieron */
new Float:MuerteX;
new Float:MuerteY;
new Float:MuerteZ;
GetPlayerPos(playerid, MuerteX, MuerteY, MuerteZ);
SetSpawnInfo(playerid,0,PlayerInfo[playerid][pRopa],MuerteX,MuerteY, MuerteZ, 0.0, 0, 0, 0, 0, 0, 0);
SpawnPlayer(playerid);
SetPlayerHealth(playerid,60);
SCM(playerid,-1," 'H' Para llamar a un medico.");
timerAbatido[playerid] = SetTimerEx("abatido", 1000, true, "i", playerid);
timerdead[playerid] = SetTimerEx("muriendo", 10000, true, "d", playerid);
KillTimer(PintarDisputa[playerid]);
SCM(playerid,-1,"Estas Abatido y has perdido el conocimiento...");
PlayerInfo[playerid][Muertes]++;
PlayerInfo[killerid][Asesinatos]++;
/*Cadaveres*/
Actors[playerid] = playerid;
GetPlayerPos(playerid, Deadx[playerid], Deady[playerid], Deadz[playerid]);
GetPlayerFacingAngle(playerid, Deadr[playerid]);
Deadint[playerid] = GetPlayerInterior(playerid);
Deadvw[playerid] = GetPlayerVirtualWorld(playerid);
Deadskin[playerid] = GetPlayerSkin(playerid);
Actors[playerid] = CreateActor(Deadskin[playerid], Deadx[playerid], Deady[playerid], Deadz[playerid], Deadr[playerid]);
ApplyActorAnimation(Actors[playerid], "PED", "FLOOR_hit_f", 4.1, 0, 1, 1, 1, 1); //
SetTimerEx("BorrarActor", 120000, false, "i", playerid); // 120000 milisegundos = 2 minutos
/* Soltar armas */
GetPlayerPos(playerid,WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],WeaponSystem[playerid][Wz]);
new Float:dZ = WeaponSystem[playerid][Wz] + (4.3 * floatsin(-WeaponSystem[playerid][Wz], degrees));
WeaponSystem[playerid][Warma] = GetPlayerWeapon(playerid);
WeaponSystem[playerid][virwor] = GetPlayerVirtualWorld(playerid);
switch(WeaponSystem[playerid][Warma])
{
        case 4:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            knifetext = Create3DTextLabel("Cuchillo", -1, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0, WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(335, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);       
            WeaponSystem[playerid][Wid] = 4;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 5:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            batetext = Create3DTextLabel("Bate", -1, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0, WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(336, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);       
            WeaponSystem[playerid][Wid] = 5;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 22:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            pistoltext = Create3DTextLabel("Pistola", -1, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0, WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(346, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);       
            WeaponSystem[playerid][Wid] = 22;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 23:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            pistolsilencedtext = Create3DTextLabel("Pistola-Silenciada", -1, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0, WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(347, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);       
            WeaponSystem[playerid][Wid] = 23;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 24:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            deserttext = Create3DTextLabel("Desert-Eagle", -1, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0, WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(348, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);       
            WeaponSystem[playerid][Wid] = 24;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 25:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            shotguntext = Create3DTextLabel("Escopeta", -1, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0, WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(349, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);       
            WeaponSystem[playerid][Wid] = 25;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 26:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            recortadatext = Create3DTextLabel("Escopeta recortada", -1,WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0,WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(350, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);
            WeaponSystem[playerid][Wid] = 26;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 27:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            edctext = Create3DTextLabel("Escopeta de combate", -1,WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0,WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(351, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);
            WeaponSystem[playerid][Wid] = 27;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 28:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            uzitext = Create3DTextLabel("Uzi", -1,WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0,WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(352, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);
            WeaponSystem[playerid][Wid] = 28;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 29:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            mp5text = Create3DTextLabel("MP5", -1,WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0,WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(353, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);
            WeaponSystem[playerid][Wid] = 29;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 30:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            aktext = Create3DTextLabel("AK-47", -1,WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0,WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(355, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);
            WeaponSystem[playerid][Wid] = 30;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 31:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            m4text = Create3DTextLabel("M4", -1,WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0,WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(356, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);
            WeaponSystem[playerid][Wid] = 31;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 32:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            tectext = Create3DTextLabel("Tec-9", -1,WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0,WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(372, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 0, 0, 0, 5.0);
            WeaponSystem[playerid][Wid] = 32;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 33:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            rifletext = Create3DTextLabel("Rifle de caza", -1, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0, WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(357, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 90, 0, 0, 5.0);
            WeaponSystem[playerid][Wid] = 33;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
        case 34:
        {
            SetPlayerArmedWeapon(playerid, 0);
            ResetPlayerWeapons(playerid);
            WeaponSystem[playerid][WPuedeTomarse] = true;
            WeaponSystem[playerid][Wammo] = GetPlayerAmmo(playerid);
            snipertext = Create3DTextLabel("Rifle de caza", -1, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 5.0, WeaponSystem[playerid][virwor], 0);
            WeaponSystem[playerid][idobject] = CreateObject(358, WeaponSystem[playerid][Wx],WeaponSystem[playerid][Wy],dZ, 90, 0, 0, 5.0);
            WeaponSystem[playerid][Wid] = 34;
            ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        }
    }
}
return 0;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
    return 1;
}

/*
----------------------------------------------------------------------
------------------------Publics no-Nativos----------------------------
----------------------------------------------------------------------
*/
public OnQueryError(errorid, const error[], const callback[], const query[], MySQL:handle)
{
    switch(errorid)
    {
        case CR_SERVER_GONE_ERROR:
        {
            printf("Conexion perdida..");
        }
        case ER_SYNTAX_ERROR:
        {
            printf("Error en el sintaxis de la consulta: %s",query);
        }
    }
    return 1;
}

public BajarGasolina(vehicleid)
{
    CarsInfo[vehicleid][Gasolina] --;
    if(CarsInfo[vehicleid][Gasolina] <= 0)
    {
        GetVehicleParamsEx(vehicleid,engine, lights, alarm, doors, bonnet, boot, objective);
        SetVehicleParamsEx(vehicleid, 0, lights, alarm, doors, bonnet, boot, objective);
        Motor[vehicleid] = 0;
        new playerid = GetVehicleDriver(vehicleid);
        GameTextForPlayer(playerid,"~g~~h~Vehiculo Apagado, falta de gasolina", 1000, 3);
        KillTimer(CarsInfo[vehicleid][GasTimer]);
    }
    return 1;
}

public SubirGas(vehicleid)
{
    CarsInfo[vehicleid][Gasolina] ++;
    return 1;
}
public HideHouseTextdraws(playerid)
{
    TextDrawHideForPlayer(playerid, TdCasa[0]);
    TextDrawHideForPlayer(playerid, TdCasa[1]);
    TextDrawHideForPlayer(playerid, TdCasa[2]);
    TextDrawHideForPlayer(playerid, TdCasa[3]);
    TextDrawHideForPlayer(playerid, TdCasa[4]);
    return 1;
}

public quitaraviso()
{
    DisputaZonaHide();
    return 1;
}
forward BorrarActor(playerid);
public BorrarActor(playerid) {
   DestroyActor(Actors[playerid]);
   Actors[playerid] = -1;
   return 1;
}
forward ActualizarGraffo0(playerid);
public ActualizarGraffo0(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo0(playerid);
    return 1;
}

forward ActualizarGraffo1(playerid);
public ActualizarGraffo1(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo1(playerid);
    return 1;
}

forward ActualizarGraffo2(playerid);
public ActualizarGraffo2(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo2(playerid);
    return 1;
}

forward ActualizarGraffo3(playerid);
public ActualizarGraffo3(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo3(playerid);
    return 1;
}

forward ActualizarGraffo4(playerid);
public ActualizarGraffo4(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo4(playerid);
    return 1;
}

forward ActualizarGraffo5(playerid);
public ActualizarGraffo5(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo5(playerid);
    return 1;
}

forward ActualizarGraffo6(playerid);
public ActualizarGraffo6(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo6(playerid);
    return 1;
}

forward ActualizarGraffo7(playerid);
public ActualizarGraffo7(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo7(playerid);
    return 1;
}

forward ActualizarGraffo8(playerid);
public ActualizarGraffo8(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo8(playerid);
    return 1;
}

forward ActualizarGraffo9(playerid);
public ActualizarGraffo9(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo9(playerid);
    return 1;
}

forward ActualizarGraffo10(playerid);
public ActualizarGraffo10(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo10(playerid);
    return 1;
}

forward ActualizarGraffo11(playerid);
public ActualizarGraffo11(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo11(playerid);
    return 1;
}

forward ActualizarGraffo12(playerid);
public ActualizarGraffo12(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo12(playerid);
    return 1;
}

forward ActualizarGraffo13(playerid);
public ActualizarGraffo13(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo13(playerid);
    return 1;
}

forward ActualizarGraffo14(playerid);
public ActualizarGraffo14(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo14(playerid);
    return 1;
}

forward ActualizarGraffo15(playerid);
public ActualizarGraffo15(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo15(playerid);
    return 1;
}

forward ActualizarGraffo16(playerid);
public ActualizarGraffo16(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo16(playerid);
    return 1;
}

forward ActualizarGraffo17(playerid);
public ActualizarGraffo17(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo17(playerid);
    return 1;
}

forward ActualizarGraffo18(playerid);
public ActualizarGraffo18(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo18(playerid);
    return 1;
}

forward ActualizarGraffo19(playerid);
public ActualizarGraffo19(playerid)
{
    GraffUp[playerid] ++;
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    if(GraffUp[playerid] == 100) return PGrafo19(playerid);
    return 1;
}

public CancelarGraff(playerid)
{
    GameTextForPlayer(playerid,"Mantente pintando...",1000, 4);
    DisputaZonaHide();
    // ---------- //
    new string[144];
    format(string,sizeof(string),"%s: %d%%",pName(playerid),GraffUp[playerid]);
    TextDrawSetString(PintandoGraff[1], string);
    TextDrawShowForAll(PintandoGraff[1]);
    TextDrawShowForAll(PintandoGraff[2]);
    TextDrawShowForAll(PintandoGraff[0]);
    KillTimer(PintarDisputa[playerid]);
    return 1;
}

forward FreezePlayerOnLogin(playerid);
public FreezePlayerOnLogin(playerid)
{
    TextdrawError(playerid, "Cargando objetos y cuenta.");
    TogglePlayerControllable(playerid, false);
    SetTimerEx("UnFreezePlayer", 5000, false, "i", playerid);
    return 1;
}

public SetPlayerInInteriorOrExterior(playerid)
{
    TextdrawError(playerid, "Cargando objetos.");
    TogglePlayerControllable(playerid, false);
    SetTimerEx("UnFreezePlayer", 5000, false, "i", playerid);
    return 1;
}

public UnFreezePlayer(playerid)
{
    TogglePlayerControllable(playerid, true);
    return 1;
}

public LoadHouses()
{
    mysql_tquery(MySQL, "SELECT * FROM Casas", "LoadHousesMySQL");
    return 1;
}

public LoadHousesMySQL()
{
    new rows;
    cache_get_row_count(rows);
    if(rows)
    {
        for(new i = 0; i < rows; i ++)
        {
            new int, vw, price, bool:buyed, bool:locked, howner[24], Float:ixex, Float:iyex, Float:izex, Float:ixin, Float:iyin, Float:izin;
            cache_get_value_name_int(i, "interior", int);
            cache_get_value_name_int(i, "virtualworld", vw);
            cache_get_value_name_int(i, "price", price);
            cache_get_value_name_int(i, "ID", HouseInfo[i][hid]);
            cache_get_value_name_int(i, "OwnerID", HouseInfo[i][oID]);
            cache_get_value_name_bool(i, "Buyed", buyed);
            cache_get_value_name_bool(i, "Locked", locked);
            if(buyed) cache_get_value_name(i, "Owner", howner);
            else format(howner, sizeof(howner), "Nadie");
            cache_get_value_name_float(i, "xex", ixex);
            cache_get_value_name_float(i, "yex", iyex);
            cache_get_value_name_float(i, "zex", izex);
            cache_get_value_name_float(i, "xin", ixin);
            cache_get_value_name_float(i, "yin", iyin);
            cache_get_value_name_float(i, "zin", izin);
            CreateHouse(i, vw, int, buyed, locked, price, howner, ixex, iyex, izex, ixin, iyin, izin);
        }
        print("[LatinRP]: Casas cargadas.");
    }
    else return print("[LatinRP]: No hay casas que cargar.");
    return 1;
}

CMD:ircasa(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        new id;
        if(sscanf(params, "i", id)) return TextdrawError(playerid, "Error: /ircasa [HID]");
        if(HouseInfo[id][xex] == 0.0) return TextdrawError(playerid, "Error: id de casa invalida.");
        SetPlayerPos(playerid, HouseInfo[id][xex], HouseInfo[id][yex], HouseInfo[id][zex]);
        return 1;
    }
    return 0;
}
Dialog:DialogCasa(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                new i = GetNearbyDoor(playerid);
                if(i == -1) return TextdrawError(playerid, "Error: no estas cerca de una puerta.");
                if(HouseInfo[i][Locked] == false)
                {
                    HouseInfo[i][Locked] = true;
                    TextdrawError(playerid, "Casa cerrada.");
                }
                else if(HouseInfo[i][Locked] == true)
                {
                    HouseInfo[i][Locked] = false;
                    TextdrawError(playerid, "Casa abierta.");
                }
            }
        }
    }
    return 1;
}

CMD:comprar(playerid, params[])
{
    if(strcmp(params, "casa", true))
    {
        if(IsPlayerInRangeOfDoor(playerid) || IsPlayerInRangeOfOutDoor(playerid))
        {
            new i = GetNearbyDoor(playerid);
            if(HouseInfo[i][Buyed])
            {
                return TextdrawError(playerid, "Error: esta casa ya esta comprada.");
            }
            else if(!HouseInfo[i][Buyed])
            {
                if(HouseInfo[i][hPrice] > PlayerInfo[playerid][pDinero])
                {
                    return TextdrawError(playerid, "Error: no tienes suficiente dinero para comprar esta casa.");
                }
                new message[128];
                format(message, sizeof(message), "Compraste esta casa por %i", HouseInfo[i][hPrice]);
                SendClientMessage(playerid, -1, message);
                PlayerInfo[playerid][pDinero] -=  HouseInfo[i][hPrice];
                HouseInfo[i][oID] = PlayerInfo[playerid][mID];
                format(HouseInfo[i][owner], MAX_PLAYER_NAME, NombreJugador(playerid));
                HouseInfo[i][Buyed] = true;
            }
        }
        else return TextdrawError(playerid, "Error: no estas cerca de una casa.");
    }
    return 1;
}

CMD:casa(playerid)
{
    if(IsPlayerInRangeOfDoor(playerid) || IsPlayerInRangeOfOutDoor(playerid))
    {
        new i = GetNearbyDoor(playerid);
        if(HouseInfo[i][oID] == PlayerInfo[playerid][mID])
        {
            Dialog_Show(playerid, DialogCasa, DIALOG_STYLE_LIST, "Casa", "Seguro", "Aceptar", "Cancelar");
        }
        else return TextdrawError(playerid, "No eres propietario de esta casa.");
    }
    return 1;
}

public CreateHouse(id, vw, int, bool:buyed, bool:locked, price, howner[24], Float:ixex, Float:iyex, Float:izex, Float:ixin, Float:iyin, Float:izin)
{
    HouseInfo[id][pid] = CreateDynamicPickup(19198, 23, ixex, iyex, izex, 0, 0, -1, 100.0);
    HouseInfo[id][xex] = ixex;
    HouseInfo[id][yex] = iyex;
    HouseInfo[id][zex] = izex;
    HouseInfo[id][xin] = ixin;
    HouseInfo[id][yin] = iyin;
    HouseInfo[id][virtualworld] = vw;
    HouseInfo[id][zin] = izin;
    HouseInfo[id][interior] = int;
    HouseInfo[id][Buyed] = buyed;
    HouseInfo[id][owner] = howner;
    HouseInfo[id][Locked] = locked;
    HouseInfo[id][hPrice] = price;
    return 1;
}

public CreateHouseHandled(vw, int, bool:buyed, bool:locked, price, howner[24], Float:ixex, Float:iyex, Float:izex, Float:ixin, Float:iyin, Float:izin)
{
    new query[656];
    format(query, sizeof(query), "INSERT INTO Casas (´Owner´, ´Buyed´, ´Locked´, ´price´, ´xex´, ´yex´, ´zex´, ´xin´, ´yin´, ´zin´, ´interior´, ´virtualworld´) VALUES ('%s', '%i', '%i', '%f', '%f', '%f', '%f', '%f', '%f', '%i', '%i')", 
                                                                                                                                                                        howner, buyed, locked, price, ixex, iyex, izex, ixin, iyin, izin, int, vw);
    mysql_query(MySQL, query);
    new id = cache_insert_id();
    CreateHouse(id, vw, int, buyed, locked, price, howner, ixex, iyex, izex, ixin, iyin, izin);
    return 1;
}

CMD:crearcasa(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new price, Float:cX, Float:cY, Float:cZ, vw, int;
        if(sscanf(params, "iii", price, int, vw)) return SendClientMessage(playerid, -1, "Error: /crearcasa [PRECIO] [INTOPT] [VW]");
        GetPlayerPos(playerid, cX, cY, cZ);
        CreateHouseCommand(vw, price, cX, cY, cZ, int);
        return 1;
    }
    return 0;
}

stock CreateHouseCommand(vw, price, Float:x, Float:y, Float:z, interioroption)
{
    switch(interioroption)
    {
        case 0: // Burglary house 1
        {
            CreateHouseHandled(vw, 3, false, true, price, "Nadie", x, y, z+0.5, 234.6087, 1187.8195, 1080.2578); 
        }
        default:
        {
            return;
        }
    } 
}

public SaveHouses()
{
    for(new i; i < MAX_HOUSES; i ++)
    {
        if(HouseInfo[i][hid] != 0)
        {
            new query[256];
            format(query, sizeof(query), "UPDATE ´Casas´ SET ´OwnerID´ = '%i', ´interior´ = '%i', ´virtualworld´ = '%i', ´price´ = '%i', ´Buyed´ = '%i', ´Locked´ = '%i', ´Owner´ = '%s', ´xex´ = '%f', ´yex´ = '%f', ´zex´ = '%f', ´xin´ = '%f', ´yin´ = '%f', ´zin´ = '%f' WHERE ´ID´ = '%i'", 
            HouseInfo[i][oID], HouseInfo[i][interior], HouseInfo[i][virtualworld], HouseInfo[i][hPrice], HouseInfo[i][Buyed], HouseInfo[i][Locked], HouseInfo[i][owner], HouseInfo[i][xex], HouseInfo[i][yex], HouseInfo[i][zex], HouseInfo[i][xin], HouseInfo[i][yin], HouseInfo[i][zin], HouseInfo[i][hid]);
            mysql_query(MySQL, query);
        }
    }
    return 1;
}

public Chequear(playerid)
{
    new query[520], name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    format(query, sizeof(query), "SELECT * FROM `cuentas` WHERE `Nombre`='%s'", name);
    mysql_tquery(MySQL, query, "VerificarUsuario", "d", playerid);
}

public Camara()
{
    for(new i; i < MAX_PLAYERS; i++)
    {
    if(camaraon[i] > 0 && IsPlayerInAnyVehicle(i))
    {
            AttachObjectToVehicle(FPS[i], GetPlayerVehicleID(i), 0.0, 0.10, 0.65, 0.0, 0.0, 0.0);
            AttachCameraToObject(i, FPS[i]);
    }
    else if(camaraon[i] > 0 && !IsPlayerInAnyVehicle(i))
    {
            AttachObjectToPlayer(FPS[i], i, 0.0, 0.10, 0.65, 0.0, 0.0, 0.0);
            AttachCameraToObject(i, FPS[i]);
    }
    }
    return 1;
}

public CommandError(playerid)
{
    TextDrawHideForPlayer(playerid, TextDrawError);
    return 1;
}

public GuardarJugador(playerid)
{
    new query[520];
    new ip[16];
    GetPlayerIp(playerid, ip, 16);
    format(PlayerInfo[playerid][IP],16, "%s", playerid, ip);
    GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
    GetPlayerHealth(playerid,PlayerInfo[playerid][pVida]);
    GetPlayerArmour(playerid,PlayerInfo[playerid][pChaleco]);
    mysql_format(MySQL, query, sizeof(query), "UPDATE `cuentas` SET `IP`='%s',`Ropa`='%i',`X`='%f',`Y`='%f',`Z`='%f',`Genero`='%i',`Vida`='%f',`Chaleco`='%f',`Muertes`='%i',`Asesinatos`='%i', `Admin`='%i', `Policia`='%i' WHERE `Nombre`='%s'",
    PlayerInfo[playerid][IP],
    PlayerInfo[playerid][pRopa],
    PlayerInfo[playerid][pX],
    PlayerInfo[playerid][pY],
    PlayerInfo[playerid][pZ],
    PlayerInfo[playerid][pGenero],
    PlayerInfo[playerid][pVida],
    PlayerInfo[playerid][pChaleco],
    PlayerInfo[playerid][Muertes],
    PlayerInfo[playerid][Asesinatos],
    PlayerInfo[playerid][pAdmin],
    PlayerInfo[playerid][pPolicia],
    NombreJugador(playerid));
    mysql_query(MySQL, query);
    //
    mysql_format(MySQL, query, sizeof(query), "UPDATE `cuentas` SET `Dinero`='%i', `Nivel`='%i', `Trabajo`='%i', `Edad`='%i', `Botiquines`='%d', `Acento`='%i', `Fecha`='%s', `GPS`='%i', `Interior`='%i', `VirtualWorld`='%i', `Lugar`='%s' WHERE `Nombre`='%s'",
    PlayerInfo[playerid][pDinero],
    PlayerInfo[playerid][pNivel] = GetPlayerScore(playerid),
    PlayerInfo[playerid][pJob],
    PlayerInfo[playerid][pEdad],
    PlayerInfo[playerid][pBotis],
    PlayerInfo[playerid][pAcento],
    PlayerInfo[playerid][pFecha],
    PlayerInfo[playerid][pGps],
    PlayerInfo[playerid][pInt] = GetPlayerInterior(playerid),
    PlayerInfo[playerid][pVW] = GetPlayerVirtualWorld(playerid),
    PlayerInfo[playerid][pLugar],
    NombreJugador(playerid));
    mysql_query(MySQL, query);
    //
    mysql_format(MySQL, query, sizeof(query), "UPDATE `cuentas` SET `DNI`='%d', `VehicleID`='%d', `Vip`='%i', `LatinCoins`='%i', `Medicamentos`='%d', `Marihuana`='%d' `Banco`='%d', `ChangesName`='%d', `Abatido`='%i' WHERE `Nombre`='%s'",
    PlayerInfo[playerid][pDNI],
    PlayerInfo[playerid][pVehicleID],
    PlayerInfo[playerid][pVip],
    PlayerInfo[playerid][LatinCoins],
    PlayerInfo[playerid][pMedicamentos],
    PlayerInfo[playerid][pMarihuana],
    PlayerInfo[playerid][pBanco],
    PlayerInfo[playerid][ChangesName],
    PlayerInfo[playerid][pAbatido],
    NombreJugador(playerid));
    mysql_query(MySQL, query);
    //
	new hour,minute,second;
	new year, month, day;
	getdate(year, month, day);
	gettime(hour, minute, second);
	format(PlayerInfo[playerid][Ultima_conexion], 90, "%02d/%02d/%02d %02d:%02d:%02d", year,month,day,hour,minute,second);
    mysql_format(MySQL, query, sizeof(query), "UPDATE `cuentas` SET `Jaileado`='%i', `TimeJail`='%i', `Carcel`='%i', `TimeCarcel`='%i', `Banda`='%i', `Baneado`='%i', `ult_con`='%s', `Cargos`='%d'  WHERE `Nombre`='%s'",
    PlayerInfo[playerid][pJaileado],
    PlayerInfo[playerid][TiempoJail],
    PlayerInfo[playerid][pCarcel],
    PlayerInfo[playerid][TimeCarcel],
    PlayerInfo[playerid][pBanda],
    PlayerInfo[playerid][pBaneado],
    PlayerInfo[playerid][Ultima_conexion],
    PlayerInfo[playerid][pCargos],
    NombreJugador(playerid));
    mysql_query(MySQL, query);
    return 1;
}
public CrearCuenta(playerid)
{
    new query[520], aviso[125];
    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `cuentas`(`Nombre`, `Contra`, `Ropa`, `X`, `Y`, `Z`, `Genero`, `Vida`, `Dinero` ) VALUES ('%s','%s','%i','1484.1082', '-1668.4976', '14.9159','%i','100','100000')",
    NombreJugador(playerid),
    PlayerInfo[playerid][pContra],
    PlayerInfo[playerid][pRopa],
    PlayerInfo[playerid][pGenero]);
    mysql_query(MySQL, query);
    PlayerInfo[playerid][pDinero] += 10000;
    SCM(playerid,VERDECLARO,"¡ Felicitaciones ! {FFFFFF}Registro completo.");
    SCM(playerid,-1,"Has completado el resgistro, bienvenido a {ff6529}LatinRP{FFFFFF}, disfruta tu estadia...");
    SCM(playerid,-1,"Has recibido 10,000$");
    PlayerInfo[playerid][pAdmin] = 0;
    PlayerInfo[playerid][pAbatido] = 0;
    PlayerInfo[playerid][pJaileado] = 0;
    PlayerInfo[playerid][ChangesName] = 3;
    SetPlayerScore(playerid, 1);
    PlayerInfo[playerid][pLogged] = true;
    if(PlayerInfo[playerid][pGenero] == 0)
    {
        format(aviso,sizeof(aviso),"Cuenta %s creada: - Edad: %d - Genero: Masculino - Cambios de nombre: 3", NombreJugador(playerid), PlayerInfo[playerid][pEdad]);
        SCM(playerid,-1,aviso);
        print(aviso);
    }
    else
    {
        format(aviso,sizeof(aviso),"Cuenta %s creada: - Edad: %d - Genero: Femenino - Cambios de nombre: 3", NombreJugador(playerid), PlayerInfo[playerid][pEdad]);
        SCM(playerid,-1,aviso);
        print(aviso);
    }
    return 1;
}
public VerificarUsuario(playerid)
{
    new rows;
    cache_get_row_count(rows);
    if(rows)
    {
        CamaraInicio(playerid);
        cache_get_value_name(0, "Contra", PlayerInfo[playerid][pContra], 129);
        ShowPlayerDialog(playerid, DIALOG_INGRESO, DIALOG_STYLE_PASSWORD, "Login","{FFFFFF}Bienvenido nuevamente a {ff6529}LatinRP{FFFFFF}\nIngrese su contra para iniciar sesion.", "Continuar", "Cancelar");
    }
    else
    {
        CamaraInicio(playerid);
        ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "Registro", "Bienvenido a {ff6529}LatinRP{FFFFFF} Al parecer esta cuenta\nNo esta registrada ingresa una contra para registrarte:", "Registrar", "Cancelar");
    }
    return 1;
}

public IngresoJugador(playerid)
{
    cache_get_value_name_int(0, "ID", PlayerInfo[playerid][mID]);
    cache_get_value_name(0, "IP", PlayerInfo[playerid][IP]);
    cache_get_value_name_int(0, "Ropa", PlayerInfo[playerid][pRopa]);
    cache_get_value_name_int(0, "Genero", PlayerInfo[playerid][pGenero]);
    cache_get_value_name_int(0, "Muertes", PlayerInfo[playerid][Muertes]);
    cache_get_value_name_int(0, "Asesinatos", PlayerInfo[playerid][Asesinatos]);
    cache_get_value_name_int(0, "Admin", PlayerInfo[playerid][pAdmin]);
    cache_get_value_name_int(0, "Policia", PlayerInfo[playerid][pPolicia]);
    cache_get_value_name_int(0, "Dinero", PlayerInfo[playerid][pDinero]);
    cache_get_value_name_int(0, "Nivel", PlayerInfo[playerid][pNivel]);
    cache_get_value_name_int(0, "Trabajo", PlayerInfo[playerid][pJob]);
    cache_get_value_name_int(0, "Edad", PlayerInfo[playerid][pEdad]);
    cache_get_value_name_int(0, "Botiquines", PlayerInfo[playerid][pBotis]);
    cache_get_value_name_int(0, "Acento", PlayerInfo[playerid][pAcento]);
    cache_get_value_name_int(0, "GPS", PlayerInfo[playerid][pGps]);
    cache_get_value_name_int(0, "Interior", PlayerInfo[playerid][pInt]);
    cache_get_value_name_int(0, "VirtualWorld", PlayerInfo[playerid][pVW]);
    cache_get_value_name_int(0, "DNI", PlayerInfo[playerid][pDNI]);
    cache_get_value_name_int(0, "VehicleID", PlayerInfo[playerid][pVehicleID]);
    cache_get_value_name_int(0, "VIP", PlayerInfo[playerid][pVip]);
    cache_get_value_name_int(0, "LatinCoins", PlayerInfo[playerid][LatinCoins]);
    cache_get_value_name_int(0, "Medicamentos", PlayerInfo[playerid][pMedicamentos]);
    cache_get_value_name_int(0, "Banco", PlayerInfo[playerid][pBanco]);
    cache_get_value_name(0, "Fecha", PlayerInfo[playerid][pFecha]);
    cache_get_value_name(0, "Lugar", PlayerInfo[playerid][pLugar]);
    cache_get_value_name_float(0, "X", PlayerInfo[playerid][pX]);
    cache_get_value_name_float(0, "Y", PlayerInfo[playerid][pY]);
    cache_get_value_name_float(0, "Z", PlayerInfo[playerid][pZ]);
    cache_get_value_name_float(0, "Vida", PlayerInfo[playerid][pVida]);
    cache_get_value_name_float(0, "Chaleco", PlayerInfo[playerid][pChaleco]);
    cache_get_value_name_int(0, "Marihuana", PlayerInfo[playerid][pMarihuana]);
    cache_get_value_name_int(0, "ChangesName", PlayerInfo[playerid][ChangesName]);
    cache_get_value_name_int(0, "Abatido", PlayerInfo[playerid][pAbatido]);
    cache_get_value_name_int(0, "Jaileado", PlayerInfo[playerid][pJaileado]);
    cache_get_value_name_int(0, "TimeJail", PlayerInfo[playerid][TiempoJail]);
    cache_get_value_name_int(0, "TimeCarcel", PlayerInfo[playerid][TimeCarcel]);
    cache_get_value_name_int(0, "Carcel", PlayerInfo[playerid][pCarcel]);
    cache_get_value_name_int(0, "Banda", PlayerInfo[playerid][pBanda]);
    cache_get_value_name_int(0, "Baneado", PlayerInfo[playerid][pBaneado]);
    cache_get_value_name(0, "ult_con", PlayerInfo[playerid][Ultima_conexion]);
    cache_get_value_name_int(0, "Cargos", PlayerInfo[playerid][pCargos]);
    IngresarJugador(playerid);
    return 1;
}
stock SpawnearJugador(playerid)
{
    StopAudioStreamForPlayer(playerid);
    SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pRopa], PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ], 0.0, 0, 0, 0, 0, 0, 0);
    SpawnPlayer(playerid);
    SetPlayerHealth(playerid,PlayerInfo[playerid][pVida]);
    SetPlayerArmour(playerid,PlayerInfo[playerid][pChaleco]);
    GivePlayerMoney(playerid,PlayerInfo[playerid][pDinero]);
    SetPlayerScore(playerid,PlayerInfo[playerid][pNivel]);
    SetPlayerSkin(playerid,PlayerInfo[playerid][pRopa]);
    SetPlayerInterior(playerid,PlayerInfo[playerid][pInt]);
    SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVW]);
    LoadPlayerVehicles(playerid);
    FreezePlayerOnLogin(playerid);
    PlayerInfo[playerid][pLogged] = true;
    /* Bienvenida */
    new bienvenida[144];
    format(bienvenida, sizeof(bienvenida), "Bienvenido de vuelta tu utlima conexion fue hace: %s",PlayerInfo[playerid][Ultima_conexion]);
    SCM(playerid,-1,bienvenida);
    TextDrawHideForPlayer(playerid, Spawn0);
    TextDrawHideForPlayer(playerid, Spawn1);
    return 1;
}
stock Encarcelar(playerid)
{
    ResetPlayerWeapons(playerid);
    PlayerInfo[playerid][pCarcel] = 1;
    SetPlayerPos(playerid, 215.198913,108.894432,999.015625);
    SetPlayerInterior(playerid,10);
    SetPlayerArmedWeapon(playerid, 0);
    SetPlayerFacingAngle(playerid, 344.0042);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    GameTextForPlayer(playerid, "~w~ Caiste ~p~ En ~r~ Cana!", 10000, 6);
    PlayerPlaySound(playerid,1057,0.0,0.0,0.0); 
    return 1;
}

public IngresarJugador(playerid)
{
	if(PlayerInfo[playerid][pBaneado] != 0)
	{
		ShowPlayerDialog(playerid, 5, DIALOG_STYLE_MSGBOX, "Baneado", "No puedes ingresar al servidor fuiste baneado.", "Aceptar", "x2");
		Kick(playerid);
		return 1;
	}
	if(PlayerInfo[playerid][pCargos] == 1 && PlayerInfo[playerid][pCargos] == 2)
	{
        Encarcelar(playerid);
        PlayerInfo[playerid][TimeCarcel] = 900000;
        SetTimerEx("Desencarcelado", PlayerInfo[playerid][TimeCarcel], false,"u",playerid);
	}
	else if(PlayerInfo[playerid][pCargos] == 3 && PlayerInfo[playerid][pCargos] == 4)
	{
        Encarcelar(playerid);
        PlayerInfo[playerid][TimeCarcel] = 1800000;
        SetTimerEx("Desencarcelado", PlayerInfo[playerid][TimeCarcel], false,"u",playerid);
	}
	else if(PlayerInfo[playerid][pCargos] == 5 && PlayerInfo[playerid][pCargos] == 6)
	{
        Encarcelar(playerid);
        PlayerInfo[playerid][TimeCarcel] = 3600000;
        SetTimerEx("Desencarcelado", PlayerInfo[playerid][TimeCarcel], false,"u",playerid);
	}
    if(PlayerInfo[playerid][pAbatido] != 0)
    {
        SpawnearJugador(playerid);
        SCM(playerid,-1,"Presiona 'H' Para llamar a un medico.");
        timerAbatido[playerid] = SetTimerEx("abatido", 1000, true, "i", playerid);
        timerdead[playerid] = SetTimerEx("muriendo", 10000, true, "d", playerid);
    }
    if(PlayerInfo[playerid][pJaileado] != 0)
    {
        SetTimerEx("Unjail", PlayerInfo[playerid][TiempoJail], false,"u",playerid);
        SpawnearJugador(playerid);
    }
    if(PlayerInfo[playerid][pCarcel] != 0)
    {
        SetTimer("Desencarcelado", PlayerInfo[playerid][TimeCarcel], false);
        SpawnearJugador(playerid);
    }
    else SpawnearJugador(playerid);
    return 1;
}
public descongelar(playerid)
{
    TogglePlayerControllable(playerid,true);
    return 1;
}
stock GetGasFromVehicle(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if(!IsPlayerInAnyVehicle(playerid)) return 1;
    if(CarsInfo[vehicleid][Gasolina] == 0)
    {
        GetVehicleParamsEx(vehicleid,engine, lights, alarm, doors, bonnet, boot, objective);
        SetVehicleParamsEx(vehicleid, 0, lights, alarm, doors, bonnet, boot, objective);
        Motor[vehicleid] = 0;
        GameTextForPlayer(playerid,"~g~Se acabo el combustible",1000,3);
    }
    return 1;
}
public LoadPlayerVehicles(playerid)
{
    new query[520], name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `Vehiculos` WHERE `Owner`='%s'", name);
    mysql_tquery(MySQL, query, "LoadVehicles", "i", playerid);
    return 1;
}
public MiVehs(playerid)
{
    new rows;
    cache_get_row_count(rows);
    if(!rows)
    {
        TextdrawError(playerid, "No tienes vehiculos.");
    }
    else 
    {
        new vehicleid = PlayerInfo[playerid][pVid];
        new info[500];
        format(info, sizeof(info),"ID DB: %i\nModelo: %i\nColor-1:%i\nColor-2:%i\nGasolina:%dL.",CarsInfo[vehicleid][cID],CarsInfo[vehicleid][cModelo],
        CarsInfo[vehicleid][Color1],CarsInfo[vehicleid][Color2],GetGasFromVehicle(playerid));
        ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "Mi Vehiculo Info", info, "Aceptar", "Cerrar");
    }
}
public LoadVehicles(playerid)
{
    new rows;
    cache_get_row_count(rows);
    if(!rows)
    {
        TextdrawError(playerid, "No tienes vehiculos.");
    }
    else 
    {
        new idveh,model, color1, color2, gasolina, Float:x, Float:y, Float:z, Float:a;
        cache_get_value_name_int(0, "ID", idveh);
        cache_get_value_name_int(0, "Modelo", model);
        cache_get_value_name_int(0, "Color1", color1);
        cache_get_value_name_int(0, "Color2", color2);
        cache_get_value_name_int(0, "Gasolina", gasolina);
        cache_get_value_name_float(0, "PosX", x);
        cache_get_value_name_float(0, "PosY", y);
        cache_get_value_name_float(0, "PosZ", z);
        cache_get_value_name_float(0, "PosA", a);
        PlayerInfo[playerid][pVid] = CreateVehicle(model, x, y, z, a, color1, color2, 0, 0);
        new vehicleid = PlayerInfo[playerid][pVid];
        SetVehicleVirtualWorld(vehicleid, 0);
        CarsInfo[vehicleid][cID] = idveh;
        CarsInfo[vehicleid][cModelo] = model;
        CarsInfo[vehicleid][Color1] = color1;
        CarsInfo[vehicleid][Color2] = color2;
        CarsInfo[vehicleid][cPosX] = x;
        CarsInfo[vehicleid][cPosY] = y;
        CarsInfo[vehicleid][cPosZ] = z;
        CarsInfo[vehicleid][cPosA] = a;
        CarsInfo[vehicleid][Gasolina] = gasolina;
    }
    return 1;
}

CMD:darauto(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 5)
    {
        new id, model, color1, color2, Float:x, Float:y, Float:z, Float:a;
        if(sscanf(params, "iiii", id, model, color1, color2)) return SendClientMessage(playerid, -1, "Error: /darauto [ID] [MODELO] [COLOR1] [COLOR2]");
        GetPlayerPos(id, x, y, z);
        GetPlayerFacingAngle(id, a);
        CreateVehicleMySQL(id, model, color1, color2, x, y, z, a);
        return 1;
    }
    return 0;
}

public CreateVehicleMySQL(playerid, model, color1, color2, Float:x, Float:y, Float:z, Float:a)
{
    new query[520];
    format(query, sizeof(query), "INSERT INTO `Vehiculos`(`Owner`, `Modelo`, `Color1`, `Color2`, `PosX`, `PosY`, `PosZ`, `PosA`) VALUES ('%s','%i','%i','%i', '%f', '%f','%f','%f')",
    pName(playerid), model, color1, color2, x, y, z, a);
    mysql_tquery(MySQL, query, "CreateVehicleHandled", "i", playerid);
    return 1;
}

public CreateVehicleHandled(playerid)
{
    PlayerInfo[playerid][pVehicleID] = cache_insert_id();
    new model, color1, color2, Float:x, Float:y, Float:z, Float:a;
    cache_get_value_name_int(0, "Modelo", model);
    cache_get_value_name_int(0, "Color1", color1);
    cache_get_value_name_int(0, "Color2", color2);
    cache_get_value_name_float(0, "PosX", x);
    cache_get_value_name_float(0, "PosY", y);
    cache_get_value_name_float(0, "PosZ", z);
    cache_get_value_name_float(0, "PosA", a);
    PlayerInfo[playerid][pVid] = CreateVehicle(model, x, y, z , a, color1, color2, 0, 0);
    new vehicleid = PlayerInfo[playerid][pVid];
    CarsInfo[vehicleid][cModelo] = model;
    CarsInfo[vehicleid][Color1] = color1;
    CarsInfo[vehicleid][Color2] = color2;
    CarsInfo[vehicleid][cPosX] = x;
    CarsInfo[vehicleid][cPosY] = y;
    CarsInfo[vehicleid][cPosZ] = z;
    CarsInfo[vehicleid][cPosA] = a;
    new query[256];
    format(query, sizeof(query), "UPDATE `cuentas` SET `VehicleID` = '%i' WHERE `Nombre` = '%s'", PlayerInfo[playerid][pVehicleID], NombreJugador(playerid));
    mysql_query(MySQL, query);
    PutPlayerInVehicle(playerid, vehicleid, 1);
    return 1;
}

public SavePlayerVehicles(playerid)
{
    if(PlayerInfo[playerid][pVid] != 0)
    {
        new vehicleid = PlayerInfo[playerid][pVid];
        GetVehiclePos(vehicleid, CarsInfo[vehicleid][cPosX], CarsInfo[vehicleid][cPosY], CarsInfo[vehicleid][cPosZ]);
        GetVehicleZAngle(vehicleid, CarsInfo[vehicleid][cPosA]);
        new query[520];
        format(query, sizeof(query), "UPDATE `Vehiculos` SET `Modelo`='%i',`Color1`='%i', `Color2`='%i', `PosX`='%f', `PosY`='%f', `PosZ`='%f', `PosA`='%f', `Gasolina`='%f' WHERE `Owner`='%s'",
        CarsInfo[vehicleid][cModelo],
        CarsInfo[vehicleid][Color1],
        CarsInfo[vehicleid][Color2],
        CarsInfo[vehicleid][cPosX],
        CarsInfo[vehicleid][cPosY],
        CarsInfo[vehicleid][cPosZ],
        CarsInfo[vehicleid][cPosA],
        CarsInfo[vehicleid][Gasolina],
        NombreJugador(playerid));
        mysql_query(MySQL, query);
        DestroyVehicle(PlayerInfo[playerid][pVid]);
    }
    return 1;
}

public TiempoEsposo(playerid)
{
    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CUFFED);
    return 1;
}

public CargaCamion(playerid)
{
    TogglePlayerControllable(playerid, true);
    return 1;
}

public SubirVida(playerid, Float:health)
{
    new Float:healthh;
    GetPlayerHealth(playerid, healthh);
    if(PlayerInfo[playerid][pVip] == 1)
    {
        VidaSubiendo[playerid] += 6;
        SetPlayerHealth(playerid, health + VidaSubiendo[playerid]);
    }
    else
    {
        VidaSubiendo[playerid] += 2;
        SetPlayerHealth(playerid, health + VidaSubiendo[playerid]);
    }
    if(healthh >= 100.0)
    {
        SetPlayerHealth(playerid, 100.0);
        KillTimer(timeruplife[playerid]);
        KillTimer(timerAbatido[playerid]);
        ClearAnimations(playerid);
        ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
        SendClientMessage(playerid, -1, "Los enfermeros te atendieron y te sientes mejor.");
        TogglePlayerControllable(playerid, true);
    }
    return 1;
}
public CerrarPuerta(playerid)
{
    MoveObject(BallaLSPD,1544.68286, -1630.89783, 13.31370,0.50,-90.00000, 0.00000, 0.00000);
    return 1;
}

public robandotienda(playerid)
{
    new string[256];
    new nombre[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nombre, sizeof(nombre));
    SCM(playerid,-1,"Vendedor dice: ya te di todo largate hijo de puta...");
    SCM(playerid,-1,"[Info]La policia viene en camino es mejor huir o cagaste...");
    PlayerInfo[playerid][pDinero] += 1500;
    format(string, sizeof(string), "[Camaras]%s ha robado 1500$ en el Oxxo de unity",nombre);
    RadioPolicia(string);
    return 1;
}

public CerrarPortonCasa(playerid)
{
    MoveObject(PortonCasa,2256.61255, -1024.01550, 60.48540,0.25,0.00000, 0.00000, 46.00000);
    return 1;
}

public CerrarPuertaMafia(playerid)
{
    MoveObject(PortonMafia,2777.42798, 913.35638, 11.94310,0.50,0.00000, 0.00000, 0.00000);
    return 1;
}

public CerrarPorton(playerid)
{
    MoveObject(PortonLSPD,1589.67676, -1638.26611, 14.42560,0.50,0.00000, 0.00000, 90.00000);
    return 1;
}

public CerrarPuertaGarage(playerid)
{
    MoveObject(PuertaGarage,1582.52600, -1637.88293, 12.35600,0.25,0.00000, 0.00000, 360.00000);
    return 1;
}

public AtendidoPorHP(playerid)
{
    SCM(playerid,-1,"Fuiste atendido por el Hospital El costo fue de 800$");
    GameTextForPlayer(playerid,"Has perdido el conocimiento de hace 5 minutos...", 5000, 3);
    SetPlayerHealth(playerid, 50);
    PlayerInfo[playerid][pDinero] -= 800;
    PlayerInfo[playerid][pMuerto] = 0;
    PlayerInfo[playerid][pAbatido] = 0;
    SetPlayerPos(playerid, 1172.678955,-1323.328369,15.402153);
    KillTimer(timerAbatido[playerid]);
    ClearAnimations(playerid, 1);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    TogglePlayerControllable(playerid, true);
    return 1;
}

public abatido(playerid)
{
    ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.1, 1, 1, 1, 1, 1, 1);
    return 1;
}

public muriendo(playerid)
{
    new Float:health;
    GetPlayerHealth(playerid, health);
    if(PlayerInfo[playerid][pVip] == 1)
    {
        LowLife[playerid] -= 1;
        SetPlayerHealth(playerid, health + LowLife[playerid]);
    }
    else
    {
        LowLife[playerid] -= 2;
        SetPlayerHealth(playerid, health + LowLife[playerid]);
    }
    if(health == 0)
    {
        SetPlayerHealth(playerid, 60.0);
        KillTimer(timerdead[playerid]);
        KillTimer(timerAbatido[playerid]);
        ClearAnimations(playerid);
        ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
        SendClientMessage(playerid, -1, "Una ambulancia te dejo en el Hospital mas cercano...");
        SetPlayerPos(playerid, 2034.523315,-1409.273681,17.164062); /* Cordenadas de algim hp */
        TogglePlayerControllable(playerid, true);
        PlayerInfo[playerid][pMuerto] = 1;
        timerporhp[playerid] = SetTimerEx("AtendidoPorHP", 30000, false, "i", playerid);
    }
    return 1;
}

CMD:dargasolina(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new vehicleid, gasolina;
        if(sscanf(params, "ii", vehicleid, gasolina)) return TextdrawError(playerid, "Error: /dargasolina [VID] [GAS]");
        if(gasolina < 0 || gasolina > 100) return TextdrawError(playerid, "Error: la gasolina debe ser mayor a 0 y menor a 100.");
        if(vehicleid == INVALID_VEHICLE_ID) return TextdrawError(playerid, "Error: id de vehiculo invalida.");
        CarsInfo[vehicleid][Gasolina] = gasolina;
        return 1;
    }
    return 0;
}

public encenderauto(playerid)
{
    new vehiculoid = GetPlayerVehicleID(playerid);
    if(CarsInfo[vehiculoid][Gasolina] <= 0) return GameTextForPlayer(playerid,"~g~~h~Este auto no tiene gasolina.",1000,3);
    if(Motor[vehiculoid] == 0)
    {
        GetVehicleParamsEx(vehiculoid,engine, lights, alarm, doors, bonnet, boot, objective);
        SetVehicleParamsEx(vehiculoid, 1, lights, alarm, doors, bonnet, boot, objective);
        Motor[vehiculoid] = 1;
        GameTextForPlayer(playerid,"~g~~h~Vehiculo encendido",1000,3);
        CarsInfo[vehiculoid][GasTimer] = SetTimerEx("BajarGasolina",40000, true, "i", vehiculoid);
    }
    else 
    {
        GetVehicleParamsEx(vehiculoid,engine, lights, alarm, doors, bonnet, boot, objective);
        SetVehicleParamsEx(vehiculoid, 0, lights, alarm, doors, bonnet, boot, objective);
        Motor[vehiculoid] = 0;
        GameTextForPlayer(playerid,"~g~~h~Vehiculo Apagado",1000,3);
        KillTimer(CarsInfo[vehiculoid][GasTimer]);
    }
    return 1;
}

public Unjail(playerid)
{
    new string[256];
    SetPlayerPos(playerid, 1702.620849,-1851.958251,13.564262);
    SetPlayerInterior(playerid, 0);
    PlayerInfo[playerid][pJaileado] = 0;
    KillTimer(PlayerInfo[playerid][TiempoJail]);
    KillTimer(TimeJailQuitVar[playerid]);
    GameTextForPlayer(playerid, "~g~ Eres Libre", 5000, 6);
    format(string,sizeof(string),"[JailOOC] %s ha salido de JailOOC",pName(playerid));
    SendClientMessageToAll(COLOR_ROJO,string);
    PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    PlayerInfo[playerid][TiempoJail] = 0;
    return 1;
}

public Desencarcelado(playerid)
{
    SetPlayerPos(playerid,1539.870849,-1675.413330,13.549486);
    SetPlayerInterior(playerid, 0);
    PlayerInfo[playerid][pJaileado] = 0;
    KillTimer(PlayerInfo[playerid][TimeCarcel]);
    GameTextForPlayer(playerid, "~g~Saliste De ~b~ cana", 5000, 6);
    PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    return 1;
}
/* Functions */
funcion Graffo0()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo0 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2064.731689,-999.049194,54.367187, 63, 0, MAPICON_GLOBAL);
            }
        }

    return 1;
}

funcion Graffo1()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo1 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2221.707031,-1042.938110,57.933547, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo2()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo2 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2789.516601,-1079.378417,30.718750, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo3()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo3 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2662.825195,-1001.582214,86.117431, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo4()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo4 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2820.704101,-1160.303588,25.340770, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo5()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo5 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53,  824.957031,-1361.526123,25.856620, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo6()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo6 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2710.410156,-1332.166870,47.693832, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo7()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo7 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2659.709716,-1598.294555,12.479801, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo8()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo8 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53,2757.252685,-2026.808837,13.554687, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo9()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo9 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53,2639.729736,-2044.164306,13.550000, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo10()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo10 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2458.383056,-1973.378906,13.461771, 63, 0, MAPICON_GLOBAL);        }
    }

    return 1;
}

funcion Graffo11()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo11 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2440.219238,-1686.466430,13.804687, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo12()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo12 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2280.905029,-1694.869140,13.610664, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo13()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marc¦ en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo13 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2197.714111,-1593.377685,14.339325, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo14()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo14 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2112.727050,-1595.591064,13.551040, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo15()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo15 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 1929.786010,-2025.660034,13.5468754, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo16()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo16 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 1681.920166,-2163.286621,13.554687, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo17()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo17 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 1020.265625,-2089.253662,13.292871, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo18()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marc¦ en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo18 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 1151.324829,-1877.339477,13.546358, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion Graffo19()
{
    DisputaZonaHide();
    // - //
    TextDrawSetString(ZonaGrafos[3],"El lugar se marco en el mapa.");
    HideTextGra = SetTimer("DisputaZonaHide",8000,0);
    SetTimer("NadiePintoGrafo",300000,0);
    Grafo19 = true;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                TextDrawShowForPlayer(i, EnMarchaGrafo);
                SetPlayerMapIcon(i, 53, 2391.946289,-1240.706787,24.855270, 63, 0, MAPICON_GLOBAL);
        }
    }

    return 1;
}

funcion PGrafo0(playerid)
{
    DisputaZonaHide();
    // -- //
    new string[144];
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[0], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo0 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo1(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[1], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo1 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo2(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[2], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo2 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo3(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[3], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo3 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo4(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[4], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo4 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo5(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[5], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo5 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo6(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[6], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo6 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo7(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[7], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo7 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo8(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[8], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo8 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo9(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[9], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo9 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo10(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[10], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo10 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo11(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[11], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo11 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo12(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[12], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo12 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo13(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[13], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo13 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo14(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[14], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo14 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo15(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[15], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo15 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo16(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[16], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo16 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo17(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[17], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo17 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo18(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[18], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo18 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion PGrafo19(playerid)
{
    new string[144];
    DisputaZonaHide();
    GraffUp[playerid] = 0;
    format(string,sizeof(string),"%s",pName(playerid));
    SetObjectMaterialText(Graffos[19], string , 0, 90, "Comic Sans MS", 24, 1, -65536, 0, 1);
    BandaGanadora(playerid);
    Grafo19 = false;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        RemovePlayerMapIcon(i, 53);
        KillTimer(PintarDisputa[i]);
        GraffUp[i] = 0;
    }
    SetTimer("quitaraviso", 10000, false);
    SetTimer("IniciarGrafos",15000,0);
    return 1;
}

funcion IniciarGrafos()
{
    GrafosIniciados = true;
    DisputaZonaHide();
    // -- //
    new RandomGrafo = random(19);
    switch (RandomGrafo)
    {
      case 0: Disputa0();
      case 1: Disputa1();
      case 2: Disputa2();
      case 3: Disputa3();
      case 4: Disputa4();
      case 5: Disputa5();
      case 6: Disputa6();
      case 7: Disputa7();
      case 8: Disputa8();
      case 9: Disputa9();
      case 10: Disputa10();
      case 11: Disputa11();
      case 12: Disputa12();
      case 13: Disputa13();
      case 14: Disputa14();
      case 15: Disputa15();
      case 16: Disputa16();
      case 17: Disputa17();
      case 18: Disputa18();
      case 19: Disputa19();
    }
    return 1;
}
forward DisputaZonaHide();
public DisputaZonaHide()
{
    TextDrawHideForAll(ZonaGrafos[0]);
    TextDrawHideForAll(ZonaGrafos[1]);
    TextDrawHideForAll(ZonaGrafos[2]);
    TextDrawHideForAll(ZonaGrafos[3]);
    TextDrawHideForAll(ZonaGrafos[4]);
    TextDrawHideForAll(BandaGanadoraGrafo[0]);
    TextDrawHideForAll(BandaGanadoraGrafo[1]);
    TextDrawHideForAll(BandaGanadoraGrafo[2]);
    TextDrawHideForAll(BandaGanadoraGrafo[3]);
    TextDrawHideForAll(BandaGanadoraGrafo[4]);
    TextDrawHideForAll(AvisoGrafos1[0]);
    TextDrawHideForAll(AvisoGrafos1[1]);
    TextDrawHideForAll(AvisoGrafos1[2]);
    TextDrawHideForAll(AvisoGrafos1[3]);
    TextDrawHideForAll(AvisoGrafos1[4]);
    TextDrawHideForAll(PintandoGraff[0]);
    TextDrawHideForAll(PintandoGraff[1]);
    TextDrawHideForAll(PintandoGraff[2]);
    TextDrawHideForAll(EnMarchaGrafo);
    return 1;
}
/* Stocks Graffos */
stock GraffitiGanador(playerid)
{
    new grafoprecio = 4000;
    new messagepreciografo[64];
    if((gettime() - LimiteGraffiti) < 60 * 6) return 0;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
    if(IsPlayerConnected(i))
        {
          if(PlayerInfo[playerid][pBanda] >= 1)
            {
                    GivePlayerMoney(i, grafoprecio);
                    format(messagepreciografo, sizeof messagepreciografo, "{65da3c}[BANDA]{FFFFFF}Han ganado %d$ por ganar la disputa.", grafoprecio);
                    // SendMessageToGang(messagepreciografo);
                    GameTextForPlayer(i, "GANADORES", 6000, 1);
                    LimiteGraffiti = gettime();
            }
        }
    }
    return 1;
}

stock BandaGanadora(playerid)
{
    DisputaZonaHide();
    // -- //
    new string[144];
    new ColorGang = GetPlayerColor(playerid);
    KillTimer(HideTextGra);
    format(string,sizeof(string),"Gano: %s",pName(playerid));
    TextDrawSetString(BandaGanadoraGrafo[4], string);
    TextDrawColor(BandaGanadoraGrafo[4], ColorGang);
    HideTextGra = SetTimer("DisputaZonaHide",15000,0);
    GraffitiGanador(playerid);
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, BandaGanadoraGrafo[0]);
                TextDrawShowForPlayer(i, BandaGanadoraGrafo[1]);
                TextDrawShowForPlayer(i, BandaGanadoraGrafo[2]);
                TextDrawShowForPlayer(i, BandaGanadoraGrafo[3]);
                TextDrawShowForPlayer(i, BandaGanadoraGrafo[4]);
                TextDrawHideForPlayer(i, PintandoGraff[0]);
                TextDrawHideForPlayer(i, PintandoGraff[1]);
                TextDrawHideForPlayer(i, PintandoGraff[2]);
        }
    }

    return 1;
}
stock Disputa0()
{
    SetTimer("Graffo0",300000,0);
    TextDrawSetString(ZonaGrafos[3],"Zona:Las colinas");
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
            TextDrawShowForPlayer(i, ZonaGrafos[0]);
            TextDrawShowForPlayer(i, ZonaGrafos[1]);
            TextDrawShowForPlayer(i, ZonaGrafos[2]);
            TextDrawShowForPlayer(i, ZonaGrafos[3]);
            TextDrawShowForPlayer(i, ZonaGrafos[4]);
            SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }
    return 1;
}

stock Disputa1()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Las colinas");
    SetTimer("Graffo1",300000,0);
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa2()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Las colinas");
    SetTimer("Graffo2",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa3()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Las colinas");
    HideTextGra = SetTimer("DisputaZonaHide",15000,0);
    SetTimer("Graffo3",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa4()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: East Beach");
    SetTimer("Graffo4",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
            }
        }

    return 1;
}

stock Disputa5()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: East beach");
    SetTimer("Graffo5",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa6()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Las flores");
    SetTimer("Graffo6",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }
    return 1;
}

stock Disputa7()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: East beach");
    SetTimer("Graffo7",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }
    return 1;
}

stock Disputa8()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: playa de seville");
    SetTimer("Graffo8",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa9()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: WillowField");
    SetTimer("Graffo9",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa10()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Willowfield");
    SetTimer("Graffo10",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa11()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Ganton");
    SetTimer("Graffo11",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa12()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Ganton");
    SetTimer("Graffo12",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa13()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Idlewood");
    SetTimer("Graffo13",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa14()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Idlewood");
    SetTimer("Graffo14",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa15()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: El corona");
    SetTimer("Graffo15",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa16()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Verdant Bluffs");
    SetTimer("Graffo16",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa17()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Verdant Bluffs");
    SetTimer("Graffo17",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa18()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: Verdant Bluffs");
    SetTimer("Graffo18",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}

stock Disputa19()
{
    TextDrawSetString(ZonaGrafos[3],"Zona: East Los santos");
    SetTimer("Graffo19",300000,0);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
                TextDrawShowForPlayer(i, ZonaGrafos[0]);
                TextDrawShowForPlayer(i, ZonaGrafos[1]);
                TextDrawShowForPlayer(i, ZonaGrafos[2]);
                TextDrawShowForPlayer(i, ZonaGrafos[3]);
                TextDrawShowForPlayer(i, ZonaGrafos[4]);
                SetTimerEx("DisputaZonaHide", 15000, false, "i", i);
        }
    }

    return 1;
}
/*
------------------------------------------------------
-----------------------Comandos-----------------------
------------------------------------------------------
*/

CMD:cargarvehiculos(playerid)
{
    SendClientMessage(playerid, -1, "Tus vehiculos estan siendo cargados.");
    LoadPlayerVehicles(playerid);
    return 1;
}
CMD:n(playerid,params[])
{
    SCM(playerid,-1,"El comando es /duda [tu duda]");
    return 1;
}

CMD:discord(playerid,params[])
{
    SendClientMessage(playerid,-1,"[DISCORD de LatinRP]""{005EF7}->{FFFFFF}=============== https://discord.gg/c5P6zX============{005EF7}<-{FFFFFF}");
    return 1;
}

CMD:restart(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        SendClientMessageToAll(COLOR_CELESTE,"[{005EF7}->{FFFFFF} Server Info {005EF7}<-{FFFFFF}]"#Rojo"LatinRP se reiniciara ahora mismo");
        SendRconCommand("exit");
        return 1;
    }
    return 0;
}

CMD:bailar(playerid, params[])
{
    if (!strcmp(params, "1", true))
    {
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
    }
    else if (!strcmp(params, "2", true))
    {
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
    }
    if (!strcmp(params, "3", true))
    {
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
    }
    if (!strcmp(params, "4", true))
    {
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
    }
    return 1;
}

CMD:rendirse(playerid,params[])
{
    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
    return 1;
}

CMD:jetpack(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new nameadmin[MAX_PLAYER_NAME];
        new string[256];
        GetPlayerName(playerid, nameadmin, 24);
        format(string, sizeof(string), "[Staff]{ff6529} %s saco un jetpack ",nameadmin);
        SendMessageToAdmin(string);
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
        return 1;
    }
    return 0;
}

CMD:rc(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new nameadmin[MAX_PLAYER_NAME];
        new string[256];
        new veh = GetPlayerVehicleID(playerid);
        SetVehicleHealth(veh, 1000);
        RepairVehicle(veh);
        SendClientMessage(playerid, COLOR_GREEN, "Vehiculo Reparado");
        GetPlayerName(playerid, nameadmin, 24);
        format(string, sizeof(string), "[Staff]{ff6529} %s reparo su vehiculo",nameadmin);
        SendMessageToAdmin(string);
        return 1;
    }
    return 0;   
}

CMD:reparar(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new nameadmin[MAX_PLAYER_NAME];
        new namerc[MAX_PLAYER_NAME];
        new string[256];
        new ID;
        if(sscanf(params, "i", ID)) return SCM(playerid, 0xEFEFF7AA, "Utilize: /reparar [ID]");
        new veh = GetPlayerVehicleID(ID);
        GetPlayerName(playerid, nameadmin, 24);
        GetPlayerName(ID, namerc, 24);
        SetVehicleHealth(veh, 1000);
        RepairVehicle(veh);
        SendClientMessage(playerid, COLOR_GREEN, "Reparaste el vehiculo.");
        format(string, sizeof(string), "[Staff]{ff6529} %s reparo el vehiculo de %s",nameadmin,namerc);
        SendMessageToAdmin(string);
        return 1;
    }
    return 0;   
}

CMD:borracho(playerid)
{
    ApplyAnimation(playerid, "PED", "WALK_DRUNK", 4.1, 1, 1, 1, 1, 1, 1);
    return 1;
}

CMD:no(playerid)
{
    if(PlayerInfo[playerid][pAbatido] == 1)
    {
        SCM(playerid,-1,"Estas abatido no puedes usar este comando");
    }
    else
    {
        ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
    }
    return 1;
}

CMD:cpborrar(playerid)
{
    DisablePlayerCheckpoint(playerid);
    return 1;
}

CMD:ad(playerid,params[])
{
    if(!isnull(params))
    {
        if((gettime() - tsanuncio[playerid]) < 60 * 1) return SendClientMessage(playerid, -1, "Tienes Que Esperar 1 Minuto Para Volver a Poner Un Anuncio");
        {
            new string[256];
            new nombre[MAX_PLAYER_NAME];
            GetPlayerName(playerid,nombre,sizeof(nombre));
            format(string, sizeof(string), "[Anuncio]: {FFFFFF} %s", params);
            SendClientMessageToAll(COLOR_YELLOW, string);
            tsanuncio[playerid] = gettime();
        }
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/ad [Texto]");
    return 1;
}

CMD:b(playerid,params[])
{
    if(!isnull(params))
    {
        new name[MAX_PLAYER_NAME],string[256];
        GetPlayerName(playerid, name, sizeof  name);
        format(string, sizeof(string), "[OOC]%s:(( %s ))", name, params);
        SendClientMessageToNearby(playerid, -1, 10.0, string);
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/b [Texto]");
    return 1;
}
CMD:me(playerid, params[])
{
    if(!isnull(params))
    {
        new string[128];
        format(string, sizeof(string), "{9933FF} %s:* %s *",pName(playerid),params);
        SendClientMessageToNearby(playerid, -1, 10.0, string);
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/me [Texto]");
    return 1;
}

CMD:g(playerid, params[])
{
    if(!isnull(params))
    {
        new string[256];
        new name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, sizeof  name);
        format(string, sizeof(string), "%s grita: %s!!",name,params);
        SendClientMessageToNearby(playerid, -1, 20.0, string);
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/g [Texto]");
    return 1;
}

CMD:s(playerid, params[])
{
    if(isnull(params)) return SendClientMessage(playerid, -1, "Error: {C4FF66}/s{FFFFFF} [TEXTO]");
    new string[145];
    format(string, sizeof(string), "%s susurra: %s",pName(playerid),params);
    SendClientMessageToNearby(playerid, -1, 5.0, string);
    return 1;
}

CMD:do(playerid, params[])
{
    if(!isnull(params))
    {
        new string[256];
        format(string, sizeof(string), "(( * %s * )) [ID:%d]",params,playerid);
        SendClientMessageToNearby(playerid, COLOR_ORANGE, 10.0, string);
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/do [Texto]");
    return 1;
}

CMD:entorno(playerid, params[])
{
    if(!isnull(params))
    {
        new string[256];
        new zone[MAX_ZONE_NAME];
        GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
        format(string, sizeof(string), "[Entorno](ID:%d): {FFFFFF} %s en %s",playerid,params[0],zone);
        RadioPolicia(string);
        SendClientMessageToAll(-1,"[Server]-Se ha realizado una llamada de entorno @{005EF7}Policias");
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/entorno [Texto] (no pongas ubicacion el comando la agrega sola :D )");
    return 1;
}

CMD:t(playerid, params[])
{
    new string[128],name[MAX_PLAYER_NAME];
    if(!isnull(params))
    {
        if((gettime() - tstwit[playerid]) < 60 * 1) return SendClientMessage(playerid, -1, "Tienes Que Esperar 1 Minuto Para Volver A Twittear");
        {
            if(twitanonimo[playerid] == 1)
            {
            format(string, sizeof(string), "[Twitter]-@Anonimo: {FFFFFF} %s ",params[0]);
            SendClientMessageToAll(COLOR_CELESTE, string);
            tstwit[playerid] = gettime();
            }
            else 
            {
            GetPlayerName(playerid, name, sizeof  name);
            format(string, sizeof(string), "[Twitter] @%s: {FFFFFF} %s ",name,params[0]);
            SendClientMessageToAll(COLOR_CELESTE, string);
            tstwit[playerid] = gettime();
            }
        }
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/t [Texto]");
    return 1;
}

CMD:strip(playerid, params[])
{
    if(sscanf(params, "i", params[0]))   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /strip [1-7]");
    if(params[0] < 1 || params[0] > 5)   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /strip [1-7]");

    switch(params[0])
    {
        case 1: ApplyAnimation(playerid,"STRIP", "strip_A", 4.1, 1, 1, 1, 1, 1 );
        case 2: ApplyAnimation(playerid,"STRIP", "strip_B", 4.1, 1, 1, 1, 1, 1 );
        case 3: ApplyAnimation(playerid,"STRIP", "strip_C", 4.1, 1, 1, 1, 1, 1 );
        case 4: ApplyAnimation(playerid,"STRIP", "strip_D", 4.1, 1, 1, 1, 1, 1 );
        case 5: ApplyAnimation(playerid,"STRIP", "strip_E", 4.1, 1, 1, 1, 1, 1 );
        case 6: ApplyAnimation(playerid,"STRIP", "strip_F", 4.1, 1, 1, 1, 1, 1 );
        case 7: ApplyAnimation(playerid,"STRIP", "strip_G", 4.1, 1, 1, 1, 1, 1 );
    }
    return 1;
}

CMD:llorar(playerid)
{
    ApplyAnimation(playerid,"GRAVEYARD","mrnF_loop",4.1,0,0,0,0,0);
    return 1;
}

CMD:detener(playerid)
{
    ApplyAnimation(playerid,"POLICE","CopTraf_Stop",4.1,0,0,0,0,0);
    return 1;
}

CMD:cnn(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        if(sscanf(params,"s",params[0])) return SendClientMessage(playerid,-1,"USO: {15FF00}/cnn [texto]");
        new string[128],name[MAX_PLAYER_NAME];
        GetPlayerName(playerid, name, sizeof  name);
        format(string, sizeof(string), "[CNN]Reportero:%s  (( %s ))",name,params[0]);
        SendClientMessageToAll(COLOR_RED, string);
        return 1;
    }
    return 0;
}

CMD:dw(playerid, params[])
{
    if(!isnull(params))
    {
        if((gettime() - tsdeepweb[playerid]) < 60 * 1) return SendClientMessage(playerid, -1, "Tienes Que Esperar 1 Minuto Para Volver A Mandar Un Mensaje");
        {
            new string[128];
            if(sscanf(params,"s",params[0])) return SendClientMessage(playerid,-1,"USO: {15FF00}/dw [texto]");
            if(anonimodb[playerid] == 1)
            {
            format(string, sizeof(string), "[DeepWeb]Anonimo: {FFFFFF} %s ",params[0]);
            SendClientMessageToAll(COLOR_GREEN, string);
            tsdeepweb[playerid] = gettime();
            }
            else
            {
            format(string, sizeof(string), "[DeepWeb]%s: {FFFFFF} %s ",pName(playerid),params[0]);
            SendClientMessageToAll(COLOR_GREEN, string);
            tsdeepweb[playerid] = gettime();
            }
        }
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/deepweb[Texto]");
    return 1;
}

CMD:ooc(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        if(!isnull(params))
        {
            new string[256];
            format(string, sizeof(string), "[Mensaje OOC]:{FFFFFF} %s", params);
            SendClientMessageToAll(COLOR_RED, string);
        }
        else return SendClientMessage(playerid, -1, "Error: /ooc [texto]");
        return 1;
    }
    return 0;
}

CMD:gps(playerid)
{
    if(PlayerInfo[playerid][pGps] != 0)
    {
        ShowPlayerDialog(playerid,DIALOGO_GPS1,  DIALOG_STYLE_LIST, "GPS"," Trabajos\nLugares Urbanos\nLugares Publicos\nTiendas\nConcesionarios","Aceptar","Cerrar");
    }
    else return SCM(playerid,-1,"No tienes Un Gps puedes comprar 1 en un Oxxo");
    return 1;
}

CMD:reglas(playerid,params[])
{
    new str[2300];
    strcat(str, " {FF0000}> {ffffff}No usar {FF905F}ningúna modificación que te de ventaja {ffffff}sobre otros jugadores {FF905F}(Modificación = Cleos, Hacks o como gustes llamarle){ffffff}.\n");
    strcat(str, " {FF0000}> {ffffff}No uses el comando {ffff00}/reportar{ffffff} incorrectamente. {FF905F}(Bromas - Mensajes al staff - Reportes Falsos){ffffff}.\n");
    strcat(str, " {FF0000}> {ffffff}Acorde a nuestro rol de Ciudad {FF0000}RPG{FFFFFF} el uso de armas no es tan restringido, {FF905F}Lo cual puedes usarla mas libremente{FFFFFF}, Esto sin cometer {FF0000}DM{FFFFFF}\n");
    strcat(str, " {FF0000}> {ffffff}Recuerda que estas en un RolePlay medio {FF0000}no{FFFFFF} RP bajo Ten cuidado con lo que haces\n");
    ShowPlayerDialog(playerid,5, DIALOG_STYLE_MSGBOX, "{ffffff}REGLAS DEL SERVIDOR", str, "Aceptar", ""); // mostramos el título del diálogo // cambiar el dialogo ID 2017 por si lo tienes ocupado
    PlayerPlaySound(playerid,1139,0.0,0.0,0.0);
    return 1;
}

CMD:kill(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        new ID;
        new nameadmin[MAX_PLAYER_NAME];
        new name[MAX_PLAYER_NAME];
        new string[128];
        if(sscanf(params,"i", ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/kill [ID]");
        SetPlayerHealth(ID,0.0);
        SendClientMessage(ID, -1, "Un staff te acaba de matar.");
        GetPlayerName(ID, name, 24);
        GetPlayerName(playerid, nameadmin, 24);
        format(string, sizeof(string), "[Staff]{ff6529} %s mato a {FFFFFF} %s",nameadmin,name);
        SendMessageToAdmin(string);
        return 1;
    }
    return 0;
}

CMD:chaleco(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new string[144],id;
        if(sscanf(params,"u",id)) return TextdrawError(playerid,"USO: /chaleco [id/nombre]");
        format(string, sizeof(string), "[Staff]{ff6529} %s le lleno el chalco a {FFFFFF}%s",pName(playerid),pName(id));
        SendMessageToAdmin(string);
        format(string, sizeof(string), "{ff6529}%s te lleno el chaleco",pName(playerid));
        SendClientMessage(id,-1,string);
        SetPlayerArmour(id,100);
        return 1;
    }
    return 0;
}

CMD:vida(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new id,string[144];
        if(sscanf(params,"u", id)) return TextdrawError(playerid,"USO: {15FF00}/vida [id/nombre]");
        format(string, sizeof(string), "[Staff]{ff6529} %s le lleno la vida a  %s",pName(playerid), pName(id));
        SendMessageToAdmin(string);
        format(string, sizeof(string), "{ff6529}%s te lleno la vida",pName(playerid));
        SendClientMessage(id,-1,string);
        SetPlayerHealth(id, 100);
        return 1;
    }
    return 0;
}

CMD:m(playerid,params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 1)
    {
        new name[MAX_PLAYER_NAME],string[128];
        if(sscanf(params,"s",params[0])) return SendClientMessage(playerid,COLOR_RED,"USO: {15FF00}/m [texto]");
        GetPlayerName(playerid, name, sizeof  name);
        format(string, sizeof(string), "{0066CC}[Megafono]Oficial:%s Dice: {FFFFFF}¡%s!", name, params);
        SendClientMessageToNearby(playerid, COLOR_AZUL, 50.0, string);
    }
    return 1;
}

CMD:dinerotodos(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new money;
        new string[144];
        if(sscanf(params, "i", money)) return SCM(playerid,-1,"USO: "#COLOR_AMARILLO"/dinerotodos [dinero a regalar]");
        foreach(new i : Player)
        {
            PlayerInfo[i][pDinero] += money;
        }
        format(string, sizeof(string), "Un administraodr le ha dado %i$ a todos los jugadores.", money);
        SendClientMessageToAll(COLOR_RED, string);
        return 1;
    }
    return 0;
}

CMD:limpiarchat(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        foreach(new i : Player)
        {
            ClearPlayerChat(i);
        }
        new nombre[MAX_PLAYER_NAME], string[128];
        GetPlayerName(playerid, nombre, sizeof(nombre));
        format(string, sizeof(string), "%s ha limpiado el chat.", nombre);
        SendClientMessageToAll(COLOR_VERDE_CLARO, string);
        return 1;
    }
    return 0;
}

CMD:rodar(playerid, params[])
{
    ApplyAnimation(playerid,"PED","BIKE_fallR",4.0,0,1,1,1,0);//rodar
    SendClientMessage(playerid, -1, "{CCCCCC}Para cancelar la animacion utiliza /no.");
    return 1;
}

CMD:paja(playerid, params[])
{
    ApplyAnimation(playerid, "PAULNMAC", "wank_loop", 4.0, 1, 0, 0, 1, 0);
    SendClientMessage(playerid, -1, "{CCCCCC}Para cancelar la animacion utiliza /no.");
    return 1;
}

CMD:recostarse(playerid, params[])
{
    if(sscanf(params, "i", params[0]))   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /recostarse [1-5]");
    if(params[0] < 1 || params[0] > 5)   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /recostarse [1-5]");

    switch(params[0])
    {
        case 1: ApplyAnimation(playerid,"BEACH","bather",4.1,0,1,1,1,1);
        case 2: ApplyAnimation(playerid,"BEACH","Lay_Bac_Loop",4.1,0,1,1,1,1);
        case 3: ApplyAnimation(playerid,"BEACH","BD_Fire3",4.1,0,1,1,1,1);
        case 4: ApplyAnimation(playerid,"BEACH","ParkSit_W_loop",4.1,0,1,1,1,1);
        case 5: ApplyAnimation(playerid,"BEACH","SitnWait_loop_W",4.1,0,1,1,1,1);
    }
    return 1;
}

CMD:nalgada(playerid, params[])
{
    ApplyAnimation(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0);//nalgada
    SendClientMessage(playerid, -1, "{CCCCCC}Para cancelar la animacion utiliza /no.");
    return 1;
}

CMD:c(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pPolicia] >= 2 || PlayerInfo[playerid][pFbi] >= 1) 
    {
        new jugador;
        new LevelWan;
        new razonc;
        new string[256];
        if(sscanf(params,"uis", jugador, LevelWan, razonc)) return SCM(playerid,-1,"USO:{15FF00}/c [ID] [cargos] [Razon]");
        if(LevelWan > 6 || LevelWan < 1) return SCM(playerid,-1,"Cargos 1-6");
        SetPlayerWantedLevel(jugador, LevelWan);
        PlayerInfo[jugador][pCargos] = LevelWan;
        format(PlayerInfo[jugador][RazonCargos],64,"%s",razonc);
        format(ColocoCargos[jugador],30,"%s",pName(playerid));
        format(string,sizeof(string),"[Radio Policia] %s ha puesto los cargos de %s en %d razon: %s ",pName(playerid),pName(jugador),LevelWan,razonc);
        RadioPolicia(string);
        QuitCargos[jugador] = SetTimerEx("SacarCargos", 300000, true, "u", jugador);
        return 1;
    }
    return 0;
}
CMD:razon(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2 || PlayerInfo[playerid][pPolicia] >= 1 || PlayerInfo[playerid][pFbi] >= 1)
	{
		new string[200],jugador;
		if(sscanf(params,"u",jugador)) return TextdrawError(playerid,"/razon [jugador]");
		if(PlayerInfo[jugador][pCargos] == 0) return SendClientMessage(playerid,-1,"Este jugador no tiene cargos");
		format(string,sizeof(string),"Los cargos los coloco: %s \n razon: {FFFFFF} %s",ColocoCargos[jugador],PlayerInfo[jugador][RazonCargos]);
		ShowPlayerDialog(playerid, 5, DIALOG_STYLE_MSGBOX, "Razon cargos", string, "Aceptar", "Cancelar");
		return 1;
	}
	return 0;
}
CMD:traer(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new ID;
        if(sscanf(params, "u", ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/traer [ID]");
        if(ID != INVALID_PLAYER_ID)
        {
            new Float:x, Float:y, Float:z, name[MAX_PLAYER_NAME], nameadmin[MAX_PLAYER_NAME], string[128];
            GetPlayerPos(playerid, x, y, z);
            GetPlayerName(ID, name, MAX_PLAYER_NAME);
            GetPlayerName(playerid, nameadmin, MAX_PLAYER_NAME);
            format(string, sizeof(string), "[Staff]{ff6529} %s tepeo a {FFFFFF} %s {ff6529} hacia su posicion.", nameadmin, name);
            SendMessageToAdmin(string);
            SetPlayerPos(ID, x, y, z);
        }
        return 1;
    }
    return 0;
}

CMD:sduty(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        if(EsAdmin[playerid] == true)
        {
            new string[128];
            new nameadmin[MAX_PLAYER_NAME];
            EsAdmin[playerid] = false;
            GetPlayerName(playerid, nameadmin, 24);
            format(string, sizeof(string), "[Staff]{ff6529} %s salio del servicio administrativo.", nameadmin);
            SendMessageToAdmin(string);
            SetPlayerColor(playerid, -1);
            SetPlayerSkin(playerid,PlayerInfo[playerid][pRopa]);
        }
        else
        {
            new string[128];
            GuardarJugador(playerid);
            new nameadmin[MAX_PLAYER_NAME];
            EsAdmin[playerid] = true;
            GetPlayerName(playerid, nameadmin, 24);
            format(string, sizeof(string), "[Staff]{ff6529} %s entro en servicio administrativo.", nameadmin);
            SendMessageToAdmin(string);
            SetPlayerColor(playerid, COLOR_RED);
            SetPlayerSkin(playerid, 217);
        }
        return 1;
    }
    return 0;
}

CMD:skin(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new SkinId, string[128];
        new ID;
        new name[MAX_PLAYER_NAME];
        new nameadmin[MAX_PLAYER_NAME];
        if(sscanf(params,"ui", ID,SkinId)) return TextdrawError(playerid,"USO: {15FF00}/skin [id][id de skin]");
        GetPlayerName(ID, name, 24);
        GetPlayerName(playerid, nameadmin, 24);
        format(string, sizeof(string), "[Staff]{ff6529} %s cambio el skin de {FFFFFF}%s {ff6529}a {FFFFFF}%i",nameadmin, name, SkinId);
        SendMessageToAdmin(string);
        GetPlayerName(playerid, nameadmin, sizeof(nameadmin));
        format(string, sizeof(string), "El staff %s cambio tu skin por la %i",nameadmin, SkinId);
        SendClientMessage(ID,COLOR_CELESTE,string);
        SetPlayerSkin(ID, SkinId);
        PlayerInfo[ID][pRopa] = SkinId;
        return 1;
    }
    return 0;
}

CMD:duda(playerid, params[])
{
    if(!isnull(params))
    {
        if((gettime() - tsduda[playerid]) < 60 * 1) return SendClientMessage(playerid, -1, "Tienes Que Esperar 1 Minuto Para Volver A mandar una duda");
        {
            new rango[50],string[256];
            switch(PlayerInfo[playerid][pAdmin])
            {
                case 1: rango = "Ayudante";
                case 2: rango = "Moderador";
                case 3: rango = "Administrador";
                case 4: rango = "Encargado Del Staff";
                case 5: rango = "Fundador";
            }
            if(PlayerInfo[playerid][pAdmin] >= 1)
            {
                format(string, sizeof(string), "[Dudas]%s-%s(%d): {FFFFFF}  %s ", rango, pName(playerid),playerid,params[0]);
                SendClientMessageToAll(COLOR_FLBLUE,string);
            }
            else
            {
                format(string, sizeof(string), "[Dudas]%s(%i) [lvl:%d]: {FFFFFF}  %s ", pName(playerid), playerid,GetPlayerScore(playerid), params[0]);
                SendClientMessageToAll(COLOR_FLBLUE,string);
                tsduda[playerid] = gettime();
            }
        }
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/duda [Texto]");
    return 1;
}

CMD:vidatodos(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        foreach(new i : Player)
        {
            SetPlayerHealth(i,100);
        }
        SendClientMessageToAll(COLOR_RED,"[Anuncios Staff] Se lleno la vida de todos los jugadores");
        return 1;
    }
    return 0;
}

CMD:chalecotodos(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        foreach(new i : Player)
        {
            SetPlayerArmour(i,100);
        }
        SendClientMessageToAll(COLOR_RED,"[Anuncios Staff] Se lleno el chaleco de todos los jugadores");
        return 1;
    }
    return 0;
}

CMD:dararma(playerid, params[])
{
    return cmd_arma(playerid, params);
}

CMD:help(playerid, params[])
{
    return cmd_ayuda(playerid);
}

CMD:updates(playerid)
{
    ShowPlayerDialog(playerid, DIALOG_UPDATES, DIALOG_STYLE_LIST, "Updates/Actualizaciones | Latin RP","-> Updates hechas [v0.3]\n-> Updates por hacer [0.4]","Ver","Cancelar");
    return 1;
}

CMD:actualizaciones(playerid)
{
    cmd_updates(playerid);
    return 1;
}

CMD:arma(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new id,string[256], string1[256], string2[256], arma, municion;
        if(sscanf(params,"uii", id,arma,municion)) return SendClientMessage(playerid,-1,"USO: {15FF00}/arma [ID/nombre] [id arma][balas]");
        if (IsPlayerConnected(id))
        {
            format(string1, sizeof(string1), "Le has dado a %s un arma. (ID: %d - Municion: %d)", pName(id), arma, municion);
            format(string2, sizeof(string2), "%s te ha dado un arma. (ID: %d - Municion: %d)", pName(playerid), arma, municion);
            SendClientMessage(playerid, COLOR_AZUL, string1);
            SendClientMessage(id, COLOR_VERDE_CLARO, string2);
            PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
            PlayerPlaySound(id, 1057, 0.0, 0.0, 0.0);
            format(string, sizeof(string), "[Staff]{ff6529} %s le dio el arma: %i, balas: %i a {FFFFFF}%s",pName(playerid),arma,municion,pName(id));
            SendMessageToAdmin(string);
            GivePlayerWeapon(id, arma, municion);
        }
        else return SendClientMessage(playerid, COLOR_ROJO, "El jugador no se encuentra conectado.");
        return 1;
    }
    return 0;
}

CMD:armatodos(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new string[256], arma, municion, nameadmin[MAX_PLAYER_NAME];
        if(sscanf(params,"ii",arma,municion)) return SendClientMessage(playerid, -1, "USO: {15FF00}/armatodos [id arma][balas]");
        {
            GetPlayerName(playerid, nameadmin, 24);
            format(string, sizeof(string), "{0066CC}[Anuncios Staff]:%s  le dio La Arma ID:(%d) Balas:(%d) {15FF00} a todos los jugadores", nameadmin, arma, municion);
            SendClientMessageToAll(-1, string);
            foreach(new i : Player)
            {
                GivePlayerWeapon(i, arma, municion);
                PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
            }
        }
        return 1;
    }
    return 0;
}

CMD:idarmas(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        SendClientMessage(playerid,-1,"1-Puno Americano");
        SendClientMessage(playerid,-1,"2-Palo De Golf");
        SendClientMessage(playerid,-1,"3-Macana");
        SendClientMessage(playerid,-1,"4-Cuchillo");
        SendClientMessage(playerid,-1,"5-Bate");
        SendClientMessage(playerid,-1,"6-Pala");
        SendClientMessage(playerid,-1,"7-Palo De Villar");
        SendClientMessage(playerid,-1,"8-Katana");
        SendClientMessage(playerid,-1,"9-Motocierra");
        SendClientMessage(playerid,-1,"10-Dildo ");
        SendClientMessage(playerid,-1,"11-Otro Dildo");
        SendClientMessage(playerid,-1,"12-Dildo Vibrador");
        SendClientMessage(playerid,-1,"13-Dildo Vibrador mas chiquito");
        SendClientMessage(playerid,-1,"14-Flores");
        SendClientMessage(playerid,-1,"15-Baston ");
        SendClientMessage(playerid,-1,"16-Granada");
        SendClientMessage(playerid,-1,"17-Granda De Gas");
        SendClientMessage(playerid,-1,"18-Molotov");
        SendClientMessage(playerid,-1,"22-9mm");
        SendClientMessage(playerid,-1,"23-9mm silenciada");
        SendClientMessage(playerid,-1,"24-Desert-Eagle");
        SendClientMessage(playerid,-1,"25-Shotgun");
        SendClientMessage(playerid,-1,"26-Escopeta-Recortada");
        SendClientMessage(playerid,-1,"27-EDC");
        SendClientMessage(playerid,-1,"28-Micro Uzi");
        SendClientMessage(playerid,-1,"29-MP5");
        SendClientMessage(playerid,-1,"30-Ak-47");
        SendClientMessage(playerid,-1,"31-M4");
        SendClientMessage(playerid,-1,"32-Tec9");
        SendClientMessage(playerid,-1,"33-Rifle De Caza");
        SendClientMessage(playerid,-1,"34-Sniper");
        SendClientMessage(playerid,-1,"35-RPG");
        SendClientMessage(playerid,-1,"36-HS-Rocket (otra vasuca)");
        SendClientMessage(playerid,-1,"37-Lanzallamas");
        SendClientMessage(playerid,-1,"38-Minigun");
        SendClientMessage(playerid,-1,"39-C4");
        SendClientMessage(playerid,-1,"40-Detonador");
        SendClientMessage(playerid,-1,"41-SPRAY");
        SendClientMessage(playerid,-1,"42-Extinguidor");
        SendClientMessage(playerid,-1,"43-Camara");
        SendClientMessage(playerid,-1,"44-Lentes Termicos");
        SendClientMessage(playerid,-1,"46-Paracaidas");
        return 1;
    }
    return 0;
}

CMD:expulsarv(playerid,params[])
{
    new ID;
    new name[MAX_PLAYER_NAME];
    new expulsado[MAX_PLAYER_NAME];
    new string[128];
    if(sscanf(params,"i", ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/expulsarauto [ID/nombre]");
    GetPlayerName(ID,expulsado, sizeof(expulsado));
    format(string, sizeof(string), "Has expulsado a %s de tu auto",expulsado);
    SendClientMessage(playerid,COLOR_CELESTE,string);
    GetPlayerName(playerid, name, sizeof(name));
    format(string, sizeof(string), "%s te ha expulsado de su auto",name);
    SendClientMessage(ID,COLOR_CELESTE,string);
    RemovePlayerFromVehicle(ID);
    return 1;
}

CMD:ir(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new id;
        if(sscanf(params, "u", id)) return SendClientMessage(playerid, -1, "Error: /ir [ID/NOMBRE]");
        if(id != INVALID_PLAYER_ID)
        {
            new Float:x, Float:y, Float:z, int, wid, pname[MAX_PLAYER_NAME], idname[MAX_PLAYER_NAME], message1[128], message2[128], message3[128];
            GetPlayerPos(id, x, y, z);
            SetPlayerPos(playerid, x, y, z);
            int = GetPlayerInterior(id);
            SetPlayerInterior(playerid, int);
            wid = GetPlayerVirtualWorld(id);
            SetPlayerVirtualWorld(playerid, wid);
            GetPlayerName(id, idname, sizeof(idname));
            format(message1, sizeof(message1), "{ff6529}Has ido a la posicion de %s", idname);
            SendClientMessage(playerid, -1, message1);
            GetPlayerName(playerid, pname, sizeof(pname));
            format(message2, sizeof(message2), "{ff6529}El staff %s fue a tu posicion.", pname);
            SendClientMessage(id, -1, message2);
            format(message3, sizeof(message3), "[Staff]{ff6529} %s fue a la posicion de {FFFFFF} %s", pname, idname);
            SendMessageToAdmin(message3);
        }
        else SendClientMessage(playerid, -1, "Error: id de jugador invalida.");
        return 1;
    }
    return 0;
}
CMD:jail(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
    {
    	new jugador, razon[64], adv[144],msg[144],tiempo;
    	if(sscanf(params, "uds", jugador, tiempo, razon)) return SCM(playerid, -1, "Utiliza: /jail [Jugador] [Minutos] [Razon]");
    	if(!IsPlayerConnected(jugador)) return SCM(playerid, -1, "Este jugador no esta conectado");
    	if(PlayerInfo[jugador][pJaileado] == 1) return SCM(playerid, -1, "Este usuario ya esta en Jail-OOC!");
    	if(!PlayerInfo[playerid][pAdmin])
    	{
        	format(adv, sizeof(adv), "[Chat-Staff] Atencion: %s intento JAILEAR a %s", pName(playerid), pName(jugador));
        	SendMessageToAdmin(adv);
        	return 1;
   		}
    	ResetPlayerWeapons(jugador);
    	SetPlayerPos(jugador, 346.870025,309.259033,999.155700);
        SetPlayerInterior(jugador, 6);
        GameTextForPlayer(jugador, "~w~Estas En~r~JAIL [OOC]", 10000, 6);
    	format(msg, sizeof(msg), "[JailOOC] %s jaileo a %s durante: %d minuto(s), Razon: {FFFFFF} %s",pName(playerid), pName(jugador), tiempo, razon);
    	SendMessageToAdmin(msg);
    	PlayerInfo[jugador][pJaileado] = 1;
    	PlayerInfo[jugador][TiempoJail] = tiempo * 60*1000;
    	TimeJailQuitVar[playerid] = SetTimerEx("SacarSegundo", 1000, true,"u",playerid);
    	SetTimerEx("Unjail", PlayerInfo[jugador][TiempoJail], false,"u",jugador);
    	CuantoQuedaJail[playerid] = gettime();
    	return 1;
    }
    return 0;
}
forward SacarSegundo(playerid);
public SacarSegundo(playerid)
{
	PlayerInfo[playerid][TiempoJail] -= 1000;
	return 1;
}
forward SacarCargos(playerid);
public SacarCargos(playerid)
{
	PlayerInfo[playerid][pCargos] -= 1;
	SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pCargos]);
	if(PlayerInfo[playerid][pCargos] != 1)
	{
		KillTimer(QuitCargos[playerid]);
	}
	return 1;
}
CMD:tiempo(playerid)
{
	if(PlayerInfo[playerid][pJaileado] != 0)
	{
		new msg[64];
		format(msg, sizeof(msg),"Te quedan %d minutos en jail",CuantoQuedaJail[playerid]);
		SCM(playerid,-1,msg);
	}
	else if(PlayerInfo[playerid][pCarcel] != 0)
	{
		new msg[64];
		format(msg, sizeof(msg),"Te quedan %d minutos en carcel",CuantoQuedaCana[playerid]);
		SCM(playerid,-1,msg);
	}
	else return TextdrawError(playerid,"Error no estas jaileado o encarcelado");
	return 1;
}
CMD:offjail(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new jugador,string[128],razon[64];
        if(sscanf(params,"us", jugador,razon)) return SendClientMessage(playerid,-1,"USO: {15FF00}/offjail [jugador] [Razon]");
        if(!IsPlayerConnected(jugador)) return TextdrawError(playerid,"Error el jugador \n no esta conectado");
        if(!PlayerInfo[playerid][pAdmin])
        {
        	new adv[144];
        	format(adv, sizeof(adv), "[Chat-staff] Atencion: %s intento DESJAILEAR a %s", pName(playerid), pName(jugador));
        	SendMessageToAdmin(adv);
        	return 1;
        }
        if(!PlayerInfo[jugador][pJaileado]) return TextdrawError(playerid,"El id mencionado no esta jaileado.");
        format(string, sizeof(string), "[Chat-Staff] JailOOC: %s desjaileo a %s, razon: {FFFFFF} %s ",pName(playerid),pName(jugador),razon);
        SendMessageToAdmin(string);
        SetPlayerInterior(jugador,0);
        SetPlayerPos(jugador,1702.620849,-1851.958251,13.564262);
        KillTimer(PlayerInfo[jugador][TiempoJail]);
        KillTimer(TimeJailQuitVar[playerid]);
        PlayerInfo[jugador][pJaileado] = 0;
        return 1;
    }
    return 0;
}

CMD:ban(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        new jugador, string[128],razon[64];
        if(sscanf(params, "us[64]",jugador,razon)) return TextdrawError(playerid, "USO: /ban [id/nombre] [razon]");
        format(string, sizeof(string), "[Anuncios Staff] %s ha sido baneado por %s, razon: %s", pName(jugador),pName(playerid),razon);
        SendClientMessageToAll(-1, string);
        PlayerInfo[jugador][pBaneado] = 1;
        GuardarJugador(jugador);
        return 1;
    }
    return 0;
}

CMD:kick(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new string[128],jugador,razon[64];
        if(sscanf(params, "us[64]",jugador,razon)) return SendClientMessage(playerid, -1, "USO: /kick [jugador] [razon]");
        format(string, sizeof(string), "[Anuncios Staff] %s ha sido kickeado por %s, razon: %s", pName(jugador),pName(playerid),razon);
        SendClientMessageToAll(COLOR_RED, string);
        GuardarJugador(jugador);
        Kick(jugador);
        return 1;
    }
    return 0;
}

CMD:desbanear(playerid, params[])
{
    new string[128],jugador;
    if(sscanf(params, "u",jugador)) SendClientMessage(playerid, -1, "USO: /desbanear [jugador]");
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        PlayerInfo[jugador][pBaneado] = 0;
        format(string, sizeof(string),"[BANEOS] Staff - %s Desbaneo A %s", pName(playerid),pName(jugador));
        SendClientMessageToAll(COLOR_RED, string);
        GuardarJugador(jugador);
        return 1;
    }
    return 0;
}

CMD:ayuda(playerid)
{
    ShowPlayerDialog(playerid,DIALOGO_AYUDA,DIALOG_STYLE_LIST, "Ayuda | LatinRP","Trabajos\nVehiculos\nComandos\nInformacion","Aceptar","Cerrar");
    return 1;
}

CMD:esposar(playerid, params[])
{
    return cmd_e(playerid, params);
}

CMD:e(playerid, params[])
{
    if(!PlayerInfo[playerid][pPolicia] || PlayerInfo[playerid][pFbi]) return TextdrawError(playerid,"No Eres Policia o FBI");
    new Float:eX,Float:eY,Float:eZ,ID,string[128];
	if(sscanf(params,"u", ID)) return TextdrawError(playerid,"USO: {15FF00} /e (esposar) [ID]");
	GetPlayerPos(ID, eX, eY, eZ);
	if(!IsPlayerInRangeOfPoint(playerid, 5.0, eX, eY, eZ)) return SCM(playerid,-1,"Debes estar a 5m del jugador");
	SetPlayerSpecialAction(ID,SPECIAL_ACTION_HANDSUP);
	format(string, sizeof(string), "{9933FF} *%s intenta esposar a %s*", pName(playerid),pName(ID));
	SendClientMessageToNearby(playerid, -1, 10.0, string);
	timeresposo[ID] = SetTimerEx("TiempoEsposo", 10000, false,"u",ID);
    return 1;
}

CMD:desesposar(playerid, params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 1 || PlayerInfo[playerid][pFbi] >= 1)
    {
        new Float:dX;
        new Float:dY;
        new Float:dZ;
        GetPlayerPos(playerid, dX, dY, dZ);
        if(IsPlayerInRangeOfPoint(playerid, 4.0, dX, dY, dZ))
        {
            new ID;
            new string[128];
            if(sscanf(params,"u", ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/desposar [ID/nombre]");
            SetPlayerSpecialAction(ID, SPECIAL_ACTION_NONE);
            format(string, sizeof(string), "%s {9933FF}desesposa a %s", pName(playerid), pName(ID));
            SendClientMessageToNearby(playerid, -1, 10.0, string);
        }
    }
    return 1;
}

CMD:arrestar(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
    {
    	new jugador, razon[64], adv[144],msg[144],tiempo;
    	if(sscanf(params, "uds", jugador, tiempo, razon)) return SCM(playerid, -1, "Utiliza: /arrestar [Jugador] [Minutos] [Razon]");
    	if(IsPlayerConnected(jugador)) return SCM(playerid, -1, "Este jugador no esta conectado");
    	if(PlayerInfo[jugador][pJaileado] == 1) return SCM(playerid, -1, "Este usuario ya esta en Jail-OOC!");
    	if(!PlayerInfo[playerid][pAdmin])
    	{
        	format(adv, sizeof(adv), "[Chat-Staff] Atencion: %s intento JAILEAR a %s", pName(playerid), pName(jugador));
        	SendMessageToAdmin(adv);
        	return 1;
   		}
   		ResetPlayerWeapons(jugador);
   		format(msg, sizeof(msg), "[CNN] %s Fue arrestado durante: %d mes(es) Por: %s, Razon: {FFFFFF} %s",pName(jugador), tiempo,pName(playerid), razon);
    	SendClientMessageToAll(-1,msg);
    	PlayerInfo[jugador][pCarcel] = 1;
    	PlayerInfo[jugador][TimeCarcel] = tiempo * 60*1000;
        SetTimerEx("Desencarcelado", PlayerInfo[jugador][TimeCarcel], false,"u",jugador);
		SetPlayerPos(jugador, 215.198913,108.894432,999.015625);
		SetPlayerInterior(jugador,10);
		SetPlayerArmedWeapon(jugador, 0);
		SetPlayerFacingAngle(jugador, 344.0042);
        SetPlayerSpecialAction(jugador, SPECIAL_ACTION_NONE);
        GameTextForPlayer(jugador, "~w~ Caiste ~p~ En ~r~ Cana!", 10000, 6);
        PlayerPlaySound(jugador,1057,0.0,0.0,0.0);
        CuantoQuedaCana[playerid] = gettime();
        return 1;
    }
    return 0;
}
CMD:expulsarlspd(playerid, params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 4 && PlayerInfo[playerid][pAdmin] >= 5)
    {
        new ID;
        new string[256];
        new name[MAX_PLAYER_NAME];
        new nameadmin[MAX_PLAYER_NAME];
        if(sscanf(params,"is", ID,params[0])) return SendClientMessage(playerid,-1,"USO: {15FF00}/sacarlspd [ID][razon]");
        GetPlayerName(ID, name, sizeof  name);
        format(string, sizeof(string), "[LSPD]Oficial:%s Te Ha Despedido! Razon: %s !", name, params[0]);
        SendClientMessage(playerid, -1, "{0066CC}[POLICE]: {15FF00}Echastes a el jugador nombrado !");
        GetPlayerName(playerid, nameadmin, sizeof  nameadmin);
        GetPlayerName(ID, name, sizeof  name);
        format(string, sizeof(string), "[LSPD]Oficial:%s Despidio a: %s Razon: %s", nameadmin,name, params[0]);
        SendClientMessageToAll( -1,string);
        PlayerInfo[ID][pPolicia] = false;
    }
    else
    {
        SendClientMessage(playerid, -1, "ERROR: {15FF00}No eres SAPD !");
    }
    return 1;
}
CMD:a(playerid,params[])
{
    if(!EsAdmin[playerid]) return TextdrawError(playerid,"Debes estar /sduty");
    if(!isnull(params))
        {
            new rango[20],string[128];
            switch(PlayerInfo[playerid][pAdmin])
            {
                case 1: rango = "Ayudante";
                case 2: rango = "Moderador";
                case 3: rango = "Administrador";
                case 4: rango = "Encargado del Staff";
                case 5: rango = "Fundador";
            }
            format(string, sizeof(string), "[Staff]{ff6529} %s %s(%i): {FFFFFF} %s", rango, pName(playerid),playerid, params[0]);
            SendMessageToAdmin(string);
        }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/a [Texto]");
    return 1;
}

CMD:r(playerid,params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 1)
    {
        if(!isnull(params))
        {
            new rango[20],string[128];
            switch(PlayerInfo[playerid][pPolicia])
            {
                case 1: rango = "Alumno";
                case 2: rango = "Oficial";
                case 3: rango = "Agente";
                case 4: rango = "Comisario";
                case 5: rango = "Sargento";
            }
            format(string, sizeof(string), "[Radio Policia]{ff6529} %s %s {FFFFFF} %s", rango, pName(playerid), params[0]);
            RadioPolicia(string);
        }
        else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/r [Texto]");
        return 1;
    }
    return 0;
}

CMD:rr(playerid,params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 1)
    {
        if(!isnull(params))
        {
            new rango[20],string[128];
            switch(PlayerInfo[playerid][pPolicia])
            {
                case 1: rango = "Alumno";
                case 2: rango = "Oficial";
                case 3: rango = "Agente";
                case 4: rango = "Comisario";
                case 5: rango = "Sargento";
            }
            format(string, sizeof(string), "[Radio Policia]{ff6529} %s %s(id:%d) {FFFFFF} (( %s ))", rango, pName(playerid),playerid, params[0]);
            RadioPolicia(string);
        }
        else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/rr [Texto OOC]");
        return 1;
    }
    return 0;
}

CMD:respawnear(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new ID;
        new name[MAX_PLAYER_NAME];
        new nameadmin[MAX_PLAYER_NAME];
        new string[256];
        if(sscanf(params,"i", ID)) return SendClientMessage(playerid,-1,"USAGE: {15FF00}/respawnear [ID]");
        SetPlayerPos(ID, 1702.620849,-1851.958251,13.564262);
        SendClientMessage(ID, -1, "Te Respawnearon");
        GetPlayerName(ID, name, sizeof name);
        GetPlayerName(playerid, nameadmin, sizeof nameadmin);
        format(string, sizeof(string), "[Staff] {ff6529}%s respawneo a{FFFFFF} %s",nameadmin,name);
        SendMessageToAdmin(string);
        return 1;
    }
    return 0;
}

CMD:congelar(playerid,params[])
{
	if(!EsAdmin[playerid]) return TextdrawError(playerid,"Debes estar /sduty");
	new ID;
	new string[256];
	new name[MAX_PLAYER_NAME];
	new nameadmin[MAX_PLAYER_NAME];
	if(sscanf(params,"i", ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/congelar [ID/nombre]");
	GetPlayerName(ID, name, 24);
	GetPlayerName(playerid, nameadmin, 24);
	PlayerInfo[ID][pCongelado] = 1;
	format(string, sizeof(string), "[Staff] {ff6529}%s congelo a {FFFFFF}%s",nameadmin,name);
	SendMessageToAdmin(string);
	TogglePlayerControllable(ID, false);
	return 1;
}

CMD:descongelar(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new ID;
        new string[256];
        new name[MAX_PLAYER_NAME];
        new nameadmin[MAX_PLAYER_NAME];
        if(sscanf(params,"i", ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/congelar [ID]");
        GetPlayerName(ID, name, 24);
        GetPlayerName(playerid, nameadmin, 24);
        PlayerInfo[ID][pCongelado] = 0;
        format(string, sizeof(string), "[Staff] {ff6529}%s descongelo a {FFFFFF}%s",nameadmin,name);
        SendMessageToAdmin(string);
        TogglePlayerControllable(ID, true);
        return 1;
    }
    return 0;
}

CMD:staff(playerid)
{
    new string[500];
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(PlayerInfo[i][pAdmin] != 0)
        {
        	new rango[20];
            switch(PlayerInfo[i][pAdmin])
            {
                case 1: rango = "Ayudante";
                case 2: rango = "Moderador";
                case 3: rango = "Administrador";
                case 4: rango = "Encargado del Staff";
                case 5: rango = "Fundador";
            }
            format(string,sizeof(string),"%s-%s (%d)\n", NombreJugador(i),rango,playerid);
        }
    }
    ShowPlayerDialog(playerid,DADMINS,DIALOG_STYLE_MSGBOX,"Staffs Online:",string,"Aceptar","Cancelar");
    return 1;
}

CMD:tp(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        ShowPlayerDialog(playerid,DIALOGO_TP, DIALOG_STYLE_LIST, "Tp"," LSPD \n Hospital(Ganton) \n Hospital(Central) \n Spawn \n Concesionario(east los santos) \n Mercado Negro \n MercadoNegro(2)\nClickear Mapa.", "Seleccionar", "Cancelar");
        return 1;
    }
    return 0;
}

CMD:nivel(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new ID,string[256],string1[256],admin, nombrejugador[MAX_PLAYER_NAME], nombreadmin[MAX_PLAYER_NAME], puntos;
        puntos = strval(string);
        if(sscanf(params,"ii", ID,puntos)) return SendClientMessage(playerid,-1,"USO CORRECTO: {15FF00}/nivel [ID][nivel]");
        admin = playerid;
        GetPlayerName(ID, nombrejugador, sizeof(nombrejugador));
        GetPlayerName(admin, nombreadmin, sizeof(nombreadmin));
        if (IsPlayerConnected(ID))
        {
            format(string1, sizeof(string1), "[Staff] {ff6529}%s ha puesto el nivel de %s en %d.",admin,nombrejugador, puntos);
            SendMessageToAdmin(string1);
            PlayerPlaySound(admin, 1057, 0.0, 0.0, 0.0);
            PlayerPlaySound(ID, 1057, 0.0, 0.0, 0.0);
            SetPlayerScore(ID, puntos);
        }
        else return SendClientMessage(playerid, COLOR_ROJO, "El jugador no se encuentra conectado.");
        return 1;
    }
    return 0;
}

CMD:ref(playerid, params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 1)
    {
        new Float:rX,Float:rY,Float:rZ;
        GetPlayerPos(playerid, rX, rY, rZ);
        new string[128];
        new Name[MAX_PLAYER_NAME];
        new zone[MAX_ZONE_NAME];
        GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
        GetPlayerName(playerid, Name, 32);
        format(string,128,"[Radio de Policia] %s dice: necesito refuerzos en %s",Name,zone);
        RadioPolicia(string);
        foreach(new i : Player) if(PlayerInfo[i][pPolicia] >= 1) SetPlayerMarkerForPlayer(i, playerid, 0x3399FFFF);
    }
    return 1;
}

CMD:subir(playerid, params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 1)
    {
        new string[126];
        new ID,Lugar,patrulla,Float:x,Float:y,Float:z;
        new nombrepolicia[MAX_PLAYER_NAME];
        new nombrearrestado[MAX_PLAYER_NAME];
        if(sscanf(params, "dd", ID,Lugar) )return SendClientMessage(playerid,COLOR_WHITE,"Uso: /subir [ID] [Asiento 1-2]");
        if(!IsPlayerConnected(ID)) return SendClientMessage(playerid,COLOR_WHITE,"Jugador desconectado o id incorrecta");
        patrulla = GetPlayerVehicleID(playerid);
        GetPlayerPos(ID, x,y,z);
        if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,-1,"Debes estar en una patrulla para subir a alguien");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"Debes estar conduciendo la patrulla");
        if(IsPlayerInRangeOfPoint(playerid, 20.0,  x, y,z))
        {
            if(Lugar == 1)
            {
                SetPlayerArmedWeapon(ID, 0);
                PutPlayerInVehicle(ID, patrulla, 2);
                TogglePlayerControllable(ID, 0);
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrearrestado,sizeof(nombrearrestado));
                format(string,128,"%s sube a la patrulla a %s",nombrepolicia,nombrearrestado);
                SendClientMessageToNearby(playerid, COLOR_AZUL, 10.0, string);

            }
            else if(Lugar == 2)
            {
                SetPlayerArmedWeapon(ID, 0);
                PutPlayerInVehicle(ID, patrulla, 3);
                TogglePlayerControllable(ID, 0);
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrearrestado,sizeof(nombrearrestado));
                format(string,128,"%s sube a la patrulla a %s",nombrepolicia,nombrearrestado);
                SendClientMessageToNearby(playerid, COLOR_AZUL, 10.0, string);
            }
        }
        else SendClientMessage(playerid, -1, "No estas cerca de ese jugador");
        return 1;
    }
    return 0;
}

CMD:bajar(playerid, params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 1)
    {
        new string[126];
        new ID;
        new nombrepolicia[MAX_PLAYER_NAME];
        new nombrecivil[MAX_PLAYER_NAME];
        if(sscanf(params, "u", ID) )return SendClientMessage(playerid,COLOR_WHITE,"Uso: /bajar [ID]");
        if(!IsPlayerConnected(ID)) return SendClientMessage(playerid,COLOR_WHITE,"Jugador desconectado o id incorrecta");
        if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,-1,"Debes estar en una patrulla para subir a alguien");
        RemovePlayerFromVehicle(ID);
        TogglePlayerControllable(ID, 1);
        ApplyAnimation(ID,"PED","BIKE_fallR",4.0,0,1,1,1,0);//rodar//
        GetPlayerName(ID,nombrecivil,sizeof(nombrecivil));
        GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
        format(string,128,"El Oficial %s libera de la patrulla a %s",nombrepolicia,nombrecivil);
        SendClientMessageToNearby(playerid, COLOR_AZUL, 10.0, string);
    }
    return 1;
}

CMD:reclutar(playerid, params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 5)
    {
        new string[128];
        new ID,rango;
        new nombrepolicia[MAX_PLAYER_NAME];
        new nombrereclutado[MAX_PLAYER_NAME];
        if(sscanf(params, "dd", ID,rango) )return SendClientMessage(playerid,COLOR_WHITE,"Uso: /reclutar [ID] [rango]");
        if(!IsPlayerConnected(ID)) return SendClientMessage(playerid,COLOR_WHITE,"Jugador desconectado o id incorrecta");
        {
            if(rango == 1)
            {
                PlayerInfo[ID][pPolicia] = 1;
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                format(string,256,"[Policia]El Agente %s recluto  a %s con el rango: alumno",nombrepolicia, nombrereclutado);
                RadioPolicia(string);
                SendClientMessage(ID,-1,"Felicidades Entraste a la policia con el rango: Alumno");

            }
            else if(rango == 2)
            {
                PlayerInfo[ID][pPolicia] = 2;
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                format(string,256,"[Policia]El Agente %s recluto  a %s con el rango: Oficial",nombrepolicia, nombrereclutado);
                RadioPolicia(string);
                SendClientMessage(ID,-1,"Felicidades Entraste a la policia con el rango: Oficial");
            }
            else if(rango == 3)
            {
                PlayerInfo[ID][pPolicia] = 3;
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                format(string,256,"[Policia]El Agente %s recluto  a %s con el rango: Agente",nombrepolicia, nombrereclutado);
                RadioPolicia(string);
                SendClientMessage(ID,-1,"Felicidades Entraste a la policia con el rango: Agente");
            }
            else if(rango == 4)
            {
                PlayerInfo[ID][pPolicia] = 4;
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                format(string,256,"[Policia]El Agente %s recluto  a %s con el rango: Sherif",nombrepolicia, nombrereclutado);
                RadioPolicia(string);
                SendClientMessage(ID,-1,"Felicidades Entraste a la policia con el rango: Sherif");
            }
            else if(rango == 5)
            {
                PlayerInfo[ID][pPolicia] = 5;
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                format(string,256,"[Policia]El Agente %s recluto  a %s con el rango: Sargento",nombrepolicia, nombrereclutado);
                RadioPolicia(string);
                SendClientMessage(ID,-1,"Felicidades Entraste a la policia con el rango: Sargento");
            }
        }
        return 1;
    }
    return 0;
}

CMD:ascender(playerid, params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 4)
    {
        new string[256];
        new ID,rango;
        new nombrepolicia[MAX_PLAYER_NAME];
        new nombrereclutado[MAX_PLAYER_NAME];
        if(sscanf(params, "dd", ID, rango) )return SendClientMessage(playerid,COLOR_WHITE,"Uso: /ascender [ID] [rango]");
        if(ID == INVALID_PLAYER_ID) return SendClientMessage(playerid,COLOR_WHITE,"Jugador desconectado o id incorrecta");
        if(rango > 0 || rango < 6)
        {
            switch(rango)
            {
                case 1:
                {
                    PlayerInfo[ID][pPolicia] = 1;
                    GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                    GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                    format(string,256,"[Policia]El Agente %s Degrado a %s ahora es :alumno",nombrepolicia, nombrereclutado);
                    RadioPolicia(string);
                    SendClientMessage(ID,-1,"Ahora eres: Alumno");

                }
                case 2:
                {
                    PlayerInfo[ID][pPolicia] = 2;
                    GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                    GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                    format(string,256,"[Policia]El Agente %s Ascendio a %s ahora es : Oficial",nombrepolicia, nombrereclutado);
                    RadioPolicia(string);
                    SendClientMessage(ID,-1,"Felicidades Ascendiste a: Oficial");
                }
                case 3:
                {
                    PlayerInfo[ID][pPolicia] = 3;
                    GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                    GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                    format(string,256,"[Policia]El Agente %s Ascendio a %s ahora es : Agente",nombrepolicia, nombrereclutado);
                    RadioPolicia(string);
                    SendClientMessage(ID,-1,"Felicidades Ascendiste a: Agente");
                }
                case 4:
                {
                    PlayerInfo[ID][pPolicia] = 4;
                    GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                    GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                    format(string,256,"[Policia]El Agente %s Ascendio a %s ahora es : Sherif",nombrepolicia, nombrereclutado);
                    RadioPolicia(string);
                    SendClientMessage(ID,-1,"Felicidades Ascendiste a: Sherif");
                }
                case 5:
                {
                    PlayerInfo[ID][pPolicia] = 5;
                    GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                    GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                    format(string,256,"[Policia]El Sargento %s le cedio su puesto a %s",nombrepolicia, nombrereclutado);
                    RadioPolicia(string);
                    SendClientMessage(ID,-1,"Felicidades Ascendiste a: Sargento");
                }
            }
        }
        else SendClientMessage(playerid, COLOR_RED, "ERROR: El rango es menor a 0 o mayor a 6.");
    }
    return 1;
}

CMD:darstaff(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new ID, rango; 
        if(sscanf(params, "ud", ID, rango)) return SCM(playerid,COLOR_WHITE,"Uso: /darstaff [ID] [rango]");
        if(ID == INVALID_PLAYER_ID) return SendClientMessage(playerid,COLOR_WHITE,"Jugador desconectado o id incorrecta");
        if(rango > PlayerInfo[playerid][pAdmin]) return SendClientMessage(playerid, COLOR_RED, "No puedes dar un rango superior al tuyo.");
        if(rango > -1 || rango < 7)
        {
            new string[128], staffname[MAX_PLAYER_NAME], staffed[MAX_PLAYER_NAME];
            switch(rango)
            {
                case 0:
                {
                    PlayerInfo[ID][pAdmin] = 0;
                    EsAdmin[ID] = false;
                    GetPlayerName(playerid,staffname,sizeof(staffname));
                    GetPlayerName(ID,staffed,sizeof(staffed));
                    format(string,sizeof(string),"[Staff]%s saco del staff a %s", staffname, staffed);
                    SendMessageToAdmin(string);
                    SendClientMessage(ID,-1,"Ya no formas parte del staff.");

                }
                case 1:
                {
                    PlayerInfo[ID][pAdmin] = 1;
                    EsAdmin[ID] = true;
                    GetPlayerName(playerid,staffname,sizeof(staffname));
                    GetPlayerName(ID,staffed,sizeof(staffed));
                    format(string,sizeof(string),"[Staff] {ff6529}%s le dio ayudante a %s",staffname, staffed);
                    SendMessageToAdmin(string);
                    SendClientMessage(ID,-1,"Ahora formas parte del staff como ayudante.");

                }
                case 2:
                {
                    PlayerInfo[ID][pAdmin] = 2;
                    EsAdmin[ID] = true;
                    GetPlayerName(playerid,staffname,sizeof(staffname));
                    GetPlayerName(ID,staffed,sizeof(staffed));
                    format(string,sizeof(string),"[Staff] {ff6529}%s le dio moderador a %s",staffname, staffed);
                    SendMessageToAdmin(string);
                    SendClientMessage(ID,-1,"Ahora formas parte del staff como moderador.");
                }
                case 3:
                {
                    PlayerInfo[ID][pAdmin] = 3;
                    EsAdmin[ID] = true;
                    GetPlayerName(playerid,staffname,sizeof(staffname));
                    GetPlayerName(ID,staffed,sizeof(staffed));
                    format(string,sizeof(string),"[Staff] {ff6529} %s le dio administrador a %s",staffname, staffed);
                    SendMessageToAdmin(string);
                    SendClientMessage(ID,-1,"Ahora formas parte del staff como administrador.");
                }
                case 4:
                {
                    PlayerInfo[ID][pAdmin] = 4;
                    EsAdmin[ID] = true;
                    GetPlayerName(playerid,staffname,sizeof(staffname));
                    GetPlayerName(ID,staffed,sizeof(staffed));
                    format(string,sizeof(string),"[Staff] {ff6529}%s le dio Encargado del staff a %s",staffname, staffed);
                    SendMessageToAdmin(string);
                    SendClientMessage(ID,-1,"Ahora formas parte del staff como encargado del staff.");
                }
                case 5:
                {
                    PlayerInfo[ID][pAdmin] = 5;
                    EsAdmin[ID] = true;
                    GetPlayerName(playerid,staffname,sizeof(staffname));
                    GetPlayerName(ID,staffed,sizeof(staffed));
                    format(string,sizeof(string),"[Staff] {ff6529}%s le dio Fundador a %s",staffname, staffed);
                    SendMessageToAdmin(string);
                    SendClientMessage(ID,-1,"Ahora formas parte del staff como fundador.");
                }
            }
        }
        else SendClientMessage(playerid, COLOR_RED, "ERROR: El rango es menor a 0 o mayor a 6.");
        return 1;
    }
    return 0;
}

CMD:desarmar(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new str[128], ID;
        new nombre[MAX_PLAYER_NAME];
        if(sscanf(params, "u", ID)) return GameTextForPlayer(playerid, "~g~/desarmar~w~~n~(ID)",4500,3);
        if(ID == INVALID_PLAYER_ID) return GameTextForPlayer(playerid, "~g~El Jugador no esta conectado",4500,3);
        ResetPlayerWeapons(ID);
        GetPlayerName(ID,nombre,sizeof(nombre));
        format(str, sizeof(str), "le quitaste las armas a %s(%d)",nombre, ID);
        SendClientMessage(playerid,-1, str);
    }
    return 1;
}

CMD:ah(playerid)
{
    return cmd_scmds(playerid);
}

CMD:scmds(playerid)
{
    if(PlayerInfo[playerid][pAdmin] > 0)
    {
        new commands[800];
        if(PlayerInfo[playerid][pAdmin] >= 1) // ayudante
        {
            strcat(commands, "[Ayudante]/a (chat de staffs) /congelar /descongelar \n");
        }
        if(PlayerInfo[playerid][pAdmin] >= 2) // Moderador
        {
            strcat(commands, "[Moderador] /respawnveh /jail /offjail /jetpack /vida /chaleco /cambiarinterior /desarmar /v /armas /ir /traer /dararma /tp /spec /listo \n");
        }
        if(PlayerInfo[playerid][pAdmin] >= 3) // Administrador
        {
            strcat(commands, "[Administrador] /kick /ban /desbanearmandar /ooc(manda un mensaje global) y los de moderador\n");
        }
        if(PlayerInfo[playerid][pAdmin] >= 4) // Encargado de Staff
        {
            strcat(commands, "[Encargado De staff]/darstaff /sacarstaff /reclutar /ascender /restart /dineroatodos /vidatodos /armatodos /explosion\n");
        }
        if(PlayerInfo[playerid][pAdmin] >= 5) // Fundador
        {
            strcat(commands, "[Fundador] \n");
        }
        ShowPlayerDialog(playerid, DIALOGO_COMANDOSSTAFF, DIALOG_STYLE_MSGBOX, "Comandos staff", commands, "Aceptar", "Cerrar");
        return 1;
    }
    return 0;
}

CMD:latinrpon(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] == 5)
    {
        TextDrawShowForAll(latinrp);
        return 1;
    }
    return 0;
}

CMD:latinrpoff(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] == 5)
    {
        TextDrawHideForAll(latinrp);
        return 1;
    }
    return 0;
}

CMD:estado(playerid, params[])
{
    ShowPlayerDialog(playerid,DIALOG_ESTADO,DIALOG_STYLE_INPUT,"Estado","Escribe tu estado:","Aceptar","Cancelar");
    return 1;
}

CMD:bote(playerid)
{
    if(PlayerInfo[playerid][pPolicia] >=1)
    {
        new nombre[MAX_PLAYER_NAME];
        new string[256];
        new zone[MAX_ZONE_NAME];
        GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
        GetPlayerName(playerid, nombre, sizeof(nombre));
        format(string, sizeof(string), "[Central De Policia] Informo A LSPD %s Activo su boton de emergencia en %s",nombre,zone);
        RadioPolicia(string);
    }
    return 1;
}

CMD:tiendavip(playerid, params[])
{
    ShowPlayerDialog(playerid, DIALOG_TIENDA_VIP, DIALOG_STYLE_LIST,"Tienda VIP | LatinRP","{88AA88}->{FFFFFF} Vender LatinCoin [x1]\n{88AA88}->{FFFFFF} Comprar V.I.P","Aceptar","Cancelar");
    return 1;
}


CMD:mp(playerid, params[])
{
    new id;
    new string[100];
    new msg2[100];
    new mensaje[144];
    if(sscanf(params,"us", id,mensaje)) return SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/mp [id/nombre][Mensaje]");
    new nombre[MAX_PLAYER_NAME];
    new nombreadmin[MAX_PLAYER_NAME];
    if(PlayerInfo[id][pAdmin] >= 1 && EsAdmin[id] == true)
    {
        GetPlayerName(playerid, nombre, sizeof(nombre));
        GetPlayerName(id, nombreadmin, sizeof(nombreadmin));
        format(string, sizeof(string), "[Mensaje Privado]%s dice: %s",nombre,mensaje);
        SendClientMessage(id,-1,string);
        format(msg2, sizeof(msg2), "[Menasaje Privado] enviado a %s: %s ",nombreadmin,mensaje);
        SendClientMessage(playerid,-1,msg2);
        return 1;
    }
    else return SendClientMessage(playerid,-1,"El id que escribiste no es miembro del staff o esta fuera de servicio!");
}

CMD:pm(playerid, params[])
{
    new id;
    new string[100];
    new msg2[100];
    new mensaje[144];
    if(sscanf(params,"us", id,mensaje)) return SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/pm [id/nombre][Mensaje]");
    new nombre[MAX_PLAYER_NAME];
    new nombreadmin[MAX_PLAYER_NAME];
    if(PlayerInfo[id][pAdmin] >= 1 && EsAdmin[id] == true)
    {
        GetPlayerName(playerid, nombre, sizeof(nombre));
        GetPlayerName(id, nombreadmin, sizeof(nombreadmin));
        format(string, sizeof(string), "[Private Message]%s dice: %s",nombre,mensaje);
        SendClientMessage(id,-1,string);
        format(msg2, sizeof(msg2), "[Private Message] enviado a %s: %s ",nombreadmin,mensaje);
        SendClientMessage(playerid,-1,msg2);
        return 1;
    }
    else return SendClientMessage(playerid,-1,"El id que escribiste no es miembro del staff o esta fuera de servicio!");
}

CMD:w(playerid, params[])
{
    new id;
    new string[100];
    new msg2[100];
    new mensaje[144];
    if(sscanf(params,"us", id,mensaje)) return SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/w [id/nombre][Mensaje]");
    new nombre[MAX_PLAYER_NAME];
    new nombreadmin[MAX_PLAYER_NAME];
    if(PlayerInfo[id][pAdmin] >= 1 && EsAdmin[id] == true)
    {
        GetPlayerName(playerid, nombre, sizeof(nombre));
        GetPlayerName(id, nombreadmin, sizeof(nombreadmin));
        format(string, sizeof(string), "[Whisper]%s dice: %s",nombre,mensaje);
        SendClientMessage(id,-1,string);
        format(msg2, sizeof(msg2), "[Whisper] enviado a %s: %s ",nombreadmin,mensaje);
        SendClientMessage(playerid,-1,msg2);
        return 1;
    }
    else return SendClientMessage(playerid,-1,"El id que escribiste no es miembro del staff o esta fuera de servicio!");
}

CMD:juntas(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 1)
    {
        ShowPlayerDialog(playerid,DIALOGO_JUNTAS, DIALOG_STYLE_LIST, "Juntas Staffs","Estadio \n Barco", "Ir", "Cancelar");
        return 1;
    }
    else return 0;
}

CMD:guardar(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)   
    {
        if(!isnull(params))
        {
            new Float:p[3];
            GetPlayerPos(playerid, p[0], p[1], p[2]);
            printf("Pos X: %f,    Pos Y: %f,    Pos Z, %f Nombre:%s ", p[0], p[1], p[2], params);
        }
        else return SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/guardar [texto]");
        return 1;
    }
    return 0;
}

CMD:inmortal(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        new string[128];
        new nombre[MAX_PLAYER_NAME];
        new nombreadmin[MAX_PLAYER_NAME];
        new ID;
        if(sscanf(params,"i", ID)) return SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/inmortal [ID]");
        SetPlayerHealth(ID, 1000000);
        SetPlayerArmour(ID, 1000000);
        GetPlayerName(playerid, nombreadmin,sizeof(nombreadmin));
        GetPlayerName(ID, nombre,sizeof(nombre));
        format(string, sizeof(string), "[Staff] {ff6529}%s hizo inmortal a %s",nombreadmin,nombre);
        SendMessageToAdmin(string);
        return 1;
    }
    return 0;
}

CMD:id(playerid, params[])
{
    new str[128];
    new nombre[MAX_PLAYER_NAME];
    new ID;
    if(sscanf(params, "u", ID)) return SendClientMessage(playerid,-1,"Error: {FFFFFF}/id [ID]");
    if(ID == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "Error: {FFFFFF}id de jugador invalida.");
    GetPlayerName(ID,nombre,sizeof(nombre));
    GetPlayerScore(ID);
    format(str, sizeof(str), "ID:%d | Nombre:%s | Nivel:%d | Ping:%i | P: %.2f", ID,nombre,GetPlayerScore(ID),GetPlayerPing(ID),NetStats_PacketLossPercent(ID));
    SendClientMessage(playerid,-1,str);
    return 1;
}

CMD:v(playerid,params[])
{
if(PlayerInfo[playerid][pAdmin] >= 2)
{
        new vid;
        new string[128];
        new Float:vehX, Float:vehY, Float:vehZ;
        GetPlayerPos(playerid, Float:vehX, Float:vehY, Float:vehZ);
        if(sscanf(params,"i", vid)) return SendClientMessage(playerid,0xff0000ff,"Uso: /v <id del vehiculo>");
        else if(vid < 400 || vid >611) return SendClientMessage(playerid, 0xff0000ff, "ERROR: Ingresa una id valida del 400-611.");
        {
            CreateVehicle(vid, vehX, vehY, vehZ + 2.0, 0, -1, -1, 1);
            format(string,sizeof(string),"Creaste el vehiculo con el ID: %i",vid);
            SendClientMessage(playerid, -1, string);
            PutPlayerInVehicle(playerid, vid, 0);
        }
        return 1;
}
return 0;
}
CMD:bomba(playerid, params[])
{
    ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
    return 1;
}
CMD:anuncio(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        if(!isnull(params))
        {
            GameTextForAll(params,4000,3);
        }
        else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/anuncio [Texto]");
        return 1;
    }
    return 0;
}
CMD:police(playerid, params[])
{
    if(!isnull(params))
    {
        if(PlayerInfo[playerid][pPolicia] >= 3)
        {
            new string[126];
            format(string, sizeof(string), "{3300FF}[Anuncios Policia] [ID:%d] {FFFFFF} %s ",playerid,params);
            SendClientMessageToAll(-1,string);
        }
    }
    else return SendClientMessage(playerid, -1, "/police [texto]");
    return 1;
}

CMD:dudaentorno(playerid, params[])
{
    if(!isnull(params))
    {
        new string[128];
        format(string, sizeof(string), "{CC0000} [Duda de Entorno] {6600FF} (ID:%d): {FFFFFF} %s.",playerid,params);
        SendClientMessageToAll(-1,string);
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/dudaentorno [Tu Duda]");
    return 1;
}

CMD:ame(playerid, params[])
{
    new string[128];
    new nombre[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nombre, sizeof(nombre));
    format(string, sizeof(string), " {9933FF} *%s: Desenfunda su arma de tal manera que este lista para disparar*",nombre);
    SendClientMessageToNearby(playerid, COLOR_AZUL, 10.0, string);
    return 1;
}

CMD:cinturon(playerid, params[])
{
    new string[256];
    new nombre[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nombre, sizeof(nombre));
    format(string, sizeof(string), " {9933FF}*%s Se Pone el cinturon* ",nombre);
    SendClientMessageToNearby(playerid, -1, 10.0, string);
    return 1;
}

CMD:fumar(playerid, params[])
{
    if(sscanf(params, "i", params[0]))   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /fumar [1-5]");
    if(params[0] < 1 || params[0] > 5)   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /fumar [1-5]");
    switch(params[0])
    {
        case 1: ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 1, 1, 1);
        case 2: ApplyAnimation(playerid,"SMOKING","M_smkstnd_loop", 4.0, 1, 0, 1, 1, 1);
        case 3: ApplyAnimation(playerid,"SMOKING","M_smk_out", 4.0, 0, 0, 1, 1, 1);
        case 4: ApplyAnimation(playerid,"SMOKING","M_smk_in",4.0,0,1,1,1,1);
        case 5: ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.1,1,1,1,1,1);
    }
    return 1;
}

CMD:arrestado(playerid) 
{
    return ApplyAnimation( playerid,"ped", "ARRESTgun", 4.0, 0, 1, 1, 1,500);
}

CMD:regay(playerid) 
{
    return ApplyAnimation(playerid,"PED","WOMAN_walkpro",4.0,1,1,1,1,500);
}

CMD:sentarse(playerid, params[])
{
    if(sscanf(params, "i", params[0]))   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /sentarse [1-9]");
    if(params[0] < 1 || params[0] > 9)   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /sentarse [1-9]");
    switch(params[0])
    {
        case 1: ApplyAnimation(playerid,"Attractors","Stepsit_in",4.1,0,0,0,1,1);
        case 2: ApplyAnimation(playerid,"Attractors","Stepsit_out",4.1,0,1,1,1,1);
        case 3: ApplyAnimation(playerid,"FOOD","FF_Sit_Eat3",4.1,0,0,0,1,1);
        case 4: ApplyAnimation(playerid,"FOOD","FF_Sit_In",4.1,0,0,0,1,1);
        case 5: ApplyAnimation(playerid,"FOOD","FF_Sit_In_L",4.1,0,0,0,1,1);
        case 6: ApplyAnimation(playerid,"FOOD","FF_Sit_In_R",4.1,0,0,0,1,1);
        case 7: ApplyAnimation(playerid,"PED","SEAT_down",4.1,0,0,0,1,1);
        case 8: ApplyAnimation(playerid,"INT_HOUSE","LOU_In",4.1,0,0,0,1,1);
        case 9: ApplyAnimation(playerid,"MISC","SEAT_LR",4.1,0,1,1,1,1);
    }
    return 1;
}

CMD:saludar(playerid, params[])
{
    if(sscanf(params, "i", params[0]))   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /saludar [1-7]");
    if(params[0] < 1 || params[0] > 7)   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /saludar [1-7]");
    switch(params[0])
    {
        case 1: ApplyAnimation(playerid,"GANGS","prtial_hndshk_biz_01",4.1,0,1,1,1,1);
        case 2: ApplyAnimation(playerid,"GANGS","hndshkcb",4.1,0,1,1,1,1);
        case 3: ApplyAnimation(playerid,"GANGS","hndshkea",4.1,0,1,1,1,1);
        case 4: ApplyAnimation(playerid,"GANGS","hndshkfa",4.1,0,1,1,1,1);
        case 5: ApplyAnimation(playerid,"GANGS","hndshkba",4.1,0,1,1,1,1);
        case 6: ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 1, 1);
        case 7: ApplyAnimation(playerid,"PED","endchat_03",4.1,0,1,1,1,1);
    }
    return 1;
}

CMD:agacharse(playerid, params[])
{
    ApplyAnimation(playerid, "ped", "cower", 4.0, 0, 1, 1, 1, 1);
    return 1;
}

CMD:vomitar(playerid, params[])
{
    ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 4.0, 0, 1, 1, 1, 1);
    return 1;
}

CMD:comiendo(playerid, params[])
{
    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 1, 1, 1, 1);
    return 1;
}

CMD:trato(playerid, params[])
{
    ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 1, 1, 1, 1);
    return 1;
}

CMD:hablando(playerid, params[])
{
    ApplyAnimation(playerid,"PED","IDLE_CHAT",4.0,1,0,0,1,1);
    return 1;
}

CMD:puto(playerid, params[])
{
    ApplyAnimation(playerid,"PED","fucku",4.0,0,0,0,1,1);
    return 1;
}

CMD:herido(playerid, params[])
{
    ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.0, 1, 0, 1, 1, 1);
    return 1;
}

CMD:cachetada(playerid, params[])
{
    ApplyAnimation(playerid,"MISC","bitchslap",4.1,1,0,0,1,1);
    return 1;
}

CMD:rifle(playerid, params[])
{
    ApplyAnimation(playerid,"BUDDY","buddy_reload",4.1,0,1,1,1,1);
    return 1;
}

CMD:reir(playerid, params[])
{
    ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:spray(playerid, params[])
{
    ApplyAnimation(playerid,"SPRAYCAN","spraycan_full",4.0,1,1,1,1,1);
    return 1;
}

CMD:cansado(playerid, params[])
{
    ApplyAnimation(playerid,"PED","IDLE_tired",4.0,1,0,1,1,1);
    return 1;
}

CMD:cacheado(playerid, params[])
{
    ApplyAnimation(playerid,"POLICE","crm_drgbst_01",4.0,0,1,1,1,1);
    return 1;
}

CMD:animar(playerid, params[])
{
    ApplyAnimation(playerid,"RIOT","RIOT_CHANT",4.0,1,1,1,1,1);
    return 1;
}

CMD:blowjob(playerid, params[])
{
    ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_W", 4.0, 1, 1, 1, 0, 0);//blowjob
    return 1;
}

CMD:gritando(playerid, params[])
{
    ApplyAnimation(playerid,"RIOT","RIOT_shout",4.0,1,1,1,1,1);
    return 1;
}

CMD:beso(playerid, params[])
{
    if(sscanf(params, "i", params[0]))   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /beso [1-2]");
    if(params[0] < 1 || params[0] > 2)   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /beso [1-2]");
    switch(params[0])
    {
        case 1: ApplyAnimation(playerid,"KISSING","Grlfrd_Kiss_03",4.1,0,0,0,1,1);
        case 2: ApplyAnimation(playerid,"KISSING","Playa_Kiss_03",4.1,0,0,0,1,1);
    }
    return 1;
}

CMD:mecanico(playerid, params[])
{
    if(sscanf(params, "i", params[0]))   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /mecanico [1-2]");
    if(params[0] < 1 || params[0] > 2)   return SendClientMessage(playerid, 0xEFEFF7AA, "Utilize: /mecanico [1-2]");

    switch(params[0])
    {
        case 1: ApplyAnimation(playerid,"CAR","Fixn_Car_Loop",4.1,1,0,0,1,1);
        case 2: ApplyAnimation(playerid,"CAR","Fixn_Car_Out",4.1,0,0,0,1,1);
    }
    return 1;
}

CMD:anims(playerid)
{
    new string[500];
    strcat(string, "[Animaciones]/dormir, /rendirse, /no, /llamada, /llorar, /vomitar, /agacharse \n");
    strcat(string, "[Animaciones]/beso, /bailar,/saludar,/paja,/reir,/recostarse,/nalgada \n ");
    strcat(string, "[Animaciones]/mecanico, /parar, /beso, /gritando, /animar, /cacheado, /reir, /spray \n");
    strcat(string, "[Animaciones]/cansado, /rifle, /herido, /puto, /cachetada, /trato, /comiendo \n.");
    strcat(string, "[Animaciones]/sentarse, /fumar, /rodar, /rendirse, /mear \n.");
    ShowPlayerDialog(playerid, 3, DIALOG_STYLE_MSGBOX, "Animaciones", string, "Aceptar", "Cancelar");
    return 1;
}

CMD:darfbi(playerid, params[])
{
    if(PlayerInfo[playerid][pFbi] == 5 || PlayerInfo[playerid][pAdmin] >= 5)
    {
        new string[128];
        new ID,rango;
        new nombrepolicia[MAX_PLAYER_NAME];
        new nombrereclutado[MAX_PLAYER_NAME];
        if(sscanf(params, "dd", ID,rango) )return SendClientMessage(playerid,COLOR_WHITE,"Uso: /darfbi [ID] [rango]");
        if(!IsPlayerConnected(ID)) return SendClientMessage(playerid,COLOR_WHITE,"Jugador desconectado o id incorrecta");
        {
            if(rango == 1)
            {
                PlayerInfo[ID][pFbi] = 1;
                GetPlayerName(playerid, nombrepolicia, sizeof(nombrepolicia));
                GetPlayerName(ID, nombrereclutado, sizeof(nombrereclutado));
                format(string, sizeof(string), "[FBI] %s le dio Agente a %s",nombrepolicia, nombrereclutado);
                RadioPolicia(string);
                SendClientMessage(ID,-1,"Ahora eres: Agente");
            }
            else if(rango == 2)
            {
                PlayerInfo[ID][pFbi] = 2;
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                format(string,256,"[FBI]%s le dio Agente Especial a %s",nombrepolicia, nombrereclutado);
                SendMessageToAdmin(string);
                SendClientMessage(ID,-1,"Felicidades Eres: Agente Especial");
            }
            else if(rango == 3)
            {
                PlayerInfo[ID][pFbi] = 3;
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                format(string, sizeof(string), "[FBI]Administrador: %s le dio Agente Infiltrado a %s",nombrepolicia, nombrereclutado);
                SendMessageToAdmin(string);
                SendClientMessage(ID,-1,"Felicidades Eres: Agente Infiltrado");
            }
            else if(rango == 4)
            {
                PlayerInfo[ID][pFbi] = 4;
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                format(string, sizeof(string),"[FBI]%s le dio Agente Avanzado a %s",nombrepolicia, nombrereclutado);
                SendMessageToAdmin(string);
                SendClientMessage(ID,-1,"Felicidades Eres: Agente Avanzado");
            }
            else if(rango == 5)
            {
                PlayerInfo[ID][pFbi] = 5;
                GetPlayerName(playerid,nombrepolicia,sizeof(nombrepolicia));
                GetPlayerName(ID,nombrereclutado,sizeof(nombrereclutado));
                format(string, sizeof(string),"[FBI]%s le dio Director Del Fbi a %s",nombrepolicia, nombrereclutado);
                SendMessageToAdmin(string);
                SendClientMessage(ID,-1,"Felicidades Eres: Director Del Fbi");
            }
        }
        return 1;
    }
    return 0;
}

CMD:sacarfbi(playerid, params[])
{
    if(PlayerInfo[playerid][pFbi] == 5 || PlayerInfo[playerid][pAdmin] >= 5)
    {
        new ID;
        new string[256];
        new name[MAX_PLAYER_NAME];
        new nameadmin[MAX_PLAYER_NAME];
        if(sscanf(params,"is", ID,params[0])) return SendClientMessage(playerid,-1,"USAGE: {15FF00}/sacarfbi [ID][razon]");
        GetPlayerName(ID, name, sizeof  name);
        format(string, sizeof(string), "[Avisos FBI]Oficial:%s Te Ha Despedido! Razon: %s !", name, params[0]);
        SendClientMessage(playerid, -1, "{0066CC}[Avisos FBI]: {15FF00}Echastes a el jugador nombrado !");
        GetPlayerName(playerid, nameadmin, sizeof  nameadmin);
        GetPlayerName(ID, name, sizeof  name);
        format(string, sizeof(string), "[Avisos FBI]Oficial:%s Despidio a: %s Razon: %s", nameadmin,name, params[0]);
        SendClientMessageToAll( -1,string);
        PlayerInfo[ID][pPolicia] = false;
    }
    else
    {
        SendClientMessage(playerid, -1, "[ERROR]: {15FF00}No eres FBI !");
    }
    return 1;
}

CMD:ad1(playerid,params[])
{
    if(!isnull(params))
    {
        new string[256];
        format(string, sizeof(string), "{FFFFFF} %s", params);
        SetObjectMaterialText(TextAD, string, 0, OBJECT_MATERIAL_SIZE_512x256,
        "Arial", 28, 0, 0xFFFF8200, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
    }
    else SendClientMessage(playerid, COLOR_WHITE, "Usa {ff6529}/ad1 [Tu Texto]");
    return 1;
}

CMD:musica(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        ShowPlayerDialog(playerid,DIALOG_MUSIC, DIALOG_STYLE_LIST, "Musica disponible para escuchar","Blackbear\nGive Me your Cum\nSalio el sol\nThe Banjo Beat\n Ayer me llamo mi ex", "Reproducir", "Cancelar");
    }
    return 1;
}

CMD:musicaoff(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        foreach(new i : Player)
        {
            StopAudioStreamForPlayer(i);
        }
        return 1;
    }
    return 0;
}

CMD:guardarcuentas(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
    GuardarJugadores();
    }
    return 0;
}
funcion GuardarJugadores()
{
    SendMessageToAdmin("-> [Info Server] <- Los datos de los usuarios se estan guardando");
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        TogglePlayerControllable(i, false);
        GuardarJugador(i);
        SetTimerEx("descongelar", 5000, false, "d", i);
    }
    SendClientMessageToAll(0x38d53dFF, "-> [Info Server] <- <| TUS DATOS FUERON GUARDADOS |>");
    SendMessageToAdmin("-> [Info Server] <- LOS DATOS DE LOS USUARIOS FUERON GUARDADOS CORRECTAMENTE...");
    return 1;
}

CMD:revivir(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new ID;
        new string[128];
        new nombreadmin[MAX_PLAYER_NAME];
        new nombrerevivido[MAX_PLAYER_NAME];
        if(sscanf(params, "d", ID) )return SendClientMessage(playerid,COLOR_WHITE,"Uso: /revivir [ID]");
        PlayerInfo[ID][pAbatido] = 0;
        KillTimer(timerdead[ID]);
        ClearAnimations(ID);
        KillTimer(timerAbatido[ID]);
        KillTimer(timermuerte[ID]);
        KillTimer(timerdead[ID]);
        ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        GetPlayerName(playerid,nombreadmin,sizeof(nombreadmin));
        GetPlayerName(ID,nombrerevivido,sizeof(nombrerevivido));
        format(string, sizeof(string), "[Staff] %s revivio a %s", nombreadmin, nombrerevivido);
        SendMessageToAdmin(string);
        ApplyAnimation(ID, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
        TogglePlayerControllable(ID,true);
        return 1;
    }
    return 0;
}

CMD:reanimar(playerid, params[])
{
    if(PlayerInfo[playerid][pMedico] >= 2)
    {
        new ID;
        new string[256];
        new nombremedic[MAX_PLAYER_NAME];
        new nombrerevivido[MAX_PLAYER_NAME];
        if(sscanf(params, "d", ID) )return SendClientMessage(playerid,COLOR_WHITE,"Uso: /reanimar [ID]");
        PlayerInfo[ID][pAbatido] = 0;
        KillTimer(timerdead[ID]);
        KillTimer(timerAbatido[ID]);
        KillTimer(timerdead[ID]);
        ClearAnimations(ID);
        GetPlayerName(playerid,nombremedic,sizeof(nombremedic));
        GetPlayerName(playerid,nombrerevivido,sizeof(nombrerevivido));
        format(string,256,"[LSMD] %s reanimo a %s",nombremedic, nombrerevivido);
        SendMessageToAdmin(string);
        PlayerInfo[playerid][pDinero] += 800;
    }
    return 1;
}

CMD:botiquin(playerid, params[])
{
    if(PlayerInfo[playerid][pBotis] >= 1)
    {
        new ID;
        new string[128];
        new nombremedic[MAX_PLAYER_NAME];
        new nombrerevivido[MAX_PLAYER_NAME];
        if(sscanf(params, "d", ID) )return SendClientMessage(playerid,COLOR_WHITE,"Uso: /botiquin [ID/nombre]");
        PlayerInfo[ID][pAbatido] = 0;
        KillTimer(timerAbatido[ID]);
        KillTimer(timerdead[ID]);
        KillTimer(timerdead[ID]);
        ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,1);
        GetPlayerName(playerid,nombremedic,sizeof(nombremedic));
        GetPlayerName(ID,nombrerevivido,sizeof(nombrerevivido));
        TogglePlayerControllable(ID,true);
        ApplyAnimation(ID, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
        PlayerInfo[playerid][pBotis] -= 1;
        format(string, sizeof(string)," %s curo con su botiquin a %s",nombremedic, nombrerevivido);
        SendClientMessageToNearby(playerid, -1, 10.0, string);
        }
        else return SCM(playerid,-1,"No tienes botiquines.");
    return 1;
}

CMD:subirpaciente(playerid, params[])
{
    new string[126];
    new ID,ambulancia,Float:x,Float:y,Float:z;
    new nombremedico[MAX_PLAYER_NAME];
    new nombre[MAX_PLAYER_NAME];
    if(PlayerInfo[playerid][pMedico] >= 1)
    {
        if(sscanf(params, "d", ID) )return SendClientMessage(playerid,COLOR_WHITE,"Uso: /subir [ID]");
        if(!IsPlayerConnected(ID)) return SendClientMessage(playerid,COLOR_WHITE,"Jugador desconectado o id incorrecta");
        ambulancia = GetPlayerVehicleID(playerid);
        GetPlayerPos(ID, x,y,z);
        if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,-1,"Debes estar en una ambulancia para subir a el paciente");
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"Debes estar conduciendo la ambulancia");
        if(IsPlayerInRangeOfPoint(playerid, 20.0,  x, y,z))
        {
            SetPlayerArmedWeapon(ID, 0);
            PutPlayerInVehicle(ID,ambulancia, 2);
            TogglePlayerControllable(ID, 0);
            GetPlayerName(playerid,nombremedico,sizeof(nombremedico));
            GetPlayerName(ID,nombre,sizeof(nombre));
            format(string,128,"%s sube a la ambulancia a %s",nombremedico,nombre);
            SendClientMessageToNearby(playerid, COLOR_AZUL, 10.0, string);
        }
        else SendClientMessage(playerid, -1, "No estas cerca de ese jugador");
    }
    return 1;
}

CMD:desbug(playerid, params[])
{
    if(PlayerInfo[playerid][pAbatido] == 1 && PlayerInfo[playerid][pJaileado] == 1 && PlayerInfo[playerid][pCongelado] == 1)
    {
        SCM(playerid,-1,"No puedes usar este comando en este momento...");
    }
    else
    {
        new Float:desX, Float:desY, Float:desZ;
        GetPlayerPos(playerid, desX, desY,desZ);
        GuardarJugador(playerid);
        SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pRopa], desX, desY, desZ, 0.0, 0, 0, 0, 0, 0, 0);
        SpawnPlayer(playerid);
        SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(playerid));
        SetPlayerInterior(playerid, GetPlayerInterior(playerid));
        SCM(playerid,-1,"Si no te desbugueaste autoreportate...");
        ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
    }
    return 1;
}

CMD:pagar(playerid, params[])
{
    new string[128], name[MAX_PLAYER_NAME], nameid[MAX_PLAYER_NAME], id, dinero;
    if(sscanf(params, "ui", id, dinero)) return SendClientMessage(playerid, -1, "Error: /pagar [id] [cantidad]");
    if(id == playerid) return SendClientMessage(playerid, -1, "Error: No puedes darte dinero a ti mismo.");
    if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "Error: jugador desconectado o id invalida.");
    if(PlayerInfo[playerid][pDinero] < dinero) return SendClientMessage(playerid, -1, "Error : No tienes esa cantidad de dinero.");
    if(dinero <= 0) return SendClientMessage(playerid, -1, "Error: monto invalido.");
    PlayerInfo[playerid][pDinero] -= dinero;
    PlayerInfo[id][pDinero] += dinero;
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerName(id, nameid, sizeof(nameid));
    format(string, sizeof(string), "%s le ha dado %i$ a %s",name, dinero, nameid);
    SendClientMessageToNearby(playerid, -1, 5.0, string);
    return 1;
}

CMD:hora(playerid,params[])
{
    new hour, minute, second, string[180];
    gettime(hour,minute,second);
    format(string, sizeof(string),"Son las:%02d:%02d:%02d",hour,minute,second);
    GameTextForPlayer(playerid,string, 5000,2);
    return 1;
}

CMD:medico(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        PlayerInfo[playerid][pMedico] =1;
        return 1;
    }
    return 0;
}

CMD:atar(playerid, params[])
{
    if(PlayerInfo[playerid][pBanda] >= 1 && PlayerInfo[playerid][pMafioso] >=1 && PlayerInfo[playerid][pPandillero] >=1)
    {
        new string[128];
        new nombre[MAX_PLAYER_NAME];
        new nombre2[MAX_PLAYER_NAME];
        new ID;
        if(sscanf(params,"i",ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/esposarm [ID]");
        GetPlayerName(playerid, nombre, sizeof(nombre));
        GetPlayerName(ID, nombre2, sizeof(nombre2));
        format(string, sizeof(string), " {9933FF} *%s saca una cuerda y comienza a atar a %s*",nombre,nombre2);
        SendClientMessageToNearby(playerid, COLOR_AZUL, 10.0, string);
        SCM(playerid,-1,"Recuerda cada vez que uses este comando informa a la policia /entorno.");
    }
    return 1;
}

CMD:esposarm(playerid, params[])
{
    if(PlayerInfo[playerid][pBanda] >= 1 && PlayerInfo[playerid][pMafioso] >=1 && PlayerInfo[playerid][pPandillero] >=1)
    {
        new msg1[144],msg2[144];
        new nombre[MAX_PLAYER_NAME];
        new nombre2[MAX_PLAYER_NAME];
        new zone[MAX_ZONE_NAME];
        new ID;
        if(sscanf(params,"i",ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/esposarm [ID]");
        GetPlayerName(playerid, nombre, sizeof(nombre));
        GetPlayerName(ID, nombre2, sizeof(nombre2));
        GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
        format(msg1, sizeof(msg1), " {9933FF} *%s saca unas esposas y comienza a esposar a %s*",nombre,nombre2);
        SendClientMessageToNearby(playerid, -1, 10.0, msg1);
        timeresposom[ID] = SetTimerEx("TiempoEsposado", 5000, false,"u",ID);
        format(msg2, sizeof(msg2), "[Central Policia] se detecto en las camaras a %s esposando a %s en %s",nombre,nombre2,zone);
        RadioPolicia(msg2);
    }
    else return SCM(playerid,-1,"No eres Miembro de una banda, mafioso o pandillero.");
    return 1;
}

CMD:bolsa(playerid, params[])
{
    if(PlayerInfo[playerid][pBanda] >= 1 && PlayerInfo[playerid][pMafioso] >=1 && PlayerInfo[playerid][pPandillero] >=1)
    {
        new string[128];
        new nombre[MAX_PLAYER_NAME];
        new nombre2[MAX_PLAYER_NAME];
        new ID;
        if(sscanf(params,"i",ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/esposarm [ID/nombre]");
        GetPlayerName(playerid, nombre, sizeof(nombre));
        GetPlayerName(ID, nombre2, sizeof(nombre2));
        format(string, sizeof(string), " {9933FF} *%s saca una bolsa y se la pone en a cabeza a %s*",nombre,nombre2);
        SendClientMessageToNearby(playerid, COLOR_AZUL, 10.0, string);
        SCM(playerid,-1,"Recuerda cada vez que uses este comando informa a la policia /entorno.");
    }
    return 1;
}

CMD:reportar(playerid,params[])
{
    new nombrejugador[MAX_PLAYER_NAME], nombrereportado[MAX_PLAYER_NAME], string[256], reportadoid,ID;
    {
        if(sscanf(params,"us",ID,params[1])) return SendClientMessage(playerid,-1,"USO: {15FF00}/reportar [ID] [razon]");
        GetPlayerName(playerid, nombrejugador, sizeof(nombrejugador));
        GetPlayerName(reportadoid, nombrereportado, sizeof(nombrereportado));
        PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
        format(string, sizeof(string), "El usuario %s [%d] ha reportado al usuario %s [%d] Razon: %s.", nombrejugador, playerid, nombrereportado, reportadoid,params[1]);
        SendMessageToAdmin(string);
        SendClientMessage(playerid, COLOR_VERDE_CLARO, "Mensaje enviado a los administradores conectados.");
    }
    return 1;
}

CMD:re(playerid,params[])
{
    new nombrejugador[MAX_PLAYER_NAME], nombrereportado[MAX_PLAYER_NAME], string[256], reportadoid,ID;
    {
        if(sscanf(params,"us",ID,params[1])) return SendClientMessage(playerid,-1,"USO: {15FF00}/re [ID] [razon]");
        GetPlayerName(playerid, nombrejugador, sizeof(nombrejugador));
        GetPlayerName(reportadoid, nombrereportado, sizeof(nombrereportado));
        PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
        format(string, sizeof(string), "El usuario %s [%d] ha reportado al usuario %s [%d] Razon: %s.", nombrejugador, playerid, nombrereportado, reportadoid,params[1]);
        SendMessageToAdmin(string);
        SendClientMessage(playerid, COLOR_VERDE_CLARO, "Mensaje enviado a los administradores conectados.");
    }
    return 1;
}

CMD:spec(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        new ID;
        if(sscanf(params, "u",ID)) return SendClientMessage(playerid, -1, "Uso: /spec (id).");
        if(!IsPlayerConnected(ID)) return SendClientMessage(playerid, -1, "Este jugador no esta conectado");
        if(IsPlayerNPC(ID)) return SendClientMessage(playerid, -1, "no puedes spectear a un bot");
        if(ID == playerid) return SendClientMessage(playerid, -1, "No puedes spectearte a ti mismo.");
        if(IsPlayerSpectating(ID)) return SendClientMessage(playerid, -1, "Ya estas specteando usa /listo.");
        if(IsPlayerBeiningSpectated(ID)) return SendClientMessage(playerid, -1, "Este jugador ya esta siendo specteado.");

        if(!IsPlayerSpectating(playerid))
        {
            GetPlayerPos(playerid, pSpectatingPos[playerid][0], pSpectatingPos[playerid][1], pSpectatingPos[playerid][2]);
            GetPlayerFacingAngle(playerid, pSpectatingPos[playerid][3]);
            pSpectatingInterior[playerid] = GetPlayerInterior(playerid);
            pSpectatingVirtualWorld[playerid] = GetPlayerVirtualWorld(playerid);
        }
        sSpectating[playerid] = true;
        TogglePlayerSpectating(playerid, true);
        sBeingSpectated[ID] = true;
        pSpectatingPlayer[playerid] = ID;
        if(IsPlayerInAnyVehicle(ID))
        {
            SetPlayerVirtualWorld(playerid, GetVehicleVirtualWorld(GetPlayerVehicleID(ID)));
            PlayerSpectateVehicle(playerid, GetPlayerVehicleID(ID));
        }
        else
        {
            SetPlayerInterior(playerid, GetPlayerInterior(ID));
            SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(ID));
            PlayerSpectatePlayer(playerid, ID);
        }
        return 1;
    }
    return 0;
}

CMD:listo(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        if(!IsPlayerSpectating(playerid)) return SendClientMessage(playerid, -1, "** No estas specteando a nadie.");
        TogglePlayerSpectating(playerid, false);
        SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
        return 1;
    }
    return 0;
}
CMD:motor(playerid,params[])
{
    if(IsPlayerInAnyVehicle(playerid))
    {
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "No estas dentro del vehiculo!");
        SCM(playerid,-1,"Encendiendo vehiculo...");
        SetTimerEx("encenderauto",3000, false,"i",playerid);
    }
    return 1;
}
CMD:luces(playerid,params[])
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if(IsPlayerInAnyVehicle(playerid))
    {
        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, -1, "No estas dentro de un vehiculo!");
        if(Luces[vehicleid] == 0)
        {
            GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(vehicleid, engine, 1, alarm, doors, bonnet, boot, objective);
            Luces[vehicleid] = 1;
            GameTextForPlayer(playerid,"~g~~h~Luces Encendidas",1000,3);
        }
        else 
        {
            GetVehicleParamsEx(vehicleid,engine, lights, alarm, doors, bonnet, boot, objective);
            SetVehicleParamsEx(vehicleid, engine, 0, alarm, doors, bonnet, boot, objective);
            Luces[vehicleid] = 0;
            GameTextForPlayer(playerid,"~g~~h~Luces Apagadas",1000,3);
        }
    }
    return 1;
}

stock HidePlayerDni(playerid)
{
    PlayerTextDrawHide(playerid, Box[playerid]);
    PlayerTextDrawHide(playerid, Nombre_[playerid]);
    PlayerTextDrawHide(playerid, Skin[playerid]);
    PlayerTextDrawHide(playerid, Age[playerid]);
    PlayerTextDrawHide(playerid, Close[playerid]);
    PlayerTextDrawHide(playerid, Nacimiento[playerid]);
    PlayerTextDrawHide(playerid, City[playerid]);
    return 1;
}
stock ShowPlayerDni(playerid, ID)
{
    PlayerTextDrawShow(ID, City[playerid]);
    PlayerTextDrawShow(ID, Box[playerid]);
    PlayerTextDrawShow(ID, Nacimiento[playerid]);
    PlayerTextDrawShow(ID, Close[playerid]);
    PlayerTextDrawShow(ID, Age[playerid]);
    PlayerTextDrawShow(ID, Skin[playerid]);
    PlayerTextDrawShow(ID, Nombre_[playerid]);
    return 1;
}

CMD:dni(playerid, params[])
{
    if(PlayerInfo[playerid][pDNI] != 0)
    {
        new ID;
        new string[128];
        if(sscanf(params,"u", ID)) return SendClientMessage(playerid,-1,"USO: {15FF00}/dni [ID/nombre]");
        format(string, sizeof(string), " {9933FF}* %s le muestra su dni a %s * ",pName(playerid),pName(ID));
        SendClientMessageToNearby(playerid, -1, 10.0, string);
        new Ciudad[30],Fecha_N[10],Edad_[5];
        format(Fecha_N,10,"Fecha de nacimiento: %s",PlayerInfo[playerid][pFecha]);
        format(Edad_,10,"Edad: %s",PlayerInfo[playerid][pEdad]);
        format(Ciudad,30,"Lugar de nacimiento: %s",PlayerInfo[playerid][pLugar]);
        PlayerTextDrawSetString(playerid, City[playerid], Ciudad);
        PlayerTextDrawSetString(playerid, Nacimiento[playerid], Fecha_N);
        PlayerTextDrawSetString(playerid, Age[playerid], Edad_);
        PlayerTextDrawSetString(playerid, Nombre_[playerid], pName(playerid));
        PlayerTextDrawSetPreviewModel(playerid, Skin[playerid], GetPlayerSkin(playerid));
        ShowPlayerDni(playerid, ID);
    }
    else return SCM(playerid,-1,"No tienes un dni, crea uno en el ayuntamiento.");
    return 1;
}

CMD:ip(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new ip[16];
        new string[256];
        new nombre[MAX_PLAYER_NAME];
        new nombrevisto[MAX_PLAYER_NAME];
        new ID;
        if(sscanf(params,"d", ID)) return SCM(playerid,-1,"Uso: /ip [ID]");
        GetPlayerName(playerid,nombre,sizeof(nombre));
        GetPlayerName(ID,nombrevisto,sizeof(nombrevisto));
        GetPlayerIp(ID, ip, 16);
        format(string,sizeof(string),"La IP de %s es: %s",nombre, ip);
        SCM(playerid,-1, string);
        format(string,sizeof(string),"[Staff] %s esta viendo La IP de %s.",nombre,nombrevisto);
        SendMessageToAdmin(string);
        return 1;
    }
    return 0;
}

CMD:creditos(playerid)
{
    ShowPlayerDialog(playerid, DIALOG_CREDITOS,DIALOG_STYLE_MSGBOX, "Creditos LatinRP","Fundador: Negrura \nSubFundador: indefinido \nScripters:Negrura\nHoster: indefinido", "Gracias","Cancelar");
    return 1;
}

CMD:cachear(playerid,params[])
{
    if(PlayerInfo[playerid][pPolicia] >= 1)
    {
        new ID;
        if(sscanf(params, "u", ID)) return TextdrawError(playerid, "USO: /cachear [ID/Nombre]");
        new string[256],cacheo[126],nombrepolicia[MAX_PLAYER_NAME],nombre[MAX_PLAYER_NAME],dinero;
        dinero = PlayerInfo[ID][pDinero];
        new armas = GetPlayerWeapon(ID),NW[23];
        GetWeaponName(armas, NW, 23);
        GetPlayerName(playerid, nombrepolicia, sizeof(nombrepolicia));
        GetPlayerName(ID, nombre, sizeof(nombre));
        format(string,sizeof(string),"%s Comienza a cachear a %s",nombrepolicia,nombre);
        SendClientMessageToNearby(playerid, -1, 10.0, string);
        GetPlayerName(playerid, nombre, sizeof(nombre));
        if(armas != 0) 
        {
        format(cacheo,sizeof(cacheo),"%s(ID:%d) Tiene: Dinero:%d \n Tiene Armas\nArma:%s",nombre,ID,dinero,NW);
        ShowPlayerDialog(playerid,4,DIALOG_STYLE_MSGBOX,"Informacion Cacheo",cacheo,"Aceptar","Cancelar");
        }
        else
        {
        format(cacheo,sizeof(cacheo),"%s(ID:%d) Tiene: Dinero:%d \n No tiene Armas.",nombre,ID,dinero);
        ShowPlayerDialog(playerid,4,DIALOG_STYLE_MSGBOX,"Informacion Cacheo",cacheo,"Aceptar","Cancelar");
        }
        return 1;
    }
    return 0;
}

CMD:acento(playerid)
{
    ShowPlayerDialog(playerid,DIALOG_ACENTOS, DIALOG_STYLE_LIST,"Acentos","Mexicano\nChileno\nArgentino\nVenezolano\nParaguayo\nPortugues\nArabe\nRuso\nIngles\nColombiano\nJapones\nChino\nBoliviano\nGangster\nPuerto Riqueño\nSalvatoreño\nTailandes\nCastellano.","Aceptar","Cancelar");
    return 1;
}
CMD:dardinero(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        new money;
        new ID;
        new string[144];
        if(sscanf(params, "ii", ID,money)) return SCM(playerid,-1,"USO: "#COLOR_AMARILLO"/dardinero [id][cantidad]");
        PlayerInfo[ID][pDinero] += money;
        format(string, sizeof(string), "[Staff] Te han dado %i$", money);
        SendClientMessage(ID,-1,string);
        GivePlayerMoney(ID, money);
        return 1;
    }
    return 0;
}
CMD:derechos(playerid)
{
    if(PlayerInfo[playerid][pPolicia] >= 1)
    {
        new mensaje[256], nombre[MAX_PLAYER_NAME];
        GetPlayerName(playerid, nombre, sizeof(nombre));
        format(mensaje,sizeof(mensaje), "%s dice: Tiene derecho a Guardar Silencio, todo lo que diga sera usado en su contra,",nombre);
        SendClientMessageToNearby(playerid, -1, 10.0, mensaje);
        format(mensaje, sizeof(mensaje), "%s dice: Tiene derecho a comida y bebida, tiene derecho a un abogado",nombre);
        SendClientMessageToNearby(playerid, -1, 10.0, mensaje);
        format(mensaje, sizeof(mensaje), "%s dice: tiene derecho a una llamada,de no mas de un minuto delante de un funcionario publico,",nombre);
        SendClientMessageToNearby(playerid, -1, 10.0, mensaje);
        format(mensaje, sizeof(mensaje), "%s dice: tiene derecho a ser tratado por un medico.",nombre);
        SendClientMessageToNearby(playerid, -1, 10.0, mensaje);
        return 1;
    }
    return 0;
}

CMD:darvip(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new id;
        if(sscanf(params, "u", id)) return SCM(playerid,COLOR_WHITE,"Uso: /darvip [ID/nombre]");
        new msg1[256],msg2[256],nombrevip[MAX_PLAYER_NAME],nombrestaff[MAX_PLAYER_NAME];
        GetPlayerName(playerid,nombrestaff,sizeof(nombrestaff));
        GetPlayerName(id,nombrevip,sizeof(nombrevip));
        format(msg2, sizeof(msg2), "[STAFF] %s ha hecho vip a %s.",nombrestaff,nombrevip);
        SendMessageToAdmin(msg2);
        format(msg2, sizeof(msg2), "[STAFF] %s te ha hecho vip.",nombrestaff);
        SendClientMessage(id,-1,msg1);
        PlayerInfo[id][pVip] = 1;
        return 1;
    }
    return 0;
}

CMD:comprarvip(playerid)
{
    if(PlayerInfo[playerid][LatinCoins] >= 5)
    {
        PlayerInfo[playerid][pVip] = 1;
        PlayerInfo[playerid][LatinCoins] -= 5;
        GameTextForPlayer(playerid,"Obtuviste VIP", 5000, 6);
    }
    else return SCM(playerid,-1,"Debes de tener 5 latincoins para comprar el VIP.");
    return 1;
}

CMD:darcoins(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new coins;
        new id;
        new namelc[MAX_PLAYER_NAME],staffname[MAX_PLAYER_NAME];
        new msg1[144],msg2[144];
        if(sscanf(params, "ud", id,coins)) return SCM(playerid,-1,"USO: "#COLOR_AMARILLO"/darcoins [id/nombre] [cantidad]");
        GetPlayerName(playerid,staffname,sizeof(staffname));
        GetPlayerName(id,namelc,sizeof(namelc));
        PlayerInfo[id][LatinCoins] = coins;
        format(msg1, sizeof(msg1), "Staff %s Te ha dado %i latincoins",staffname,coins);
        SendClientMessage(id,-1,msg1);
        format(msg2, sizeof(msg2), "[Staff] %s le ha dado %i latincoins a %s ",staffname,coins,namelc);
        SendMessageToAdmin(msg2);
        return 1;
    }
    else return 0;
}

CMD:darmedicamentos(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new medicamentos;
        new id;
        new namemc[MAX_PLAYER_NAME],staffname[MAX_PLAYER_NAME];
        new msg1[144],msg2[144];
        if(sscanf(params, "ud", id,medicamentos)) return SCM(playerid,-1,"USO: "#COLOR_AMARILLO"/darmedicamentos [id/nombre] [cantidad]");
        GetPlayerName(playerid,staffname,sizeof(staffname));
        GetPlayerName(id,namemc,sizeof(namemc));
        PlayerInfo[id][pMedicamentos] = medicamentos;
        format(msg1, sizeof(msg1), "Staff %s Te ha dado %i medicamentos",staffname,medicamentos);
        SendClientMessage(id,-1,msg1);
        format(msg2, sizeof(msg2), "[Chat Staff] %s le ha dado %i medicamentos a %s ",staffname,medicamentos,namemc);
        SendMessageToAdmin(msg2);
        return 1;
    }
    else return 0;
}

CMD:darbotiquines(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new botis;
        new id;
        new namemc[MAX_PLAYER_NAME],staffname[MAX_PLAYER_NAME];
        new msg1[144],msg2[144];
        if(sscanf(params, "ud", id,botis)) return SCM(playerid,-1,"USO: "#COLOR_AMARILLO"/darbotiquines [id/nombre] [cantidad]");
        GetPlayerName(playerid,staffname,sizeof(staffname));
        GetPlayerName(id,namemc,sizeof(namemc));
        PlayerInfo[id][pBotis] = botis;
        format(msg1, sizeof(msg1), "Staff %s Te ha dado %i medicamentos",staffname,botis);
        SendClientMessage(id,-1,msg1);
        format(msg2, sizeof(msg2), "[Chat Staff] %s le ha dado %i botiquines a %s ",staffname,botis,namemc);
        SendMessageToAdmin(msg2);
        return 1;
    }
    else return 0;
}
CMD:darmarihuana(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
        new marihuana;
        new id;
        new namemr[MAX_PLAYER_NAME],staffname[MAX_PLAYER_NAME];
        new msg1[144],msg2[144];
        if(sscanf(params, "ud", id,marihuana)) return SCM(playerid,-1,"USO: "#COLOR_AMARILLO"/darmarihuana [id/nombre] [gramos]");
        GetPlayerName(playerid,staffname,sizeof(staffname));
        GetPlayerName(id,namemr,sizeof(namemr));
        PlayerInfo[id][pMarihuana] = marihuana;
        format(msg1, sizeof(msg1), "Staff %s Te ha dado %i medicamentos",staffname,marihuana);
        SendClientMessage(id,-1,msg1);
        format(msg2, sizeof(msg2), "[Chat Staff] %s le ha dado %i medicamentos a %s ",staffname,marihuana,namemr);
        SendMessageToAdmin(msg2);
        return 1;
    }
    else return 0;
}
CMD:beneficios(playerid, params[])
{
    if(!strcmp(params, "vip", true))
    {
        ShowPlayerDialog(playerid, BENEFICIOS_VIP, DIALOG_STYLE_MSGBOX,"Beneficios Vip","Servicio medico a 1000$, Medicamentos curan 8 de vida, Servicio medico mas rapido, isla solo para vips\n Un rango en discord junto a un canal privado solo para VIPS\nEl Staff te tomara tus reportes aportes etc mas en cuenta...", "Aceptar", "Cancelar");  
    }
    else if(!strcmp(params, "latincoins", true))
    {
        SCM(playerid,-1,"venderlas a un precio caro estimado: 250k$");
    }
    return 1;
}
CMD:destruirv(playerid,params[])
{
    new vid;
    if(sscanf(params, "i", vid)) return SendClientMessage(playerid, -1,"Error: /traerveh [vehid]");
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
    if(sscanf(params, "u", vid)) return SendClientMessage(playerid, -1, "Error: /destruirveh [vehicleid]");
    PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    DestroyVehicle(vid);
    return 1;
    }
    return 0;
}
CMD:vdestruir(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 2)
    {
        if(IsPlayerInAnyVehicle(playerid))
        {
            PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
            DestroyVehicle(GetPlayerVehicleID(playerid));
        }
        else return SendClientMessage(playerid, COLOR_ROJO, "No estas conduciendo ningun vehiculo.");
        return 1;
    }
    return 0;
}
CMD:config(playerid)
{
    MostrarConfigs(playerid);
    return 1;
}
CMD:est(playerid, params[])
{
    ShowEst(playerid);
    return 1;
}
CMD:iniciargrafos(playerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
    if(GrafosIniciados == true) { SCM(playerid,-1,"Error: Los graffs ya estan iniciados"); }
    else { SetTimer("IniciarGrafos",100,0); }
    return 1;
    }
    return 0;
}
stock Medicament(playerid)
{
    new Float:Health,string[128],nombre[MAX_PLAYER_NAME];
    if(Health >= 95) return SCM(playerid,-1,"No puedes curarte mas...");
    GetPlayerHealth(playerid, Health);
    PlayerInfo[playerid][pMedicamentos] -= 1;
    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 0, 1, 1, 1);
    GetPlayerName(playerid, nombre, sizeof(nombre));
    format(string, sizeof(string),"{9933FF} *%s consume 1 medicamento*",nombre);
    SendClientMessageToNearby(playerid, -1, 10.0, string);
    tsmedicamentoconsumido[playerid] = gettime();
    SetPlayerHealth(playerid, Health + 5);
    return 1;
}
stock Medicament_Vip(playerid)
{
    new Float:Health,string[128],nombre[MAX_PLAYER_NAME];
    if(Health >= 95) return SCM(playerid,-1,"No puedes curarte mas...");
    GetPlayerHealth(playerid, Health);
    PlayerInfo[playerid][pMedicamentos] -= 1;
    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 0, 1, 1, 1);
    GetPlayerName(playerid, nombre, sizeof(nombre));
    format(string, sizeof(string),"{9933FF} *%s consume 1 medicamento*",nombre);
    SendClientMessageToNearby(playerid, -1, 10.0, string);
    tsmedicamentoconsumido[playerid] = gettime();
    SetPlayerHealth(playerid, Health + 8);
    return 1;
}
CMD:medicamento(playerid)
{
    if(PlayerInfo[playerid][pMedicamentos] >= 1)
    {
        if((gettime() - tsmedicamentoconsumido[playerid]) < 30 * 1) return SendClientMessage(playerid, -1, "Tienes Que Esperar 30 segundos Para Volver a consumir un medicamento...");
        {
            if(PlayerInfo[playerid][pVip] == 1) return Medicament_Vip(playerid);
            else return Medicament(playerid);
        }
    }
    else return SCM(playerid,-1,"No tienes medicamentos");
}
stock Mari_Vip(playerid)
{
    new Float:Chaleco,string[128],nombre[MAX_PLAYER_NAME];
    if(Chaleco >= 95) return SCM(playerid,-1,"No puedes curarte mas...");
    GetPlayerArmour(playerid, Chaleco);
    PlayerInfo[playerid][pMarihuana] -= 1;
    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 0, 1, 1, 1);
    GetPlayerName(playerid, nombre, sizeof(nombre));
    format(string, sizeof(string),"{9933FF} *%s consume 1gr de marihuana*",nombre);
    SendClientMessageToNearby(playerid, -1, 10.0, string);
    tsmarihuanaconsumida[playerid] = gettime();
    SetPlayerArmour(playerid, Chaleco + 8);
    return 1;
}
stock Mari(playerid)
{
    new Float:Chaleco,string[128],nombre[MAX_PLAYER_NAME];
    if(Chaleco >= 95) return SCM(playerid,-1,"No puedes drogarte mas...");
    GetPlayerArmour(playerid, Chaleco);
    PlayerInfo[playerid][pMarihuana] -= 1;
    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 0, 1, 1, 1);
    GetPlayerName(playerid, nombre, sizeof(nombre));
    format(string, sizeof(string),"{9933FF} *%s consume 1gr de marihuana*",nombre);
    SendClientMessageToNearby(playerid, -1, 10.0, string);
    tsmarihuanaconsumida[playerid] = gettime();
    SetPlayerArmour(playerid, Chaleco + 5);
    return 1;
}
CMD:marihuana(playerid)
{
    if(PlayerInfo[playerid][pMarihuana] >= 1)
    {
        if((gettime() - tsmarihuanaconsumida[playerid]) < 30 * 1) return SendClientMessage(playerid, -1, "Tienes Que Esperar 30 segundos Para Volver a consumir 1gr marihuana...");
        {
            if(PlayerInfo[playerid][pVip] == 1) return Mari_Vip(playerid);
            else return Mari(playerid);
        }
    }
    else return SCM(playerid,-1,"No tienes mas gramos de marihuana");
}
CMD:explotar(playerid, params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 3)
    {
    if(sscanf(params,"u",params[0],params[1])) return SendClientMessage(playerid,COLOR_WHITE,"/explotar {8e99FF}[ID/NOMBRE]");
    if(!IsPlayerConnected(params[0])) return SendClientMessage(playerid,COLOR_WHITE,"Jugador desconectado");
    new Float:x, Float:y, Float:z;
    GetPlayerPos(params[0], x, y, z);
    CreateExplosion(x, y, z, 10, 10.0);
    }
    return 1;
}
CMD:crashear(playerid, params[])
{
    new id;
    if(PlayerInfo[playerid][pAdmin] >= 4)
    {
    if(sscanf(params, "ud", id)) return SendClientMessage(playerid, -1, "Uso: /crash [ID/Nombre]");
    if(!IsPlayerConnected(id)) return SendClientMessage(playerid, -1, "el Jugador no esta conectado");
    GameTextForPlayer(id, "%%$#@1~555#",66666000, 6);
    }
    return 1;
}
CMD:creartexto(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
    new msgstaff[144],nombre3dtxt[30],text[144],Float:tX,Float:tY,Float:tZ,virw = GetPlayerVirtualWorld(playerid);
    if(sscanf(params, "ss",nombre3dtxt,text)) return TextdrawError(playerid, "USO: /creartexto [nombre] [texto]");
    GetPlayerPos(playerid, tX, tY, tZ);
    Create3DTextLabel(text, -1, tX, tY, tZ, 5.0, virw, 0);
    format(msgstaff,sizeof(msgstaff),"[Chat Staff] -%s(id:%d) creo un texto llamado `%s´ texto: %s ",pName(playerid),playerid,nombre3dtxt,text);
    SendMessageToAdmin(msgstaff);
    printf("new %s;\n %s = Create3DTextLabel(%s,-1,%f,%f,%f,5.0,%d,0);",nombre3dtxt,nombre3dtxt,text,tX,tY,tZ,virw);
    }
    return 1;
}
CMD:escudo(playerid)
{
if(PlayerInfo[playerid][pPolicia] >= 2)
{
    new string[64];
    format(string, sizeof(string), "{9933FF} %s * Saca un escudo de policia *",pName(playerid));
    SendClientMessageToNearby(playerid, -1, 10.0, string);
    SetPlayerAttachedObject(playerid,0,18637,14,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
    usandoescudo[playerid] = true;
}
return 1;
}
CMD:cambiarint(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        new id,int;
        if(sscanf(params, "ud", id,int)) return TextdrawError(playerid, "USA: /cambiarvw [id/nombre] [id int]");
        SetPlayerInterior(id, int);
        new message[144];
        format(message,sizeof(message),"%s le asigno el interior %d a %s",pName(playerid),int,pName(id));
        SendMessageToAdmin(message);
        return 1;
    }
    return 0;
}
CMD:cambiarvw(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        new id,vw;
        if(sscanf(params, "ud", id,vw)) return TextdrawError(playerid, "USA: /cambiarvw [id/nombre] [id vw]");
        SetPlayerVirtualWorld(id, vw);
        new message[144];
        format(message,sizeof(message),"%s le asigno el virtualworld %d a %s",pName(playerid),vw,pName(id));
        SendMessageToAdmin(message);
        return 1;
    }
    return 0;
}
CMD:respawnveh(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        new vid;
        if(sscanf(params, "i", vid)) return TextdrawError(playerid,"Error: /respawnveh [vehid]");
        if(vid == INVALID_VEHICLE_ID) return TextdrawError(playerid,"Error: id de vehiculo invalida.");
        SetVehicleToRespawn(vid);
        new message[144];
        format(message,sizeof(message),"%s respawneo el vehiculo %d",pName(playerid),vid);
        SendMessageToAdmin(message);
        return 1;
    }
    return 0;
}
CMD:traerveh(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 3)
    {
        new vid;
        if(sscanf(params, "i", vid)) return TextdrawError(playerid,"Error: /traerveh [vehid]");
        if(vid == INVALID_VEHICLE_ID) return TextdrawError(playerid,"Error: id de vehiculo invalida.");
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        SetVehiclePos(PlayerInfo[playerid][pVid], x, y, z);
        new message[144];
        format(message,sizeof(message),"%s llevo a su posicion el vehiculo %d",pName(playerid),vid);
        SendMessageToAdmin(message);
        return 1;
    }
    return 0;
}
CMD:miveh(playerid, params[])
{
    new query[520];
    mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `Vehiculos` WHERE `Owner`='%s'", pName(playerid));
    mysql_tquery(MySQL, query, "MiVehs", "i", playerid);
    return 1;
}
CMD:emisoraoff(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(emisoraon[vehicleid] == true)
		{
			StopAudioStreamForPlayer(playerid);
			emisoraon[vehicleid] = false;
		}
		else return SCM(playerid,-1,"La emisora ya esta apgada.");
	}    
	return 1;
}

/* el index 0 de las prendas sera usado siempre para prendas estaticas o de comando no para las prendas que se guardan siempre */