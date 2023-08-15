using Entity.Interfaces;
using System;

namespace Entity
{
    public abstract class Figure : IFigure
    {
        public Point Position { get; set; }
        public abstract double Area { get; }
        public abstract double Length { get; }

        public Figure() : this(new Point())
        {

        }

        public Figure(Point position)
        {
            Position = position;
        }

        public abstract bool IsValid();
    }
}
