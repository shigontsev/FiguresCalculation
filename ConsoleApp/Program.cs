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

            //Круг
            IFigure circle = new Circle(5);
            Console.WriteLine(circle is Circle);
            Console.WriteLine(circle);
            Console.WriteLine(circle.IsValid());
            Console.WriteLine(circle.Area);

            //Треугольник
            IFigure t = new Triangle(3,4,5);
            Console.WriteLine(t is Triangle);
            Console.WriteLine(t);
            Console.WriteLine(t.IsValid());
            Triangle tt = t as Triangle;
            Console.WriteLine(tt.IsRightTriangle());

            Console.ReadLine();
        }
    }
}
