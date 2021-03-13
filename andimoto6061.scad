/* testLayout.scad
Author: andimoto@posteo.de
----------------------------
for placing assambled parts and
single parts go to end of this file

this file is a template which may be copied to create a new keyboard layout
and to configure and place essential parts like usb cut out, screw holes or stabilizers

this file includes KeyV2 files. see https://github.com/rsheldiii/KeyV2
if you don't want this file to be included, just don't clone this library or
set the 'DoKeycapSimulation' parameter to false call for placing all keycaps on the keyboard.
*/

/* ########## predefinitions ############ */
$fn=30;


/* Thickness of entire plate which holds the switches.
 * this is the top of the keyboard
 */
plateThickness=3;
/* thickness of the walls */
wallThickness=3;
/* height of the case */
caseHeight=13;

/* space between inner case stabilizers
   and the bottom/lip of the case */
innerCaseSpace = 5;

/* edge radius of the case */
caseRadius=1;

//length, in units, of board
width=15;
//Height, in units, of board
height=5;

/* thickness of the lid.
   the function 'lid()' will add an
	 extra mm to get a step for the lip
	 see 'innerExtraLid' variable in constants  */
lidThickness=3;


/* ########## variables for cutting keyboard into smaller pieces ########## */
/* these are unit values; one unit is one key or switchhole
 * this makes the keyboard printable on nearly every printer.
 */
cutAfterUnits = 6.5;
spacebarCut = 2.5;



/* ################## calculated vars #################### */


/* debug extra for avoiding artefacts @ compilation */
extra=1;


/* add or reduce some tolerance for the switch holes.
 * depends on your printers resolution and if you want
 * narrow or loose fit of switches. do not configure to
 * narrow switch holes. when placing switches into the holes
 * they will pull the case apart and bend it. this will normally
 * be reduced by the lid, but do not overact this.
 */
switchHoleTolerance = -0.2;


/* ############################################## */
/* ########## LAYOUT AND KEYCAP COLORS ########## */
/* ############################################## */
/* Usage: [[column place, row place],keycap unit, color for keycap simulation] */
/* 				"column place" is the place of the switch hole in the column;
 					- example: Esc, F1, F2, F3, ...
					            0    1   2   3  ...
					"row place" is the place of the switch in the row;
					- example:  Esc, accent, TAB, CapsLock, ...
*/

ansiUS_6061 = [
//start ROW 1
[[0,0],1,"White"], //'
[[1,0],1,"MintCream"], //1
[[2,0],1,"MintCream"], //2
[[3,0],1,"MintCream"], //3
[[4,0],1,"MintCream"], //4
[[5,0],1,"MintCream"], //5
[[6,0],1,"MintCream"], //6
[[7,0],1,"MintCream"], //7
[[8,0],1,"MintCream"], //8
[[9,0],1,"MintCream"], //9
[[10,0],1,"MintCream"], //0
[[11,0],1,"MintCream"], //-_
[[12,0],1,"MintCream"], //=+
[[13,0],2,"White"], //backspace
//start ROW 2
[[  0,1],1.5,"Grey"], //TAB
[[1.5,1],1,"MintCream"], //Q
[[2.5,1],1,"MintCream"], //W
[[3.5,1],1,"MintCream"], //E
[[4.5,1],1,"MintCream"], //R
[[5.5,1],1,"MintCream"], //T
[[6.5,1],1,"MintCream"], //Y
[[7.5,1],1,"MintCream"], //U
[[8.5,1],1,"MintCream"], //I
[[9.5,1],1,"MintCream"], //O
[[10.5,1],1,"MintCream"], //P
[[11.5,1],1,"MintCream"], //[
[[12.5,1],1,"MintCream"], //]
[[13.5,1],1.5,"Grey"], // \
//start ROW 3
[[    0,2],1.75,"Grey"], //CapsLock
[[ 1.75,2],1,"MintCream"], //A
[[ 2.75,2],1,"MintCream"], //S
[[ 3.75,2],1,"MintCream"], //D
[[ 4.75,2],1,"MintCream"], //F
[[ 5.75,2],1,"MintCream"], //G
[[ 6.75,2],1,"MintCream"], //H
[[ 7.75,2],1,"MintCream"], //J
[[ 8.75,2],1,"MintCream"], //K
[[ 9.75,2],1,"MintCream"], //L
[[10.75,2],1,"MintCream"], //;
[[11.75,2],1,"MintCream"], //'
[[12.75,2],2.25,"Grey"], //ENTER
//start ROW 4
[[    0,3],2.25,"Grey"], //LShift
[[ 2.25,3],1,"MintCream"], //Z
[[ 3.25,3],1,"MintCream"], //X
[[ 4.25,3],1,"MintCream"], //C
[[ 5.25,3],1,"MintCream"], //V
[[ 6.25,3],1,"MintCream"], //B
[[ 7.25,3],1,"MintCream"], //N
[[ 8.25,3],1,"MintCream"], //M
[[ 9.25,3],1,"MintCream"], //,
[[10.25,3],1,"MintCream"], //.
[[11.25,3],1,"MintCream"], // /
[[12.25,3],2.75,"Grey"], //RShift
//start ROW 5
[[   0,4],1.25,"Grey"], //LCTRL
[[1.25,4],1.25,"Grey"], //TUX
[[2.5 ,4],1.25,"Grey"], //ALT
[[3.75,4],6.25,"White"], //SPACE
[[10  ,4],1.25,"Grey"], //COMP
[[11.25,4],1.25,"Grey"], //Fn
[[12.5 ,4],1.25,"Grey"], //RCTRL
[[13.75 ,4],1.25,"Grey"], //RCTRL

];

