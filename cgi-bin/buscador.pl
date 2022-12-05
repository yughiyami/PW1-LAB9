#!/usr/bin/perl
use strict;
use warnings;
use CGI;

my $nombre =param('nombre');
my $periodo= param('periodo');
my $departamento = param('departamento');
my $denominacion =param('denominacion');
my $nombre_Mayusculas =uc($nombre);
my $periodo_Mayusculas=uc($periodo);
my $departamente_Mayusculas=uc($departamento);
my $denominacion_Mayusculas=uc($denominacion); 
##abrir
open (ARCHIVO,'<','Programas_de_Universidades.csv');
##variables para guardar datos

my $i=0;
my @CODIGO_ENTIDAD;
my @NOMBRE;
my @TIPO_GESTION;
my @ESTADO_LICENCIAMIENTO;
my @PERIODO_LICENCIAMIENTO;
my @CODIGO_FILIAL;
my @NOMBRE_FILIAL;
my @DEPARTAMENTO_FILIAL;
my @PROVINCIA_FILIAL;
my @CODIGO_LOCAL;
my @DEPARTAMENTO_LOCAL;
my @PROVINCIA_LOCAL;
my @DISTRITO_LOCAL;
my @LATITUD_UBICACION;
my @LONGITUD_UBICACION;
my @TIPO_AUTORIZACION_LOCAL;
my @DENOMINACION_PROGRAMA;
my @TIPO_NIVEL_ACADEMICO;
my @NIVEL_ACADEMICO;
my @CODIGO_CLASE_PROGRAMA_N2;
my @NOMBRE_CLASE_PROGRAMA_N2;
my @TIPO_AUTORIZACION_PROGRAMA;
my @TIPO_AUTORIZACION_PROGRAMA_LOCAL;
my @NUMERO_PRINCIPAL;

while (<ARCHIVO>)
{
    ($CODIGO_ENTIDAD[$i],$NOMBRE[$i],$TIPO_GESTION[$i],$ESTADO_LICENCIAMIENTO[$i],$PERIODO_LICENCIAMIENTO[$i],$CODIGO_FILIAL[$i],$NOMBRE_FILIAL[$i] 
    ,$DEPARTAMENTO_FILIAL[$i],$PROVINCIA_FILIAL[$i],$CODIGO_LOCAL[$i],$DEPARTAMENTO_LOCAL[$i],$PROVINCIA_LOCAL[$i],$DISTRITO_LOCAL[$i],$LATITUD_UBICACION[$i]
    ,$LONGITUD_UBICACION[$i],$TIPO_AUTORIZACION_LOCAL[$i],$DENOMINACION_PROGRAMA[$i],$TIPO_NIVEL_ACADEMICO[$i],$NIVEL_ACADEMICO[$i],$CODIGO_CLASE_PROGRAMA_N2[$i]
    ,$NOMBRE_CLASE_PROGRAMA_N2[$i],$TIPO_AUTORIZACION_PROGRAMA[$i],$TIPO_AUTORIZACION_PROGRAMA_LOCAL[$i])=split("\\|",$_);
    $i=$i+1;
}
##busqueda de los numeros 
my @numero1=&comparar($nombre_Mayusculas,$i,@NOMBRE);
my @numero2=&comparar($periodo_Mayusculas,$i,@PERIODO_LICENCIAMIENTO);
my @numero3=&comparar($departamente_Mayusculas,$i,@DEPARTAMENTO_LOCAL);
my @numero4=&comparar($denominacion_Mayusculas, $i,@DENOMINACION_PROGRAMA);
my $q=1;

