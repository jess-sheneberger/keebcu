/* andimoto_smallTKL.scad
Author: andimoto@posteo.de
----------------------------
for placing assambled parts and
single parts go to end of this file

this file contains the layout for my smallTKL keyboard 3d model which can be devided
to print on smaller printers

this file includes KeyV2 files. see https://github.com/rsheldiii/KeyV2
if you don't want this file to be included, just don't clone this library or
set the 'DoKeycapSimulation' parameter of KeyboardSim() to false.
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

//length, in units, of board
width=17.25;
//Height, in units, of board
height=6;

/* thickness of the lid.
   the function 'lid()' will add an
	 extra mm to get a step for the lip
	 see 'innerExtraLid' variable in constants  */
lidThickness=3;


/* ########## variables for cutting keyboard into smaller pieces ########## */
/* these are unit values; one unit is one key or switchhole
 * this makes the keyboard printable on nearly every printer.
 */
cutAfterUnits = 8;
spacebarCut = 4.5;

/* fRowSeparator [true/false]
 * Select separation of F-Row (or Row 0; key[0][1]=0)
 * This will move the upper row by a half unit (lkey*0.5)
 */
fRowSeparator=true;

/* skirt selctor and skirt settings
 * select 'skirtSelect' as true to activate a additional skirt
 * around the keyboard case. The variables 'skirtX' & 'skirtY'
 * are configurable as you want the skirt. These values ADD the
 * configured amount to the side of the case.
 * Note: be careful here, this interacts with caseRadius
 */
skirtSelect = false;
skirtX = 0;
skirtY = 0;

/* edge radius of the case
 * Note: be careful here, this interacts with skirtX/Y
 * THIS IS ONLY VALID WHEN 'skirtSelect' IS TRUE
 */
caseRadius=0;



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
/* ansiUS_smallTKL */
layout = [
//start ROW 0 Function ROW
[[0,0],1,"SlateGray"], //Esc
[[2,0],1,"Silver"], //F1
[[3,0],1,"Silver"], //F2
[[4,0],1,"Silver"], //F3
[[5,0],1,"Silver"], //F4
[[6.5,0],1,"SlateGray"], //F5
[[7.5,0],1,"SlateGray"], //F6
[[8.5,0],1,"SlateGray"], //F7
[[9.5,0],1,"SlateGray"], //F8
[[11,0],1,"Silver"], //F9
[[12,0],1,"Silver"], //F10
[[13,0],1,"Silver"], //F11
[[14,0],1,"Silver"], //F12
[[15.25,0],1,"SlateGray"], //PrintScreen
[[16.25,0],1,"SlateGray"], //PrintScreen
/* [[17,0],1,"Gray"], // Del/Ins */
//start ROW 1
[[  0,1],1,"Silver"], //'
[[1,1],1,"Silver"], //1
[[2,1],1,"Silver"], //2
[[3,1],1,"Silver"], //3
[[4,1],1,"Silver"], //4
[[5,1],1,"Silver"], //5
[[6,1],1,"Silver"], //6
[[7,1],1,"Silver"], //7
[[8,1],1,"Silver"], //8
[[9,1],1,"Silver"], //9
[[10,1],1,"Silver"], //0
[[11,1],1,"Silver"], //-_
[[12,1],1,"Silver"], //=+
[[13,1],2,"SlateGray"], //backspace
[[15.25,1],1,"SlateGray"], //ins
[[16.25,1],1,"SlateGray"], //pos1
//start ROW 2
[[  0,2],1.5,"SlateGray"], //TAB
[[1.5,2],1,"Silver"], //Q
[[2.5,2],1,"Silver"], //W
[[3.5,2],1,"Silver"], //E
[[4.5,2],1,"Silver"], //R
[[5.5,2],1,"Silver"], //T
[[6.5,2],1,"Silver"], //Y
[[7.5,2],1,"Silver"], //U
[[8.5,2],1,"Silver"], //I
[[9.5,2],1,"Silver"], //O
[[10.5,2],1,"Silver"], //P
[[11.5,2],1,"Silver"], //[
[[12.5,2],1,"Silver"], //]
[[13.5,2],1.5,"Silver"], // \
[[15.25,2],1,"SlateGray"], // del
[[16.25,2],1,"SlateGray"], // end
//start ROW 3
[[   0,3],1.75,"SlateGray"], //CapsLock
[[1.75,3],1,"Silver"], //A
[[2.75,3],1,"Silver"], //S
[[3.75,3],1,"Silver"], //D
[[4.75,3],1,"Silver"], //F
[[5.75,3],1,"Silver"], //G
[[6.75,3],1,"Silver"], //H
[[7.75,3],1,"Silver"], //J
[[8.75,3],1,"Silver"], //K
[[9.75,3],1,"Silver"], //L
[[10.75,3],1,"Silver"], //;
[[11.75,3],1,"Silver"], //'
[[12.75,3],2.25,"SlateGray"], //ENTER
//start ROW 4
[[   0,4],2.25,"SlateGray"], //LShift
[[2.25,4],1,"Silver"], //Z
[[3.25,4],1,"Silver"], //X
[[4.25,4],1,"Silver"], //C
[[5.25,4],1,"Silver"], //V
[[6.25,4],1,"Silver"], //B
[[7.25,4],1,"Silver"], //N
[[8.25,4],1,"Silver"], //M
[[9.25,4],1,"Silver"], //,
[[10.25,4],1,"Silver"], //.
[[11.25,4],1,"Silver"], // /
[[12.25,4],2.75,"SlateGray"], //RShift
[[15.25,4],1,"SlateGray"], //UP
//start ROW 5
[[   0,5],1.25,"SlateGray"], //LCTRL
[[1.25,5],1.25,"SlateGray"], //TUX
[[2.5 ,5],1.25,"SlateGray"], //ALT
[[3.75,5],6.25,"Silver"], //SPACE
[[10  ,5],1.25,"SlateGray"], //COMP
[[11.25,5],1.25,"SlateGray"], //Fn
[[12.5 ,5],1.25,"SlateGray"], //RCTRL
[[14.25,5],1,"SlateGray"], //LEFT
[[15.25,5],1,"SlateGray"], //DOWN
[[16.25,5],1,"SlateGray"], //RIGHT
];

