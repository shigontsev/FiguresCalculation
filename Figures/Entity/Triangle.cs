using Entity.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Triangle : Figure
    {
        public double A { get; set; }

        public double B { get; set; }

        public double C { get; set; }

        public Triangle(double a, double b, double c) : this(a, b, c, new Point())
        {

        }
        public Triangle(double a, double b, double c, Point position) : base(position)
        {
            A = a;
            B = b;
            C = c;
        }

        public override bool IsValid()
        {
            return (A + B > C && A + C > B && B + C > A);
        }

        public bool IsRightTriangle()
        {
            if (Math.Pow(A, 2) != Math.Pow(B, 2) + Math.Pow(C, 2))
                if (Math.Pow(B, 2) != Math.Pow(A, 2) + Math.Pow(C, 2))
                    if (Math.Pow(C, 2) != Math.Pow(A, 2) + Math.Pow(B, 2))
                        return false;
            return true;
        }

        public override double Length => A + B + C;

        private double LengthHalf => Length / 2;

        //Формула Герона
        public override double Area =>
            Math.Sqrt(LengthHalf * (LengthHalf - A) * (LengthHalf - B) * (LengthHalf - C));

        public override string ToString()
        {
            return string.Join(Environment.NewLine, "Фигура: Треугольник",
                "Центр = " + Position,
                $"Со сторонами A={A}; B={B}; C={C}",
                "Периметр = " + Length,
                "Площадь = " + Area);
        }
    }
}
