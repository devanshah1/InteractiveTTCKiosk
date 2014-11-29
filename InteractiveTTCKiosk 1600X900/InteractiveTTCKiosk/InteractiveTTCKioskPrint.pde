import vialab.SMT.*;

/**
 * 
 */
void interactiveTTCKioskPrintSetup()
{
  // Create the zones for the images of each interaction
  imageZonePrintBackground = new Zone ( "PrintBackground" ) ;
  imageZonePrintExit       = new Zone ( "PrintExit" ) ;
  
  // Build the main Screen Zones
  imageZonePrintBackground.setSize(displayWidth,displayHeight);
  SMT.add(imageZonePrintBackground);
  
  // Add the navigations as child zones of the main screen zone
  imageZonePrintExit.setSize (Math.round(displayWidth/14.25), Math.round(displayHeight/10.25));
  imageZonePrintBackground.add(imageZonePrintExit);
}

/**
 * 
 */
void interactiveTTCKioskPrintImageLoader()
{
  Print = loadImage ( "TTCKioskImages/General/print.jpg" ) ; 
}

/********************* Main Screen Background START **************************/
void drawPrintBackground( Zone zone )
{
  fill( #000000 ) ;
  Print.resize(zone.width, zone.height);
  image (Print , 0, 0) ;
}

void pickDrawPrintBackground ( Zone zone )
{
  rect(0, 0, zone.width, zone.height);
}

void touchPrintBackground ( Zone zone ) 
{
  Zone temp = SMT.get("MainScreenBackground");
  SMT.clearZones ();
  SMT.add(temp);
}
/********************** Main Screen Background End *************************/

/********************* Bus System Status Map START **************************/
void drawPrintExit( Zone zone )
{
  fill( #000000 ) ;
  generalExit.resize(zone.width, zone.height);
  image (generalExit , displayWidth-200, displayHeight/2-440) ;
}

void pickDrawPrintExit ( Zone zone )
{
  rect(displayWidth-200, displayHeight/2-440, zone.width, zone.height);
}

void touchPrintExit ( Zone zone ) 
{
  Zone temp = SMT.get("MainScreenBackground");
  SMT.clearZones ();
  SMT.add(temp);
}
/********************** Bus System Status Map End ***************************/
