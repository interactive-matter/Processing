public class KalmanFilter {
  
  private float q;
  private float r;
  private float x;
  private float p;
  private float k;
  
  public KalmanFilter(float q, float r, float p, float initial_value) {
    this.q=q;
    this.r=r;
    this.p=p;
    x=x;
  }
  
  public float addSample(float measurement) {
    //omit x=x
    p=p+q;
    k=p/(p+r);
    x= x + k*(measurement-x);
    p=(1-k)*p;
    return x;
  }
  
  public String toString() {
    return "KalmanFilter with p="+p+", k="+k;
  }
  
  public float getQ() {
    return q;
  }
  
  public float getR() {
    return r;
  }
  
  public float getP() {
    return p;
  }
  
  public float getK() {
    return k;
  }
}
