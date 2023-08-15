using Entity;
using Entity.Interfaces;
using System;
using Xunit;

namespace CalcXUnitTests
{
    public class UnitTest1
    {
        [Fact]
        public void TestCircle1()
        {
            IFigure circle = new Circle(5);
            Console.WriteLine(circle is Circle);
            Console.WriteLine(circle);
            Console.WriteLine(circle.IsValid());
            Console.WriteLine(circle.Area);


            Assert.NotNull(circle);
            Assert.True(circle is Circle);
            Assert.Equal(25*Math.PI, circle.Area);
            Assert.True(circle.IsValid());
        }

        [Fact]
        public void TestTriangle1()
        {
            IFigure t = new Triangle(3, 4, 5);
            Console.WriteLine(t is Triangle);
            Console.WriteLine(t);
            Console.WriteLine(t.IsValid());
            Triangle tt = t as Triangle;
            Console.WriteLine(tt.IsRightTriangle());

            Assert.NotNull(t);
            Assert.True(t is Triangle);
            Assert.Equal(6, t.Area);
            Assert.True(t.IsValid());

            Assert.True(tt.IsRightTriangle());
        }
    }
}
