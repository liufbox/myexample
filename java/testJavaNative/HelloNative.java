public class HelloNative
 
{
 
  static
 
  {
 
    System.loadLibrary("HelloNative");
 
  }
 
    
  public static native void sayHello();
  
  
  public static native void hello(String message);
   
 
  @SuppressWarnings("static-access")
 
  public static void main(String[] args)
 
  {
 
    new HelloNative().sayHello();
	
	new HelloNative().hello("stoneliu");
 
  }
 
}
 