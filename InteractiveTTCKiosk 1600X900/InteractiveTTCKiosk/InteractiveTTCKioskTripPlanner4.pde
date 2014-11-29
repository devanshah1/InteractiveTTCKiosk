import vialab.SMT.*;

/**
 * 
 */
void interactiveTTCKioskTripPlanner4Setup()
{
  // Create the zones for the images of each interaction
  imageZoneTripPlanner4Background = new Zone ( "TripPlanner4Background" ) ;
  imageZoneTripPlanner4Map        = new Zone ( "TripPlanner4Map" ) ;
  imageZoneTripPlanner4List       = new Zone ( "TripPlanner4List" ) ;
  imageZoneTripPlanner4Back       = new Zone ( "TripPlanner4Back" ) ; 
  imageZoneTripPlanner4Exit       = new Zone ( "TripPlanner4Exit" ) ;
  
  // Build the main Screen Zones
  imageZoneTripPlanner4Background.setSize(displayWidth,displayHeight);
  SMT.add(imageZoneTripPlanner4Background);
  
  // Add the navigations as child zones of the main screen zone
  imageZoneTripPlanner4Map.setSize (Math.round(displayWidth/2.15), Math.round(displayHeight/1.35));
  imageZoneTripPlanner4Background.add(imageZoneTripPlanner4Map);
  
  imageZoneTripPlanner4List.setSize (Math.round(displayWidth/1.90), Math.round(displayHeight/1.35));
  imageZoneTripPlanner4Background.add(imageZoneTripPlanner4List);
  
  imageZoneTripPlanner4Back.setSize (Math.round(displayWidth/14.5), Math.round(displayHeight/2));
  imageZoneTripPlanner4Background.add(imageZoneTripPlanner4Back);
  
  imageZoneTripPlanner4Exit.setSize (Math.round(displayWidth/14.25), Math.round(displayHeight/10.25));
  imageZoneTripPlanner4Background.add(imageZoneTripPlanner4Exit);
}

/**
 * 
 */
void interactiveTTCKioskTripPlanner4ImageLoader()
{
  TripPlanner4Map  = loadImage ( "TTCKioskImages/TripPlanner_4/5.jpg" ) ; 
  TripPlanner4List = loadImage ( "TTCKioskImages/TripPlanner_4/4.jpg" ) ;
}

/********************* Main Screen Background START **************************/
void drawTripPlanner4Background( Zone zone )
{
  fill( #000000 ) ;
  generalBackground.resize(zone.width, zone.height);
  image (generalBackground , 0, 0) ;
}

void pickDrawTripPlanner4Background ( Zone zone )
{
  rect(0, 0, zone.width, zone.height);
}

void touchTripPlanner4Background ( Zone zone ) 
{

}
/********************** Main Screen Background End *************************/

/********************* Handle Trip Planner START ***************************/
void drawTripPlanner4Map( Zone zone )
{
  fill( #000000 ) ;
  TripPlanner4Map.resize(zone.width, zone.height);
  image (TripPlanner4Map, 0, displayHeight/2-335) ;
}

void pickDrawTripPlanner4Map ( Zone zone )
{
  rect(displayWidth/2-450, displayHeight/2-200, zone.width, zone.height);
}

void touchTripPlanner4Map ( Zone zone ) 
{
  zone.scale();
}
/********************** Handle Trip Planner End ***************************/

/********************** Point Of Interest START ***************************/
void drawTripPlanner4List( Zone zone )
{
  TripPlanner4List.resize(zone.width, zone.height);
  image (TripPlanner4List , displayWidth/2-50, displayHeight/2-335) ;
}

void pickDrawTripPlanner4List ( Zone zone )
{
  rect(displayWidth/2+100, displayHeight/2-200, zone.width, zone.height);
}

void touchTripPlanner4List ( Zone zone ) 
{

}
/*********************** Point Of Interest  End ***************************/

/****************** Subway System Status Map START ************************/
void drawTripPlanner4Back( Zone zone )
{
  fill( #000000 ) ;
  generalBackSwipe.resize(zone.width, zone.height);
  image (generalBackSwipe , 0, displayHeight/2-225) ;
}

void pickDrawTripPlanner4Back ( Zone zone )
{
  rect(0, displayHeight/2-225, zone.width, zone.height);
}

void touchTripPlanner4Back ( Zone zone ) 
{
  SMT.remove(imageZoneTripPlanner4Background);
  SMT.remove(imageZoneTripPlanner3Background);
  interactiveTTCKioskTripPlanner3Setup();
  interactiveTTCKioskTripPlanner3ImageLoader();
}
/******************** Subway System Status Map End *************************/

/********************* Bus System Status Map START **************************/
void drawTripPlanner4Exit( Zone zone )
{
  fill( #000000 ) ;
  generalExit.resize(zone.width, zone.height);
  image (generalExit , displayWidth-200, displayHeight/2-440) ;
}

void pickDrawTripPlanner4Exit ( Zone zone )
{
  rect(displayWidth-200, displayHeight/2-440, zone.width, zone.height);
}

void touchTripPlanner4Exit ( Zone zone ) 
{
  Zone temp = SMT.get("MainScreenBackground");
  SMT.clearZones ();
  SMT.add(temp);
}
/********************** Bus System Status Map End ***************************/
