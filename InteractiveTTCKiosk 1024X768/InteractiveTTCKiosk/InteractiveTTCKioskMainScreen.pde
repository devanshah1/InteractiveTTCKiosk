import vialab.SMT.*;

/**
 * This is the setup function for the main screen
 */
void interactiveTTCKioskMainScreenSetup()
{
  // Create the zones for the images of each interaction
  imageZoneMainScreenBackground               = new Zone ( "MainScreenBackground" ) ;
  imageZoneMainScreenTripPlanner              = new Zone ( "MainScreenTripPlanner" ) ;
  imageZoneMainScreenPointOfInterest          = new Zone ( "MainScreenPointOfInterest" ) ;
  imageZoneMainScreenServiceUpdate            = new Zone ( "MainScreenServiceUpdate" ) ;  
  imageZoneMainScreenSubwaySystemStatusMap    = new Zone ( "MainScreenSubwaySystemStatusMap" ) ; 
  imageZoneMainScreenBusSystemStatusMap       = new Zone ( "MainScreenBusSystemStatusMap" ) ; 
  imageZoneMainScreenStationMapAndInformation = new Zone ( "MainScreenStationMapAndInformation" ) ; 
  
  // Build the main Screen Zones 
  imageZoneMainScreenBackground.setSize(1024,768);
  imageZoneMainScreenBackground.setLocation(0,0);
  SMT.add(imageZoneMainScreenBackground);
  
  // Add the navigations as child zones of the main screen zone
  imageZoneMainScreenTripPlanner.setSize (Math.round(1024/6.25), Math.round(768/3.50));
  imageZoneMainScreenBackground.add(imageZoneMainScreenTripPlanner);
  
  imageZoneMainScreenPointOfInterest.setSize (Math.round(1024/6.25), Math.round(768/3.50));
  imageZoneMainScreenBackground.add(imageZoneMainScreenPointOfInterest);
  
  imageZoneMainScreenServiceUpdate.setSize (Math.round(1024/6.25), Math.round(768/3.50));
  imageZoneMainScreenBackground.add(imageZoneMainScreenServiceUpdate);
  
  imageZoneMainScreenSubwaySystemStatusMap.setSize (Math.round(1024/6.25), Math.round(768/3.50));
  imageZoneMainScreenBackground.add(imageZoneMainScreenSubwaySystemStatusMap);
  
  imageZoneMainScreenBusSystemStatusMap.setSize (Math.round(1024/6.25), Math.round(768/3.50));
  imageZoneMainScreenBackground.add(imageZoneMainScreenBusSystemStatusMap);
  
  imageZoneMainScreenStationMapAndInformation.setSize (Math.round(1024/6.25), Math.round(768/3.50));
  imageZoneMainScreenBackground.add(imageZoneMainScreenStationMapAndInformation);
}

/**
 * function to load all the images needed by the main screen
 */
void interactiveTTCKioskMainScreenImageLoader()
{
  mainScreenTripPlanner              = loadImage ( "TTCKioskImages/MainScreen/1.jpg" ) ; 
  mainScreenPointOfInterest          = loadImage ( "TTCKioskImages/MainScreen/2.jpg" ) ;
  mainScreenServiceUpdate            = loadImage ( "TTCKioskImages/MainScreen/3.jpg" ) ;
  mainScreenSubwaySystemStatusMap    = loadImage ( "TTCKioskImages/MainScreen/4.jpg" ) ;
  mainScreenBusSystemStatusMap       = loadImage ( "TTCKioskImages/MainScreen/5.jpg" ) ;
  mainScreenStationMapAndInformation = loadImage ( "TTCKioskImages/MainScreen/6.jpg" ) ;
}

