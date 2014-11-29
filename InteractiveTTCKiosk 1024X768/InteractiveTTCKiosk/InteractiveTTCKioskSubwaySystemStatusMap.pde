import vialab.SMT.*;

/**
 * 
 */
void interactiveTTCKioskSubwaySystemStatusMapSetup()
{
  // Create the zones for the images of each interaction
  imageZoneSubwaySystemStatusMapBackground = new Zone ( "SubwaySystemStatusMapBackground" ) ;
  imageZoneSubwaySystemStatusMapMap        = new Zone ( "SubwaySystemStatusMapMap" ) ;
  imageZoneSubwaySystemStatusMapMessage    = new Zone ( "SubwaySystemStatusMapMessage" ) ;
  imageZoneSubwaySystemStatusMapExit       = new Zone ( "SubwaySystemStatusMapExit" ) ;
  
  // Build the main Screen Zones
  imageZoneSubwaySystemStatusMapBackground.setSize(1024,768);
  SMT.add(imageZoneSubwaySystemStatusMapBackground);
  
  // Add the navigations as child zones of the main screen zone
  imageZoneSubwaySystemStatusMapMap.setSize (Math.round(1024), Math.round(768/1.35));
  imageZoneSubwaySystemStatusMapBackground.add(imageZoneSubwaySystemStatusMapMap);
  
  imageZoneSubwaySystemStatusMapMessage.setSize (Math.round(1024/5.25), Math.round(768/5.25));
  imageZoneSubwaySystemStatusMapMap.add(imageZoneSubwaySystemStatusMapMessage);
  
  imageZoneSubwaySystemStatusMapExit.setSize (Math.round(1024/14.25), Math.round(768/10.25));
  imageZoneSubwaySystemStatusMapBackground.add(imageZoneSubwaySystemStatusMapExit);
}

/**
 * 
 */
void interactiveTTCKioskSubwaySystemStatusMapImageLoader()
{
  mapWithPoint = loadImage ( "TTCKioskImages/SubwayMap/2.jpg" ) ;
  pointMessage = loadImage ( "TTCKioskImages/SubwayMap/TTC.png" ) ;
}

/********************* Main Screen Background START **************************/
void drawSubwaySystemStatusMapBackground( Zone zone )
{
  fill( #000000 ) ;
  generalBackground.resize(zone.width, zone.height);
  image (generalBackground , 0, 0) ;
}

void pickDrawSubwaySystemStatusMapBackground ( Zone zone )
{
  rect(0, 0, zone.width, zone.height);
}

void touchSubwaySystemStatusMapBackground ( Zone zone ) 
{

}
/********************** Main Screen Background End *************************/

/********************* Main Screen Background START **************************/
void drawSubwaySystemStatusMapMap ( Zone zone )
{
  fill( #000000 ) ;
  mapWithPoint.resize(zone.width, zone.height);
  image (mapWithPoint , 0, 768/2-335) ;
}

void pickDrawSubwaySystemStatusMapMap ( Zone zone )
{
  rect(0, 768/2-335, zone.width, zone.height);
}

void touchSubwaySystemStatusMapMap ( Zone zone ) 
{
  zone.drag() ;
  zone.pinch();
}

void touchDownSubwaySystemStatusMapMap ( Zone zone ) 
{
  if ( serviceClicked ) 
  {
     serviceClicked = false ;
  }
}
/********************** Main Screen Background End *************************/

/********************* Main Screen Background START **************************/
void drawSubwaySystemStatusMapMessage( Zone zone )
{
  if ( serviceClicked ) 
  {
    pointMessage.resize(zone.width, zone.height);
    image (pointMessage , 1024-568, 768/2-155) ;
  }
}

void pickDrawSubwaySystemStatusMapMessage ( Zone zone )
{
  rect(1024-568, 768/2-155, zone.width, zone.height);
}

void touchSubwaySystemStatusMapMessage ( Zone zone ) 
{
  serviceClicked = true ;
}

/********************** Main Screen Background End *************************/

/********************* Bus System Status Map START **************************/
void drawSubwaySystemStatusMapExit( Zone zone )
{
  fill( #000000 ) ;
  generalExit.resize(zone.width, zone.height);
  image (generalExit , 1024-200, 768/2-440) ;
}

void pickDrawSubwaySystemStatusMapExit ( Zone zone )
{
  rect(1024-200, 768/2-440, zone.width, zone.height);
}

void touchSubwaySystemStatusMapExit ( Zone zone ) 
{
  Zone temp = SMT.get("MainScreenBackground");
  SMT.clearZones ();
  SMT.add(temp);
}
/********************** Bus System Status Map End ***************************/
