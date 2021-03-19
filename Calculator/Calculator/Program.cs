using System;

namespace Calculator
{
    class Calculator
    {
        public static double DoOperation(double number1, double number2, string op)
        {
            double result = double.NaN;
            switch (op)
            {
                case "a":
                    result = number1 + number2;
                    break;
                case "s":
                    result = number1 - number2;
                    break;
                case "m":
                    result = number1 * number2;
                    break;
                case "d":
                    if (number2 != 0)
                    {
                        result = number1 / number2;
                    }
                    break;

                default:
                    break;
            }
            return result;
        }
    }
    class program
    {
        static void Main(string[] args)
        {
            bool endApp = false;
            Console.WriteLine("Console Calcuator in C#\r");
            Console.WriteLine("-----------------------\n");

            while (!endApp)
            {
                string numInput1 = "";
                string numInput2 = "";
                double result = 0;

                Console.WriteLine("Type a number, and then press enter: ");
                numInput1 = Console.ReadLine();

                double cleanNum1 = 0;
                while (!double.TryParse(numInput1, out cleanNum1))
                {
                    Console.WriteLine("This is not a valid number. Please enter a numerical value.");
                    numInput1 = Console.ReadLine();
                }
                Console.WriteLine("Type a second number, and then press enter: ");
                numInput2 = Console.ReadLine();

                double cleanNum2 = 0;
                while (!double.TryParse(numInput2, out cleanNum2))
                {
                    Console.WriteLine("This is not a valid number. Please enter a numerical value.");
                    numInput1 = Console.ReadLine();
                }
                Console.WriteLine("Choose an operator from the following list:");
                Console.WriteLine("\ta - Add");
                Console.WriteLine("\ts - Subtract");
                Console.WriteLine("\tm - Multiply");
                Console.WriteLine("\td - Divide");
                Console.Write("Your option? ");

                string op = Console.ReadLine();

                try
                {
                    result = Calculator.DoOperation(cleanNum1, cleanNum2, op);
                    if (double.IsNaN(result))
                    {
                        Console.WriteLine("This operation will result in an error.");
                    }
                    else Console.WriteLine("Your results: {0:0.##}\n", result);
                }
                catch (Exception e)
                {
                    Console.WriteLine("Oh no! An exceptio occurued trying to do the math. \n - Details: " + e.Message);

                }
                Console.WriteLine("---------------------\n");

                Console.Write("Press 'n' and Enter to close the app, or press any other key to continue.");
                if (Console.ReadLine() == "n") endApp = true;
                Console.WriteLine("\n");
            }
            return;
        }
    }























//    class Program
//    {
//    //    static void Main(string[] args)
//    //    {
//    //        //double number1 = 0;
//    //        //double number2 = 0;

//    //        //Console.WriteLine("Console Calculator in C#\r");
//    //        //Console.WriteLine("------------------------\n");

//    //        //Console.WriteLine("Type any number and press enter.");
//    //        //number1 = Convert.ToDouble(Console.ReadLine());

//    //        //Console.WriteLine("Type another number, then press enter.");
//    //        //number2 = Convert.ToDouble(Console.ReadLine());

            

//    //        //Console.WriteLine("Choose an operation:");
//    //        //Console.WriteLine("\ta - Add");
//    //        //Console.WriteLine("\ts - Subtract");
//    //        //Console.WriteLine("\tm - Multiply");
//    //        //Console.WriteLine("\td - Divide");
//    //        //Console.Write("Your option?");

//    //        //switch(Console.ReadLine())
//    //        //{
//    //        //    case "a":
//    //        //        Console.WriteLine($"Your result: {number1} + {number2} = " + (number1 + number2));
//    //        //        break;
//    //        //    case "s":
//    //        //        Console.WriteLine($"Your result: {number1} - {number2} = " + (number1 - number2));
//    //        //        break;
//    //        //    case "m":
//    //        //        Console.WriteLine($"Your result: {number1} * {number2} = " + (number1 * number2));
//    //        //        break;
//    //        //    case "d":
//    //        //        Console.WriteLine($"Your result: {number1} / {number2} = " + (number1 / number2));
//    //        //        break;
//    //        //}
//    //        //while (number2 == 0)
//    //        //{
//    //        //    Console.WriteLine("Please enter a non-zero divider. ");
//    //        //    number2 = Convert.ToDouble(Console.ReadLine());
//    //        //}
//    //        //Console.WriteLine($"Your result is: {number1} / {number2} = " + (number1 / number2));

//    //        //Console.Write("Press any key to close the Calculator app.");
//    //        //Console.ReadKey();

           
//    //    }
//    //}
}
