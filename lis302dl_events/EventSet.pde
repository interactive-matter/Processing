public class EventSet {

  int maxSamples = 0;
  int numEvents = 0;

  boolean[][] events = null;
  String [] eventNames = null;

  int samplePosition = 0;

  public EventSet (int numberOfSamples, String[] eventNames) {
    numEvents=eventNames.length;
    events = new boolean[numberOfSamples][numEvents];
    this.eventNames = eventNames;
    maxSamples = numberOfSamples;
  }

  public void addEvents(boolean[] eventValues) {
    for (int i =0; (i<eventNames.length) && (i<eventValues.length); i++) {
      events[samplePosition][i]=eventValues[i];
    }
    //increase sample position
    samplePosition++;
    if (samplePosition==maxSamples) {
      samplePosition = 0;
    }
  }
  
  public int getNumberOfEvents() {
    return numEvents;
  }
  
  public String getEventName(int i) {
    return eventNames[i];
  }
  
  public boolean getEventValue(int position, int eventNumber) {
    return events[position][eventNumber];
  }
}  


