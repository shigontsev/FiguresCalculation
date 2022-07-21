using Entity.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class Circle : Figure
    {
        private double radius;

        public double Radius
        {
            get
            {
                return radius;
            }
            set
            {
                if (value < 0)
                    radius = Math.Abs(value);
                else
                    radius = value;
            }
        }

        public Circle() : this(1)
        {
        }

        public Circle(double r) : this(r, new Point())
        {

        }

        public Circle(double r, Point position) : base(position)
        {
            Radius = r;
        }


        public override double Area => Math.PI * Math.Pow(radius, 2);

        public override double Length => 2 * Math.PI * radius;

        public override string ToString()
        {
            return string.Join(Environment.NewLine, "Фигура: Круг",
                "Центр = " + Position,
                "Радиус = " + Radius,
                "Длина = " + Length,
                "Площадь = " + Area);
        }
    }
}