$NUMERO_PRINCIPAL[0]=0;
for(my $k=1;$k<=1;$k++){
    if((@numero1[$k]==@numero2[$k])&&(@numero1[$k]==@numero3[$k])&&(@numero1[$k]==@numero4[$k])){
        $NUMERO_PRINCIPAL[$q]=$k;
        $q=$q+1;
        $NUMERO_PRINCIPAL[0]=$NUMERO_PRINCIPAL[0]+1;
}}
##tabla
my $tabla='<tabla style="width:100%">';
my $posicion=0;
$tabla=$tabla."</tr>";
         $tabla=$tabla."</tr>";
       $tabla=$tabla."<th><h6>CODIGO_ENTIDAD</h6></th>";
       $tabla=$tabla."<th><h6>NOMBRE</h6></th>";
       $tabla=$tabla."<th><h6>TIPO_GESTION</h6></th>";
       $tabla=$tabla."<th><h6>ESTADO_LICENCIAMIENTO</h6></th>";
       $tabla=$tabla."<th><h6>PERIODO_LICENCIAMIENTO</h6></th>";
       $tabla=$tabla."<th><h6>CODIGO_FILIAL</h6></th>";
       $tabla=$tabla."<th><h6>NOMBRE_FILIAL</h6></th>";
       $tabla=$tabla."<th><h6>DEPARTAMENTO_FILIAL</h6></th>";
       $tabla=$tabla."<th><h6>PROVINCIA_FILIAL</h6></th>";
       $tabla=$tabla."<th><h6>CODIGO_LOCAL</h6></th>";
       $tabla=$tabla."<th><h6>DEPARTAMENTO_LOCAL</h6></th>";
       $tabla=$tabla."<th><h6>PROVINCIA_LOCAL</h6></th>";
       $tabla=$tabla."<th><h6>DISTRITO_LOCAL</h6></th>";
       $tabla=$tabla."<th><h6>LATITUD_UBICACION</h6></th>";
       $tabla=$tabla."<th><h6>LONGITUD_UBICACION</h6></th>";
       $tabla=$tabla."<th><h6>TIPO_AUTORIZACION_LOCAL</h6></th>";
       $tabla=$tabla."<th><h6>DENOMINACION_PROGRAMA</h6></th>";
       $tabla=$tabla."<th><h6>TIPO_NIVEL_ACADEMICO</h6></th>";
       $tabla=$tabla."<th><h6>NIVEL_ACADEMICO</h6></th>";
       $tabla=$tabla."<th><h6>CODIGO_CLASE_PROGRAMA_N2</h6></th>";
       $tabla=$tabla."<th><h6>NOMBRE_CLASE_PROGRAMA_N2</h6></th>";
       $tabla=$tabla."<th><h6>TIPO_AUTORIZACION_PROGRAMA</h6></th>";
       $tabla=$tabla."<th><h6>TIPO_AUTORIZACION_PROGRAMA_LOCAL</h6></th>";
       $tabla=$tabla."</tr>";


for (my $j=1;$j<=$NUMERO_PRINCIPAL[0];$j++){
     $posicion=$NUMERO_PRINCIPAL[$j];
         $tabla=$tabla."</tr>";
       $tabla=$tabla."<th><h6>$CODIGO_ENTIDAD[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$NOMBRE[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$TIPO_GESTION[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$ESTADO_LICENCIAMIENTO[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$PERIODO_LICENCIAMIENTO[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$CODIGO_FILIAL[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$NOMBRE_FILIAL[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$DEPARTAMENTO_FILIAL[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$PROVINCIA_FILIAL[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$CODIGO_LOCAL[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$DEPARTAMENTO_LOCAL[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$PROVINCIA_LOCAL[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$DISTRITO_LOCAL[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$LATITUD_UBICACION[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$LONGITUD_UBICACION[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$TIPO_AUTORIZACION_LOCAL[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$DENOMINACION_PROGRAMA[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$TIPO_NIVEL_ACADEMICO[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$NIVEL_ACADEMICO[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$CODIGO_CLASE_PROGRAMA_N2[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$NOMBRE_CLASE_PROGRAMA_N2[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$TIPO_AUTORIZACION_PROGRAMA[$posicion]</h6></th>";
       $tabla=$tabla."<th><h6>$TIPO_AUTORIZACION_PROGRAMA_LOCAL[$posicion]</h6></th>";
       $tabla=$tabla."</tr>";
}

##comparamos y votamos los numeros
sub comparar{
    my ($busqueda,$cantidad,@lista)=@_;
    my  @numeros;
    my $i=1;
    my $indice=0;
    $numeros[0]=0;
    while($i<=$cantidad){
       $indice=index ($lista[$i],$busqueda);
       if ($indice!=-1){
        $numeros[$i]=$i;
       }else{
        $numeros[$i]=-1;
       }
     $i++;
    }
   return @numeros;
}
##imprimirlo en  html
print "content-type: text/html\n\n"
print <<ENDHTML;
<html>
  <head>
    <title>B.Universidades</title>
    <meta charset="UTF-8">
    <link rel="shortcurt icon" href="https://www.latercera.com/resizer/xDYJ3nq0H1yyLy_6rY7mpFRVROU=/900x600/smart/arc-anglerfish-arc2-prod-copesa.s3.amazonaws.com/public/6ONEH4CZUJBA5L3PVGJLUUW6L4.jpg">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="css/style.css">
  </head>

  <body>
    <div class="card">
      <div>
      <h1 class="header">Buscador de universidades</h1>
      </div>
      <form method=GET action="cgi-bin/buscador.pl">
         <h4>NOMBRE DE LA UNIVERSIDAD</h4> <input type=text name=nombre size=100 maxlength=255 value="$nombre" style="height: 30px;">
         <h4>PERIDO DE LICENCIAMENTO</h4> <input type=tex" name=periodo size=100 maxlength=255 value="$periodo" style="height: 30px;">
         <h4>DEPARTAMENTO LOCAL</h4> <input type=text name=departamento size=100 maxlength=255 value="$departamento" style="height: 30px;">
         <h4>DENOMINACION PROGRAMA</h4> <input type=text name=denominacion size=100 maxlength=255 value="$denominacion" style="height: 30px;">
       <br>

      <input type=submit value="buscar">
      </form>
      <h4><a href="index.html">regreso </a></h4>
      $tabla

    </div>
    <footer>
      <p>Grupo 2</p>
      <p>© UNSA-2022</p>
    </footer>
  </body>
 </html>
ENDHTML