/* move pcb and usb cutout in x direction
   for better placement */
pcbShift=0;

/* cutout for micro usb plug (not the housing of the usb plug!)
 * change this if using mini usb
 */
usbCutX=8;
usbCutY=wallThickness;
usbCutZ=3.4;

/* space in lid for placing the controller pcb.
 * this example is for arduino pro micro clones.
 * if you use teensy2.0 or something else configure
 * the size of the controller pcb you use. the function
 * 'pcbCutout()' will add 1mm to 'pcbWidth' for some clearance.
 * pcbLength should be as exactly as possible. this keeps the pcb
 * perfectly even if pcbWidth is to much
 */
 /* teensy2 cutout */
 pcbHeight = 1.8;
 pcbWidth = 18.5;
 pcbLength = 31.4;

 /* arduino pro micro cutout */
 //pcbHeight = 2;
 //pcbWidth = 18;
 //pcbLength = 34;

/* set 'addRisers' to true or false
 * to calculate a lid with holes for risers
 * and add risers to simulation
 */
addRisers = true;

/* keyboardRiser config
 * angleBaseX -> width of the riser
 * angleBaseY -> depth of the riser
 */
angleBaseY=90;
angleBaseX=60;
/* riser edge radius */
angleBaseRad=1;
/* polygon; this is the shape of the riser */
riserPoints = [
[0,0],
[angleBaseY,0],
[0,18]
];

/* optional: move keyboard risers as needed */
xRiserR=0;
xRiserL=0;

/* ####### include keyboard lib ############ */
include <constants.scad>
include <keyboardParts.scad>

/* ####### screw hole config ######## */
/* set the screw holes to a good position.
 * if your keyboard is bigger, you can add some
 * more screw holes into the keyboard case and lid.
 */
screwHoleArray = [
[26,lkey-0.5], //left lower row
[114,lkey-0.5],
[170,lkey-0.5],
[260,lkey-0.5], // right lower row

[26,lkey*2+wallThickness-3], //left upper row
[110,lkey*2+wallThickness-3],
[171,lkey*2+wallThickness-3],
[256,lkey*2+wallThickness-3], //right upper row

[26,lkey*3+wallThickness-3], //left upper row
[110,lkey*3+wallThickness-3],
[171,lkey*3+wallThickness-3],
[256,lkey*3+wallThickness-3], //right upper row

[26,lkey*4+wallThickness-3], //left upper row
[114,lkey*4+wallThickness-3],
[171,lkey*4+wallThickness-3],
[256,lkey*4+wallThickness-3], //right upper row
];


/* set colors for simulation */
colorCase="White";
colorLid="Black";
colorRiserR="Gainsboro";
colorRiserL="Gainsboro";

/* uncomment following line to get the keyboard simulation
 * with keycaps. set DoKeycapSimulation to true or false to add
 * or remove keycap simulation
 */
/* KeyboardSim(ansiUS_6061,false); */

/* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ */
/* ##### uncomment the keyboard part you want to print ##### */
/* vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv */

/* ### complete keyboard model ### */
mainCase(ansiUS_6061);
/* lid(); */

/* ### devided keyboard and lid model ### */
/* mainCaseLeft(ansiUS_6061); */
/* translate([0, 150,0]) mainCaseRight(ansiUS_6061); */

/* lidL(); */
/* lidR(); */

/* keyboardRiser(); */
