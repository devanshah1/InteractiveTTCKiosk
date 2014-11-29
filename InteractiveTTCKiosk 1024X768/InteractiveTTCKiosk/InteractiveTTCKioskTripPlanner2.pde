import vialab.SMT.*;

/**
 * 
 */
void interactiveTTCKioskTripPlanner2Setup()
{
  // Create the zones for the images of each interaction
  imageZoneTripPlanner2Background      = new Zone ( "TripPlanner2Background" ) ;
  imageZoneTripPlanner2RouteCheap      = new Zone ( "TripPlanner2RouteCheap" ) ;
  imageZoneTripPlanner2RouteFast       = new Zone ( "TripPlanner2RouteFast" ) ;
  imageZoneTripPlanner2RouteBest       = new Zone ( "TripPlanner2RouteBest" ) ;  
  imageZoneTripPlanner2Back            = new Zone ( "TripPlanner2Back" ) ; 
  imageZoneTripPlanner2Exit            = new Zone ( "TripPlanner2Exit" ) ; 
  
  // Build the main Screen Zones
  imageZoneTripPlanner2Background.setSize(1024,768);
  SMT.add(imageZoneTripPlanner2Background);
  
  // Add the navigations as child zones of the main screen zone
  imageZoneTripPlanner2RouteCheap.setSize (Math.round(1024/5), Math.round(768/1.50));
  imageZoneTripPlanner2Background.add(imageZoneTripPlanner2RouteCheap);
  
  imageZoneTripPlanner2RouteFast.setSize (Math.round(1024/5), Math.round(768/1.50));
  imageZoneTripPlanner2Background.add(imageZoneTripPlanner2RouteFast);
  
  imageZoneTripPlanner2RouteBest.setSize (Math.round(1024/5), Math.round(768/1.50));
  imageZoneTripPlanner2Background.add(imageZoneTripPlanner2RouteBest);
  
  imageZoneTripPlanner2Back.setSize (Math.round(1024/14.5), Math.round(768/2));
  imageZoneTripPlanner2Background.add(imageZoneTripPlanner2Back);
  
  imageZoneTripPlanner2Exit.setSize (Math.round(1024/14.25), Math.round(768/10.25));
  imageZoneTripPlanner2Background.add(imageZoneTripPlanner2Exit);
}

/**
 * 
 */
void interactiveTTCKioskTripPlanner2ImageLoader()
{
  tripPlanner2RouteCheap = loadImage ( "TTCKioskImages/TripPlanner_2/1.jpg" ) ; 
  tripPlanner2RouteFast  = loadImage ( "TTCKioskImages/TripPlanner_2/2.jpg" ) ;
  tripPlanner2RouteBest  = loadImage ( "TTCKioskImages/TripPlanner_2/3.jpg" ) ;
}

/********************* Main Screen Background START **************************/
void drawTripPlanner2Background( Zone zone )
{
  fill( #000000 ) ;
  generalBackground.resize(zone.width, zone.height);
  image (generalBackground , 0, 0) ;
}

void pickDrawTripPlanner2Background ( Zone zone )
{
  rect(0, 0, zone.width, zone.height);
}

void touchTripPlanner2Background ( Zone zone ) 
{
  
}
/********************** Main Screen Background End *************************/

/********************* Handle Trip Planner START ***************************/
void drawTripPlanner2RouteCheap( Zone zone )
{
  fill( #000000 ) ;
  tripPlanner2RouteCheap.resize(zone.width, zone.height);
  image (tripPlanner2RouteCheap, 1024/2-550, 768/2-300) ;
}

void pickDrawTripPlanner2RouteCheap ( Zone zone )
{
  rect(1024/2-550, 768/2-300, zone.width, zone.height);
}

void touchTripPlanner2RouteCheap ( Zone zone ) 
{
  interactiveTTCKioskTripPlanner3Setup();
  interactiveTTCKioskTripPlanner3ImageLoader();
}
/********************** Handle Trip Planner End ***************************/

/********************** Point Of Interest START ***************************/
void drawTripPlanner2RouteFast( Zone zone )
{
  tripPlanner2RouteFast.resize(zone.width, zone.height);
  image (tripPlanner2RouteFast , 1024/2-130, 768/2-300) ;
}

void pickDrawTripPlanner2RouteFast ( Zone zone )
{
  rect(1024/2-130, 768/2-300, zone.width, zone.height);
}

void touchTripPlanner2RouteFast ( Zone zone ) 
{
  interactiveTTCKioskTripPlanner3Setup();
  interactiveTTCKioskTripPlanner3ImageLoader();
}
/*********************** Point Of Interest  End ***************************/

/************************ Service Update START ****************************/
void drawTripPlanner2RouteBest( Zone zone )
{
  fill( #000000 ) ;
  tripPlanner2RouteBest.resize(zone.width, zone.height);
  image (tripPlanner2RouteBest , 1024/2+290, 768/2-300) ;
}

void pickDrawTripPlanner2RouteBest ( Zone zone )
{
  rect(1024/2+290, 768/2-300, zone.width, zone.height);
}

void touchTripPlanner2RouteBest ( Zone zone ) 
{
  interactiveTTCKioskTripPlanner3Setup();
  interactiveTTCKioskTripPlanner3ImageLoader();
}
/************************ Service Update End ******************************/

/****************** Subway System Status Map START ************************/
void drawTripPlanner2Back( Zone zone )
{
  fill( #000000 ) ;
  generalBackSwipe.resize(zone.width, zone.height);
  image (generalBackSwipe , 0, 768/2-225) ;
}

void pickDrawTripPlanner2Back ( Zone zone )
{
  rect(0, 768/2-225, zone.width, zone.height);
}

void touchTripPlanner2Back ( Zone zone ) 
{
  SMT.remove(imageZoneTripPlanner2Background);
  SMT.remove(imageZoneTripPlanner1Background);
  text = "Enter Destination";
  interactiveTTCKioskTripPlanner1Setup();
  interactiveTTCKioskTripPlanner1ImageLoader();
}
/******************** Subway System Status Map End *************************/

/********************* Bus System Status Map START **************************/
void drawTripPlanner2Exit( Zone zone )
{
  fill( #000000 ) ;
  generalExit.resize(zone.width, zone.height);
  image (generalExit , 1024-200, 768/2-440) ;
}

void pickDrawTripPlanner2Exit ( Zone zone )
{
  rect(1024-200, 768/2-440, zone.width, zone.height);
}

void touchTripPlanner2Exit ( Zone zone ) 
{
  Zone temp = SMT.get("MainScreenBackground");
  SMT.clearZones ();
  SMT.add(temp);
}
/********************** Bus System Status Map End ***************************/
