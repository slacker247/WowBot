using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace SendMsg
{
    /*
     * This is a command line app that takes two arguments
     * The first is the window title with underscores as spaces
     * The second is the key to send.
     */
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length == 2)
            {
                String key = args[1];
                String windTitle = args[0].Replace('_', ' ');
                int windHandle = FindWindow(null, windTitle);
                if (windHandle > 0)
                {
                    SetForegroundWindow(windHandle);
                    SendKeys.SendWait(key);
                }
                else
                {
                    System.Console.WriteLine("Didn't find the window: " + windTitle);
                }
            }
            else
            {
                System.Console.WriteLine("Usage: WindowName key");
                System.Console.WriteLine("  WindowName: is the name of the window");
                System.Console.WriteLine("              to send the key to. Use under-");
                System.Console.WriteLine("              scores for spaces.");
                System.Console.WriteLine("");
                System.Console.WriteLine("  Key:        the ascii representation of the");
                System.Console.WriteLine("              key to send.  The reference url:");
                System.Console.WriteLine("http://www.developerfusion.com/article/57/sendkeys-command/");
                System.Console.WriteLine("");
                System.Console.WriteLine("Example: SendMsg Control_Panel %{F4}");
            }
        }
        
        // The FindWindow function retrieves a handle
        // to the top-level window whose class name
        // and window name match the specified strings.
        // This function does not search child windows.
        // This function does not perform a case-sensitive search.
        [DllImport("User32.dll")]
        public static extern int FindWindow(string strClassName,
                                                 string strWindowName);
        [DllImport("User32.dll")]
        public static extern Int32 SetForegroundWindow(int hWnd);
    }
}
