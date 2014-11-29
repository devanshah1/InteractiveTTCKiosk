import vialab.SMT.*;


/********* All Image Declerations **********/
// General Images
PImage generalBackground;
PImage generalExit;
PImage generalBackSwipe;

// Main Screen Images
PImage mainScreenTripPlanner;
PImage mainScreenPointOfInterest;
PImage mainScreenServiceUpdate;
PImage mainScreenSubwaySystemStatusMap;
PImage mainScreenBusSystemStatusMap;
PImage mainScreenStationMapAndInformation;

// Trip Planner 1 Images
PImage tripPlannerStartingLocation; 
PImage tripPlannerDestination;
PImage tripPlannerValidAddress;

// Trip Planner 2 Images
PImage tripPlanner2RouteCheap; 
PImage tripPlanner2RouteFast;
PImage tripPlanner2RouteBest;

// Trip Planner 3 Images
PImage TripPlanner3TurnByTurn; 
PImage TripPlanner3Print;

// Trip Planner 4 Images
PImage TripPlanner4Map; 
PImage TripPlanner4List;

// Print Images
PImage Print;

// Subway System Status Map Images
PImage mapWithPoint;
PImage pointMessage;

// Point of Intrest 1 & 2 & 3 Images
PImage pointOfInterestMap;
PImage searchPOI;
PImage pointOfInterestMapResturents;
PImage pointOfInterestMessage;
PImage pointOfInterestDirection;

/********* All Image Zone Declerations **********/
// General Image Zones
Zone imageZoneGeneralBackground;
Zone imageZoneGeneralExit;
Zone imageZoneGeneralSwipeBack;

// Main Screen Image Zones
Zone imageZoneMainScreenBackground;
Zone imageZoneMainScreenTripPlanner;
Zone imageZoneMainScreenPointOfInterest;
Zone imageZoneMainScreenServiceUpdate;  
Zone imageZoneMainScreenSubwaySystemStatusMap; 
Zone imageZoneMainScreenBusSystemStatusMap; 
Zone imageZoneMainScreenStationMapAndInformation;

// Trip Planner 1 Screen Image Zones
Zone imageZoneTripPlanner1Background;
Zone imageZoneTripPlanner1StatingLocation;
Zone imageZoneTripPlanner1Destination;
Zone imageZoneTripPlanner1ValidAddress;  
Zone imageZoneTripPlanner1Back; 
Zone imageZoneTripPlanner1Exit; 

// Trip Planner 2 Screen Image Zones
Zone imageZoneTripPlanner2Background;
Zone imageZoneTripPlanner2RouteCheap;
Zone imageZoneTripPlanner2RouteFast;
Zone imageZoneTripPlanner2RouteBest;  
Zone imageZoneTripPlanner2Back; 
Zone imageZoneTripPlanner2Exit; 

// Trip Planner 3 Screen Image Zones
Zone imageZoneTripPlanner3Background;
Zone imageZoneTripPlanner3TurnByTurn;
Zone imageZoneTripPlanner3Print;
Zone imageZoneTripPlanner3Back; 
Zone imageZoneTripPlanner3Exit; 

// Trip Planner 4 Screen Image Zones
Zone imageZoneTripPlanner4Background;
Zone imageZoneTripPlanner4Map;
Zone imageZoneTripPlanner4List;
Zone imageZoneTripPlanner4Back; 
Zone imageZoneTripPlanner4Exit; 

// Print Image Zones
Zone imageZonePrintBackground;
Zone imageZonePrintExit;

// Subway System Status Map Zones
Zone imageZoneSubwaySystemStatusMapBackground;
Zone imageZoneSubwaySystemStatusMapMap;
Zone imageZoneSubwaySystemStatusMapMessage;
Zone imageZoneSubwaySystemStatusMapExit;

// Point of interest 1 & 2 & 3 Zones
Zone imageZonePointOfInterest1Background;
Zone imageZonePointOfInterest1Map;
Zone imageZonePointOfInterest1Search;
Zone imageZonePointOfInterest1Exit;
Zone imageZonePointOfInterestMessage;
Zone imageZonePointOfInterestDirection;

// General variables
SwipeKeyboard keyboard;
boolean textBoxSelected = false;
String text             = "Enter Destination";
Boolean serviceClicked  = false;
boolean POIKeyboard     = false;
boolean POISearchEnter  = false;
boolean POIClicked      = false;

// Setup function for the applet
void setup()
{ 
  // Set up screen size and render the application
  size(displayWidth, displayHeight, SMT.RENDERER);
  System.out.println(displayWidth + "," + displayHeight);
  
  // Initilize the SMT with automaticlly detecting touch source
  SMT.init(this, TouchSource.AUTOMATIC);
  
  // Load the main screen
  interactiveTTCKioskGeneralImageLoader();
  interactiveTTCKioskMainScreenSetup();
  interactiveTTCKioskMainScreenImageLoader();
}

// Draw function for the sketch
void draw()
{
  background( 30);
}

// Handle the keyboard input
void keyPressed()
{
  if ( textBoxSelected ) 
  {
    switch( key )
    {
      case '\b': //backspace
        if( ! text.isEmpty() )
          text = text.substring(0, text.length() - 1);
        break;
      case '\n': //enter
        if( text.isEmpty()) break;
        keyboard.setVisible( false);
        keyboard.setPickable( false);
        textBoxSelected = false;
        
        if ( POIKeyboard ) {
          POISearchEnter = true ;
        }
        else {
          text = "" ;
          interactiveTTCKioskTripPlanner2Setup();
          interactiveTTCKioskTripPlanner2ImageLoader();
        }
        break;
      case (char) 65535: //unknown keys
        break;
      default: //any other keys
        text += key;
    }
  }
}
