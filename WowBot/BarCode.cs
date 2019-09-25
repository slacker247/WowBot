using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.Windows.Forms;

namespace WowBot
{
    class BarCode
    {
        protected int m_StartX = -1;
        protected int m_StartY = -1;
        protected int m_StartOffset = -1;
        protected String m_Data = "";
        protected String m_Status = "No Data";
        protected Bitmap m_ScreenCap = null;
        protected Graphics m_Graphics;

        public BarCode()
        {

        }

        protected bool captureScreen()
        {
            Console.WriteLine("Getting screen cap.");
            bool status = false;
            if (m_StartX != -1 && m_StartY != -1)
            {
                m_ScreenCap = new Bitmap(500, 500);
                m_Graphics = Graphics.FromImage(m_ScreenCap);
                m_Graphics.CopyFromScreen(m_StartX - m_StartOffset, m_StartY, 0, 0, new Size(500, 50), CopyPixelOperation.SourceCopy);
                m_ScreenCap.Save("ScreenCap1.bmp");
            }
            else
            {
                m_ScreenCap = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);
                m_Graphics = Graphics.FromImage(m_ScreenCap);
                m_Graphics.CopyFromScreen(Screen.PrimaryScreen.Bounds.X, Screen.PrimaryScreen.Bounds.Y, 0, 0, Screen.PrimaryScreen.Bounds.Size, CopyPixelOperation.SourceCopy);
                m_ScreenCap.Save("ScreenCap.bmp");
            }
            status = true;

            return status;
        }

        protected bool setStatus(String message)
        {
            bool status = false;
            m_Status = message;
            return status;
        }

        public String getStatus()
        {
            return m_Status;
        }

        private int checkForWhite(int x, int y)
        {
            int count = 0;
            Color c = Color.Black;
            do
            {
                if (x >= m_ScreenCap.Width)
                    break;
                c = m_ScreenCap.GetPixel(x++, y);
                count++;
            } while (c.R == 255 && c.G == 255 && c.B == 255 || count > 8);
            return --count;
        }

        private int checkForBlack(int x, int y)
        {
            int count = 0;
            Color c = Color.White;
            do
            {
                if (x >= m_ScreenCap.Width)
                    break;
                c = m_ScreenCap.GetPixel(x++, y);
                count++;
            } while (c.R == 0 && c.G == 0 && c.B == 0 || count > 8);
            return --count;
        }

        protected void findBarCode()
        {
            Console.WriteLine("finding barcode.");
            int x = 0, y = 0;
            int offset = 0;
            bool valid = true;
            captureScreen();
            Color c = m_ScreenCap.GetPixel(x++, y);
            do
            {
                #region Find_Start
                int ws = checkForWhite(x, y);
                if (ws > 1 && ws < 5)
                {
                    x += ws;
                    offset = ws;
                    int bs = checkForBlack(x, y);
                    if (bs > 1 && bs < 5)
                    {
                        x += bs;
                        offset += bs;
                        ws = checkForWhite(x, y);
                        if (ws > 1 && ws < 5)
                        {
                            m_StartOffset = offset + ws - 1;
                            m_StartX = x + ws - 1;
                            m_StartY = y;
                            valid = false;
                        }
                    }
                }

                #endregion
                if (x >= m_ScreenCap.Width)
                {
                    x = 0;
                    y++;
                    if (y >= m_ScreenCap.Height)
                        valid = false;
                }
                if (valid)
                    c = m_ScreenCap.GetPixel(x++, y);
            } while (valid);
        }

        // TODO : Add multi line processing
        public String getData()
        {
            Console.WriteLine("Getting data.");
            int x = 0, y = 0, startX = -1, startY = -1;
            Color c = Color.Black;
            if (m_StartX == -1)
            {
                findBarCode();
                startX = m_StartX;
                startY = m_StartY;
            }
            else
            {
                captureScreen();
                startX = 0 + m_StartOffset;
                startY = 0;
            }
            if (startX > -1)
            {
                m_Status = "Found Data bar.";
                String text = "";
                Color lastC = Color.Black;
                x = startX + 1;
                y = startY;
                bool test = false;
                do
                {
                    do
                    {
                        if (x >= m_ScreenCap.Width ||
                            y >= m_ScreenCap.Height)
                            break;
                        c = m_ScreenCap.GetPixel(x++, y);
                        if (!c.Equals(lastC) &&
                            c.R != 255 && c.G != 255 && c.B != 255)
                        {
                            text += (char)c.R;
                            text += (char)c.G;
                            text += (char)c.B;
                        }
                        lastC = c;
                    } while (c.R != 255 && c.G != 255 && c.B != 255);
                    int ws = checkForWhite(startX - m_StartOffset, ++y);
                    test = false;
                    x = startX - m_StartOffset;
                    if (ws > 1 && ws < 5)
                    {
                        x += ws;
                        int bs = checkForBlack(x, y);
                        if (bs > 1 && bs < 5)
                        {
                            x += bs;
                            ws = checkForWhite(x, y);
                            if (ws > 1 && ws < 5)
                            {
                                x += ws;
                                test = true;
                            }
                        }
                    }
                } while (test);
                char trash = (char)2;
                String[] tempText = text.Split(trash);
                text = "";
                for (int i = 0; i < tempText.Length; i++)
                {
                    text += tempText[i];
                }
                if (text.Contains("[Player") &&
                   text.Contains("]"))
                {
                    m_Status = "Found Data.";
                    m_Data = text.Split('*')[0];
                }
            }
            else
            {
                m_Status = "Didn't Find it.";
            }
            return m_Data;
        }
    }
}
