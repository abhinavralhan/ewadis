class Example
{ 
    Example() // Non-parameterized constructor
    {
        this(1);  // Calling of constructor
        System.out.println("0-arg-cons");
    }
    Example(int a) // Parameterized constructor
    {
        System.out.println("1-arg-cons");
    }
}
public static void main(String[] args)
{
  Example e = new Example();
}