/* enable placment of stabilizers on switchholes with x.5 unit in y direction
 * for example: true for numpad enter or numpad +
 * if you just want a single unit (1unit keycap) you can set this to false */
enableStabsOnHalfs = true;

/* move pcb and usb cutout in x direction
   for better placement */
pcbShift=0;

/* cutout for micro usb plug (not the housing of the usb plug!)
 * change this if using mini usb
 */
usbCutX=8;
usbCutY=wallThickness;

/* Arduino Pro Micro USB Port height */
/* usbCutZ=3.4; */

/* Teensy2 USB Port height */
usbCutZ=4.5;

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
 /* pcbHeight = 2; */
 /* pcbWidth = 18; */
 /* pcbLength = 34; */

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
[angleBaseY,3],
[0,18]
];

/* optional: move keyboard risers as needed */
xRiserR=0;
xRiserL=0;
yRiserAll=0;

riserConnectorRadius = 5;
riserConnectorX = 0;
riserConnectorY1 = 60;




/* ####### include keyboard lib ############ */
include <constants.scad>
include <keyboardParts.scad>

/* this module gets called in 'holematrix' and adds a specific
 * object to the 'holematrix'. it enables placing switchholes
  * or other cutout objects to the model */
module extraCutoutHook()
{
}

/* this module gets called in 'keySim()' and adds a specific
 * object to the 'key simulation'. it enables placing keys
  * or other objects to the model simulation */
module extraKeySimHook()
{
}


/* ####### screw hole config ######## */
/* set the screw holes to a good position.
 * if your keyboard is bigger, you can add some
 * more screw holes into the keyboard case and lid.
 */
screwHoleArray = [
[24,lkey-0.5], //left lower row
[145,lkey-0.5],
[190,lkey-0.5],
[309.5,lkey-0.5], // right lower row

[24,lkey*3+wallThickness-3], //left mid row
[142.5,lkey*3+wallThickness-3],
[181,lkey*3+wallThickness-3],
[309.5,lkey*3+wallThickness-3], //right mid row

[24,lkey*5+wallThickness-3], //left upper row
[143,lkey*5+wallThickness-3],
[181,lkey*5+wallThickness-3],
[309.5,lkey*5+wallThickness-3], //right upper row
];

/* rotate screw hole spacers */
screwSpacerRotation=0;

/* move horizontal case stabilizers inside the case.
 * to move horizontal by lkey/2 for half switch cutout.
 * this enables to set x.5 values in layout array.
 * else use 0!!
 */
caseStabMov=0;

/* set colors for simulation */
colorCase="#2C708B";
colorLid="DarkSlateGray";
colorRiserR="#2C708B";
colorRiserL="#2C708B";

/* ###################### BUILD_LINE ########################*/
/* ##########################################################*/
/* All calls after this line have to be ignored by the build script.
 * Do not place any calls above build line (or comment it)
 */

/* uncomment following line to get the keyboard simulation
 * with keycaps. set DoKeycapSimulation to true or false to add
 * or remove keycap simulation
 */
/* KeyboardSim(layout,true,8); */

/* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ */
/* ##### uncomment the keyboard part you want to print ##### */
/* vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv */

/* ### complete keyboard model ### */
/* color("Gold") mainCase(layout); */
/* color("Gold") lid(); */

/* ### devided keyboard and lid model ### */
/* mainCaseLeft(layout); */
/* mainCaseRight(layout); */

/* lidL(); */
/* lidR(); */

keyboardRiser();
