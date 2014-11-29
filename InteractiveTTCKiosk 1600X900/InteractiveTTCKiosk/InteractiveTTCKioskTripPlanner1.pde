import vialab.SMT.*;

/**
 * 
 */
void interactiveTTCKioskTripPlanner1Setup()
{
  // Create the zones for the images of each interaction
  imageZoneTripPlanner1Background      = new Zone ( "TripPlanner1Background" ) ;
  imageZoneTripPlanner1StatingLocation = new Zone ( "TripPlanner1StatingLocation" ) ;
  imageZoneTripPlanner1Destination     = new Zone ( "TripPlanner1Destination" ) ;
  imageZoneTripPlanner1ValidAddress    = new Zone ( "TripPlanner1ValidAddress" ) ;  
  imageZoneTripPlanner1Back            = new Zone ( "TripPlanner1Back" ) ; 
  imageZoneTripPlanner1Exit            = new Zone ( "TripPlanner1Exit" ) ; 
  keyboard                             = new SwipeKeyboard(); 
  
  // Build the main Screen Zones
  imageZoneTripPlanner1Background.setSize(displayWidth,displayHeight);
  SMT.add(imageZoneTripPlanner1Background);
  
  // Add the navigations as child zones of the main screen zone
  imageZoneTripPlanner1StatingLocation.setSize (Math.round(displayWidth/1.3), Math.round(displayHeight/5.50));
  imageZoneTripPlanner1Background.add(imageZoneTripPlanner1StatingLocation);
  
  imageZoneTripPlanner1Destination.setSize (Math.round(displayWidth/1.3), Math.round(displayHeight/5.50));
  imageZoneTripPlanner1Background.add(imageZoneTripPlanner1Destination);
  
  imageZoneTripPlanner1ValidAddress.setSize (Math.round(displayWidth/10.25), Math.round(displayHeight/5.50));
  imageZoneTripPlanner1Background.add(imageZoneTripPlanner1ValidAddress);
  
  imageZoneTripPlanner1Back.setSize (Math.round(displayWidth/14.5), Math.round(displayHeight/2));
  imageZoneTripPlanner1Background.add(imageZoneTripPlanner1Back);
  
  imageZoneTripPlanner1Exit.setSize (Math.round(displayWidth/14.25), Math.round(displayHeight/10.25));
  imageZoneTripPlanner1Background.add(imageZoneTripPlanner1Exit);
  
  keyboard.setLocation( displayWidth/2-575, displayHeight/2);
  keyboard.addKeyListener( this);
  keyboard.setVisible( false);
  keyboard.setPickable( false);
  POIKeyboard = false;
  
  imageZoneTripPlanner1Background.add(keyboard);
}

/**
 * 
 */
void interactiveTTCKioskTripPlanner1ImageLoader()
{
  tripPlannerStartingLocation = loadImage ( "TTCKioskImages/TripPlanner_1/2.jpg" ) ; 
  tripPlannerDestination      = loadImage ( "TTCKioskImages/TripPlanner_1/4.jpg" ) ;
  tripPlannerValidAddress     = loadImage ( "TTCKioskImages/TripPlanner_1/3.jpg" ) ;
}

/********************* Main Screen Background START **************************/
void drawTripPlanner1Background( Zone zone )
{
  fill( #000000 ) ;
  generalBackground.resize(zone.width, zone.height);
  image (generalBackground , 0, 0) ;
}

void pickDrawTripPlanner1Background ( Zone zone )
{
  rect(0, 0, zone.width, zone.height);
}

void touchTripPlanner1Background ( Zone zone ) 
{

}
/********************** Main Screen Background End *************************/

/********************* Handle Trip Planner START ***************************/
void drawTripPlanner1StatingLocation( Zone zone )
{
  fill( #000000 ) ;
  tripPlannerStartingLocation.resize(zone.width, zone.height);
  image (tripPlannerStartingLocation, displayWidth/2-620, displayHeight/2-300) ;
}

void pickDrawTripPlanner1StatingLocation ( Zone zone )
{
  rect(displayWidth/2-620, displayHeight/2-300, zone.width, zone.height);
}

void touchTripPlanner1StatingLocation ( Zone zone ) 
{

}
/********************** Handle Trip Planner End ***************************/

/********************** Point Of Interest START ***************************/
void drawTripPlanner1Destination( Zone zone )
{
  tripPlannerDestination.resize(zone.width, zone.height);
  image (tripPlannerDestination , displayWidth/2-620, displayHeight/2-125) ;
  fill ( 15, 220); // Color of the text
  textAlign( CENTER, CENTER); // Center the text
  textSize( 64);
  text( text, zone.width/2+200, zone.height+240);
}

void pickDrawTripPlanner1Destination ( Zone zone )
{
  rect(displayWidth/2-620, displayHeight/2-125, zone.width, zone.height);
}

void touchTripPlanner1Destination ( Zone zone ) 
{
  text = "";
  textBoxSelected = true;
  keyboard.setVisible( true);
  keyboard.setPickable( true);
}
/*********************** Point Of Interest  End ***************************/

/************************ Service Update START ****************************/
void drawTripPlanner1ValidAddress( Zone zone )
{
  fill( #000000 ) ;
  tripPlannerValidAddress.resize(zone.width, zone.height);
  image (tripPlannerValidAddress , displayWidth/2+630, displayHeight/2-125) ;
}

void pickDrawTripPlanner1ValidAddress ( Zone zone )
{
  rect(displayWidth/2+630, displayHeight/2-125, zone.width, zone.height);
}

void touchTripPlanner1ValidAddress ( Zone zone ) 
{

}
/************************ Service Update End ******************************/

/****************** Subway System Status Map START ************************/
void drawTripPlanner1Back( Zone zone )
{
  fill( #000000 ) ;
  generalBackSwipe.resize(zone.width, zone.height);
  image (generalBackSwipe , 0, displayHeight/2-225) ;
}

void pickDrawTripPlanner1Back ( Zone zone )
{
  rect(0, displayHeight/2-225, zone.width, zone.height);
}

void touchTripPlanner1Back ( Zone zone ) 
{
  Zone temp = SMT.get("MainScreenBackground");
  SMT.clearZones ();
  SMT.add(temp);
}
/******************** Subway System Status Map End *************************/

/********************* Bus System Status Map START **************************/
void drawTripPlanner1Exit( Zone zone )
{
  fill( #000000 ) ;
  generalExit.resize(zone.width, zone.height);
  image (generalExit , displayWidth-200, displayHeight/2-440) ;
}

void pickDrawTripPlanner1Exit ( Zone zone )
{
  rect(displayWidth-200, displayHeight/2-440, zone.width, zone.height);
}

void touchTripPlanner1Exit ( Zone zone ) 
{
  Zone temp = SMT.get("MainScreenBackground");
  SMT.clearZones ();
  SMT.add(temp);
}
/********************** Bus System Status Map End ***************************/
