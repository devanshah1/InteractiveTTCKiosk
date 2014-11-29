import vialab.SMT.*;

/**
 * 
 */
void interactiveTTCKioskPointOfInterest1Setup()
{
  // Create the zones for the images of each interaction
  imageZonePointOfInterest1Background = new Zone ( "PointOfInterest1Background" ) ;
  imageZonePointOfInterest1Map        = new Zone ( "PointOfInterest1Map" ) ;
  imageZonePointOfInterest1Search     = new Zone ( "PointOfInterest1Search" ) ;
  imageZonePointOfInterest1Exit       = new Zone ( "PointOfInterest1Exit" ) ;
  imageZonePointOfInterestMessage     = new Zone ( "PointOfInterestMessage" ) ;
  imageZonePointOfInterestDirection   = new Zone ( "PointOfInterestDirection" ) ;
  keyboard                            = new SwipeKeyboard();
    
  // Build the main Screen Zones
  imageZonePointOfInterest1Background.setSize(1024,768);
  SMT.add(imageZonePointOfInterest1Background);
  
  // Add the navigations as child zones of the main screen zone
  imageZonePointOfInterest1Map.setSize (Math.round(1024), Math.round(768/1.35));
  imageZonePointOfInterest1Background.add(imageZonePointOfInterest1Map);
  
  imageZonePointOfInterest1Search.setSize (Math.round(1024/1.3), Math.round(768/5.50));
  imageZonePointOfInterest1Background.add(imageZonePointOfInterest1Search);
  
  imageZonePointOfInterest1Exit.setSize (Math.round(1024/14.25), Math.round(768/10.25));
  imageZonePointOfInterest1Background.add(imageZonePointOfInterest1Exit);
  
  imageZonePointOfInterestMessage.setSize (Math.round(1024/5.25), Math.round(768/5.25));
  imageZonePointOfInterest1Map.add(imageZonePointOfInterestMessage);
  
  imageZonePointOfInterestDirection.setSize (Math.round(1024/8.25), Math.round(768/32.25));
  imageZonePointOfInterestMessage.add(imageZonePointOfInterestDirection);
  
  keyboard.setLocation( 1024/2-575, 768/2-125);
  keyboard.addKeyListener( this);
  keyboard.setVisible( false);
  keyboard.setPickable( false);
  text = "Search POI";
  POIKeyboard = true;
  
  imageZonePointOfInterest1Background.add(keyboard);
}

/**
 * 
 */
void interactiveTTCKioskPointOfInterest1ImageLoader()
{
  pointOfInterestMap           = loadImage ( "TTCKioskImages/POI_1/4.jpg" ) ;
  searchPOI                    = loadImage ( "TTCKioskImages/POI_1/2.jpg" ) ;
  pointOfInterestMapResturents = loadImage ( "TTCKioskImages/POI_2/5.jpg" ) ;
  pointOfInterestMessage       = loadImage ( "TTCKioskImages/POI_3/TTC.png" ) ;
  pointOfInterestDirection     = loadImage ( "TTCKioskImages/POI_3/5.jpg" ) ;
}

/********************* Main Screen Background START **************************/
void drawPointOfInterest1Background( Zone zone )
{
  fill( #000000 ) ;
  generalBackground.resize(zone.width, zone.height);
  image (generalBackground , 0, 0) ;
}

void pickDrawPointOfInterest1Background ( Zone zone )
{
  rect(0, 0, zone.width, zone.height);
}

void touchPointOfInterest1Background ( Zone zone ) 
{

}
/********************** Main Screen Background End *************************/

/********************* Main Screen Background START **************************/
void drawPointOfInterest1Map ( Zone zone )
{
  fill( #000000 ) ;
  
  if ( POISearchEnter ) {
    pointOfInterestMapResturents.resize(zone.width, zone.height);
    image (pointOfInterestMapResturents , 0, 768/2-335) ;
  }
  else {
    pointOfInterestMap.resize(zone.width, zone.height);
    image (pointOfInterestMap , 0, 768/2-335) ;
  }
}

void pickDrawPointOfInterest1Map ( Zone zone )
{
  rect(0, 768/2-335, zone.width, zone.height);
}

void touchPointOfInterest1Map ( Zone zone ) 
{
  zone.drag() ;
  zone.pinch();
}

void touchDownPointOfInterest1Map ( Zone zone ) 
{
  if ( POIClicked ) 
  {
     POIClicked = false ;
  }
}
/********************** Main Screen Background End *************************/

/********************* Main Screen Background START **************************/
void drawPointOfInterest1Search( Zone zone )
{
  searchPOI.resize(zone.width, zone.height);
  image (searchPOI , 1024/2-620, 768/2-300) ;
  fill ( 15, 220); // Color of the text
  textAlign( CENTER, CENTER); // Center the text
  textSize( 64);
  text( text, zone.width/2+200, zone.height+60);
}

void pickDrawPointOfInterest1Search ( Zone zone )
{
  rect(1024/2-620, 768/2-300, zone.width, zone.height);
}

void touchPointOfInterest1Search ( Zone zone ) 
{
  text = "";
  textBoxSelected = true;
  keyboard.setVisible( true);
  keyboard.setPickable( true);
}

/********************** Main Screen Background End *************************/

/********************* Bus System Status Map START **************************/
void drawPointOfInterest1Exit( Zone zone )
{
  fill( #000000 ) ;
  generalExit.resize(zone.width, zone.height);
  image (generalExit , 1024-200, 768/2-440) ;
}

void pickDrawPointOfInterest1Exit ( Zone zone )
{
  rect(1024-200, 768/2-440, zone.width, zone.height);
}

void touchPointOfInterest1Exit ( Zone zone ) 
{
  POISearchEnter  = false;
  Zone temp = SMT.get("MainScreenBackground");
  SMT.clearZones ();
  SMT.add(temp);
}
/********************** Bus System Status Map End ***************************/

/********************* Bus System Status Map START **************************/
void drawPointOfInterestMessage( Zone zone )
{
  fill( #000000 ) ;
  
  if (POISearchEnter)
  {
    if ( POIClicked ) 
    {
      pointOfInterestMessage.resize(zone.width, zone.height);
      image (pointOfInterestMessage , 1024/2-750, 768/2+25) ;
    }
  }
}

void pickDrawPointOfInterestMessage ( Zone zone )
{
  if (POISearchEnter) 
  {  
    rect( 1024/2-750, 768/2+25, zone.width, zone.height);
  }
}

void touchPointOfInterestMessage ( Zone zone ) 
{
  POIClicked = true ;
}
/********************** Bus System Status Map End ***************************/

/********************* Bus System Status Map START **************************/
void drawPointOfInterestDirection( Zone zone )
{
  fill( #000000 ) ;
  
  if (POISearchEnter) 
  { 
    if ( POIClicked ) 
    { 
      pointOfInterestDirection.resize(zone.width, zone.height);
      image (pointOfInterestDirection ,  1024/2-700, 768/2+90) ;
    }
  }
}

void pickDrawPointOfInterestDirection ( Zone zone )
{
  if (POISearchEnter) 
  {  
    if ( POIClicked ) 
    {
      rect( 1024/2-700, 768/2+90, zone.width, zone.height);
    }
  }
}

void touchPointOfInterestDirection ( Zone zone ) 
{
  interactiveTTCKioskTripPlanner3Setup();
  interactiveTTCKioskTripPlanner3ImageLoader();
}
/********************** Bus System Status Map End ***************************/
