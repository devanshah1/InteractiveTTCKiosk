import vialab.SMT.*;

/**
 * 
 */
void interactiveTTCKioskTripPlanner3Setup()
{
  // Create the zones for the images of each interaction
  imageZoneTripPlanner3Background      = new Zone ( "TripPlanner3Background" ) ;
  imageZoneTripPlanner3TurnByTurn      = new Zone ( "TripPlanner3TurnByTurn" ) ;
  imageZoneTripPlanner3Print           = new Zone ( "TripPlanner3Print" ) ;
  imageZoneTripPlanner3Back            = new Zone ( "TripPlanner3Back" ) ; 
  imageZoneTripPlanner3Exit            = new Zone ( "TripPlanner3Exit" ) ; 
  
  // Build the main Screen Zones
  imageZoneTripPlanner3Background.setSize(displayWidth,displayHeight);
  SMT.add(imageZoneTripPlanner3Background);
  
  // Add the navigations as child zones of the main screen zone
  imageZoneTripPlanner3TurnByTurn.setSize (Math.round(displayWidth/3.5), Math.round(displayHeight/2));
  imageZoneTripPlanner3Background.add(imageZoneTripPlanner3TurnByTurn);
  
  imageZoneTripPlanner3Print.setSize (Math.round(displayWidth/3.5), Math.round(displayHeight/2));
  imageZoneTripPlanner3Background.add(imageZoneTripPlanner3Print);
  
  imageZoneTripPlanner3Back.setSize (Math.round(displayWidth/14.5), Math.round(displayHeight/2));
  imageZoneTripPlanner3Background.add(imageZoneTripPlanner3Back);
  
  imageZoneTripPlanner3Exit.setSize (Math.round(displayWidth/14.25), Math.round(displayHeight/10.25));
  imageZoneTripPlanner3Background.add(imageZoneTripPlanner3Exit);
}

/**
 * 
 */
void interactiveTTCKioskTripPlanner3ImageLoader()
{
  TripPlanner3TurnByTurn = loadImage ( "TTCKioskImages/TripPlanner_3/1.jpg" ) ; 
  TripPlanner3Print      = loadImage ( "TTCKioskImages/TripPlanner_3/TTC.jpg" ) ;
}

/********************* Main Screen Background START **************************/
void drawTripPlanner3Background( Zone zone )
{
  fill( #000000 ) ;
  generalBackground.resize(zone.width, zone.height);
  image (generalBackground , 0, 0) ;
}

void pickDrawTripPlanner3Background ( Zone zone )
{
  rect(0, 0, zone.width, zone.height);
}

void touchTripPlanner3Background ( Zone zone ) 
{

}
/********************** Main Screen Background End *************************/

/********************* Handle Trip Planner START ***************************/
void drawTripPlanner3TurnByTurn( Zone zone )
{
  fill( #000000 ) ;
  TripPlanner3TurnByTurn.resize(zone.width, zone.height);
  image (TripPlanner3TurnByTurn, displayWidth/2-450, displayHeight/2-200) ;
}

void pickDrawTripPlanner3TurnByTurn ( Zone zone )
{
  rect(displayWidth/2-450, displayHeight/2-200, zone.width, zone.height);
}

void touchTripPlanner3TurnByTurn ( Zone zone ) 
{
  interactiveTTCKioskTripPlanner4Setup();
  interactiveTTCKioskTripPlanner4ImageLoader();
}
/********************** Handle Trip Planner End ***************************/

/********************** Point Of Interest START ***************************/
void drawTripPlanner3Print( Zone zone )
{
  TripPlanner3Print.resize(zone.width, zone.height);
  image (TripPlanner3Print , displayWidth/2+100, displayHeight/2-200) ;
}

void pickDrawTripPlanner3Print ( Zone zone )
{
  rect(displayWidth/2+100, displayHeight/2-200, zone.width, zone.height);
}

void touchTripPlanner3Print ( Zone zone ) 
{
  interactiveTTCKioskPrintSetup();
  interactiveTTCKioskPrintImageLoader();
}
/*********************** Point Of Interest  End ***************************/

/****************** Subway System Status Map START ************************/
void drawTripPlanner3Back( Zone zone )
{
  fill( #000000 ) ;
  generalBackSwipe.resize(zone.width, zone.height);
  image (generalBackSwipe , 0, displayHeight/2-225) ;
}

void pickDrawTripPlanner3Back ( Zone zone )
{
  rect(0, displayHeight/2-225, zone.width, zone.height);
}

void touchTripPlanner3Back ( Zone zone ) 
{
  if (POIClicked) 
  {
    SMT.remove(imageZoneTripPlanner3Background);
    SMT.remove(imageZonePointOfInterest1Background);
    interactiveTTCKioskPointOfInterest1Setup();
    interactiveTTCKioskPointOfInterest1ImageLoader();
  }
  else {
    SMT.remove(imageZoneTripPlanner3Background);
    SMT.remove(imageZoneTripPlanner2Background);
    interactiveTTCKioskTripPlanner2Setup();
    interactiveTTCKioskTripPlanner2ImageLoader();
  }
}
/******************** Subway System Status Map End *************************/

/********************* Bus System Status Map START **************************/
void drawTripPlanner3Exit( Zone zone )
{
  fill( #000000 ) ;
  generalExit.resize(zone.width, zone.height);
  image (generalExit , displayWidth-200, displayHeight/2-440) ;
}

void pickDrawTripPlanner3Exit ( Zone zone )
{
  rect(displayWidth-200, displayHeight/2-440, zone.width, zone.height);
}

void touchTripPlanner3Exit ( Zone zone ) 
{
  Zone temp = SMT.get("MainScreenBackground");
  SMT.clearZones ();
  SMT.add(temp);
}
/********************** Bus System Status Map End ***************************/
