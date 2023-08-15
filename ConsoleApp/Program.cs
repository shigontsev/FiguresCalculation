using Entity;
using Entity.Interfaces;
using System;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            IFigure circle = new Circle(5);
            Console.WriteLine(circle);
            Console.WriteLine(circle.IsValid());

            Console.WriteLine(circle.Area);

            Triangle t = new Triangle(3,4,5);

            Console.WriteLine(t);
            Console.WriteLine(t.IsValid());
            Console.WriteLine(t.IsRightTriangle());

            Console.ReadLine();
        }
    }
}