/********************* Main Screen Background START **************************/
void drawMainScreenBackground( Zone zone )
{
  fill( #000000 ) ;
  generalBackground.resize(zone.width, zone.height);
  image (generalBackground , 0, 0) ;
}

void pickDrawMainScreenBackground ( Zone zone )
{
  rect(0, 0, zone.getX(), zone.getY());
}

void touchMainScreenBackground ( Zone zone ) 
{

}
/********************** Main Screen Background End *************************/

/********************* Handle Trip Planner START ***************************/
void drawMainScreenTripPlanner( Zone zone )
{
  fill( #000000 ) ;
  mainScreenTripPlanner.resize(zone.width, zone.height);
  image (mainScreenTripPlanner, 1024/2-780, 768/2-275) ;
}

void pickDrawMainScreenTripPlanner ( Zone zone )
{
  rect(1024/2-780, 768/2-275, zone.width, zone.height);
}

void touchMainScreenTripPlanner ( Zone zone ) 
{
  interactiveTTCKioskTripPlanner1Setup();
  interactiveTTCKioskTripPlanner1ImageLoader();
}
/********************** Handle Trip Planner End ***************************/

/********************** Point Of Interest START ***************************/
void drawMainScreenPointOfInterest( Zone zone )
{
  fill( #000000 ) ;
  mainScreenPointOfInterest.resize(zone.width, zone.height);
  image (mainScreenPointOfInterest , 1024/2-120, 768/2-275) ;
}

void pickDrawMainScreenPointOfInterest ( Zone zone )
{
  rect(1024/2-120, 768/2-275, zone.width, zone.height);
}

void touchMainScreenPointOfInterest ( Zone zone ) 
{
  interactiveTTCKioskPointOfInterest1Setup();
  interactiveTTCKioskPointOfInterest1ImageLoader();
}
/*********************** Point Of Interest  End ***************************/

/************************ Service Update START ****************************/
void drawMainScreenServiceUpdate( Zone zone )
{
  fill( #000000 ) ;
  mainScreenServiceUpdate.resize(zone.width, zone.height);
  image (mainScreenServiceUpdate , 1024/2+520, 768/2-275) ;
}

void pickDrawMainScreenServiceUpdate ( Zone zone )
{
  rect(1024/2+520, 768/2-275, zone.width, zone.height);
}

void touchMainScreenServiceUpdate ( Zone zone ) 
{

}
/************************ Service Update End ******************************/

/****************** Subway System Status Map START ************************/
void drawMainScreenSubwaySystemStatusMap( Zone zone )
{
  fill( #000000 ) ;
  mainScreenSubwaySystemStatusMap.resize(zone.width, zone.height);
  image (mainScreenSubwaySystemStatusMap , 1024/2-780, 768/2+50) ;
}

void pickDrawMainScreenSubwaySystemStatusMap ( Zone zone )
{
  rect(1024/2-780, 768/2+50, zone.width, zone.height);
}

void touchMainScreenSubwaySystemStatusMap ( Zone zone ) 
{
  interactiveTTCKioskSubwaySystemStatusMapSetup();
  interactiveTTCKioskSubwaySystemStatusMapImageLoader();
}
/******************** Subway System Status Map End *************************/

/********************* Bus System Status Map START **************************/
void drawMainScreenBusSystemStatusMap( Zone zone )
{
  fill( #000000 ) ;
  mainScreenBusSystemStatusMap.resize(zone.width, zone.height);
  image (mainScreenBusSystemStatusMap , 1024/2-120, 768/2+50) ;
}

void pickDrawMainScreenBusSystemStatusMap ( Zone zone )
{
  rect(1024/2-120, 768/2+50, zone.width, zone.height);
}

void touchMainScreenBusSystemStatusMap ( Zone zone ) 
{

}
/********************** Bus System Status Map End ***************************/

/****************** Station Map and Information START ***********************/
void drawMainScreenStationMapAndInformation( Zone zone )
{
  fill( #000000 ) ;
  mainScreenStationMapAndInformation.resize(zone.width, zone.height);
  image (mainScreenStationMapAndInformation , 1024/2+520, 768/2+50) ;
}

void pickDrawMainScreenStationMapAndInformation ( Zone zone )
{
  rect(1024/2+520, 768/2+100, zone.width, zone.height);
}

void touchMainScreenStationMapAndInformation ( Zone zone ) 
{

}
/****************** Station Map and Information End ***********************/
