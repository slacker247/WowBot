using System;
using System.Threading;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Collections;
using System.Timers;
using System.IO;
using System.Text.RegularExpressions;

namespace WowBot
{
    public partial class Form1 : Form
    {
        bool debug = false;
        Unit m_Player = new Unit();
        Unit m_Target = new Unit();
        ArrayList Global = new ArrayList();
        ArrayList InitAttacks = new ArrayList();
        ArrayList repeatAttacks = new ArrayList();
        String m_Folder = "";
        Profile m_CurrentProfile;
        TimeSpan GCD = TimeSpan.Parse("0:0:1.6");
        Boolean inGCD = false;
        Boolean attacking = false;
        ArrayList m_Files = new ArrayList();
        Bitmap m_Screen;
        Graphics m_Graphics;
        int m_Startx = -1, m_Starty = -1;
        String m_Status = "";
        bool m_SendingKey = false;
        BarCode m_BarCode = new BarCode();

        public int wowHandle = -1;

        public Form1()
        {
            InitializeComponent();
            wowHandle = FindWindow("GxWindowClassD3d", "World of Warcraft");
        }

        // http://www.developerfusion.com/article/57/sendkeys-command/
        private void btn_Attack_Click(object sender, EventArgs e)
        {
        }

        private void sendKeys(String key)
        {
            if (m_SendingKey)
                return;
            m_SendingKey = true;
            SetForegroundWindow(wowHandle);
            if (key.Contains("/"))
            {
                SendKeys.SendWait(key.Substring(0, 1));
                Thread.Sleep(60);
                for (int i = 1; i < key.Length; i++)
                {
                    SendKeys.SendWait(key.Substring(i, 1));
                    Thread.Sleep(10);
                }
            }
            else
                SendKeys.SendWait(key);
            Thread.Sleep(20);
            Thread.Sleep((int)GCD.TotalMilliseconds);
            m_SendingKey = false;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            // Get players current state
            getData();
            // Check buffs
            if (m_CurrentProfile != null && m_Player != null)
            {
                foreach (String buff in m_CurrentProfile.m_Buffs.Keys)
                {
                    if (!m_Player.hasBuff(buff) && !m_Player.isMounted())
                    {
                        for (int i = 0; i < ((Spell)m_CurrentProfile.m_Buffs[buff]).m_Command.Count; i++)
                        {
                            sendKeys(((Spell)m_CurrentProfile.m_Buffs[buff]).m_Command[i].ToString());
                        }
                    }
                }
                // Check mounted
                if (m_Player.isMounted())
                {
                    if (m_CurrentProfile.m_Auras["Mounted"] != null &&
                        !m_Player.hasBuff(((Spell)m_CurrentProfile.m_Auras["Mounted"]).getName()))
                    {
                        sendKeys(((Spell)m_CurrentProfile.m_Auras["Mounted"]).m_Command[0].ToString());
                    }
                }
                else
                {
                    if (m_CurrentProfile.m_Auras["Not Mounted"] != null &&
                        !m_Player.hasBuff(((Spell)m_CurrentProfile.m_Auras["Not Mounted"]).getName()))
                    {
                        sendKeys(((Spell)m_CurrentProfile.m_Auras["Not Mounted"]).m_Command[0].ToString());
                    }
                }
                if (m_Target != null && (m_Player.inCombat() || m_Target.inCombat()))
                {
                    if (!attacking)
                    {
                        sendKeys("t");
                        sendKeys("{DOWN}"); // Stop moving.
                        attacking = true;
                    }
                    if (!m_Player.isMounted())
                    {
                        foreach (String attack in m_CurrentProfile.m_Attacks.Keys)
                        {
                            if (m_Player.canCast(attack))
                            {
                                for (int i = 0; i < ((Spell)m_CurrentProfile.m_Attacks[attack]).m_Command.Count; i++)
                                {
                                    sendKeys(((Spell)m_CurrentProfile.m_Attacks[attack]).m_Command[i].ToString());
                                }
                            }
                        }
                    }
                }
                else
                    attacking = false;
            }
            // Based on state, perform action list
        }

        private void btn_Stop_Click(object sender, EventArgs e)
        {
            attacking = false;
        }

        private void lstb_Profiles_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (m_CurrentProfile == null)
                m_CurrentProfile = new Profile();
            m_CurrentProfile.load("./Profiles/" + lstb_Profiles.SelectedItem.ToString());
        }

        private void btn_GlobalInit_Click(object sender, EventArgs e)
        {
            if (m_Player.canCast("Seal of Light"))
            {
                sendKeys("+(6)");
                sendKeys("4");
            }
        }

        private void getData()
        {
            lbl_ScrCapStat.Text = "Finding Barcode...";
            // Get data from the screen
            String data = m_BarCode.getData();
            // split data apart based on the brackets
            Regex pattern = new Regex("\\[[a-zA-Z0-9.:;\\s\\|]*\\]");
            MatchCollection match = pattern.Matches(data);
            // send the data parts to their respective class
            m_Player = null;
            m_Target = null;
            for (int i = 0; i < match.Count; i++)
            {
                if (match[i].Value.Contains("Player"))
                    m_Player = new Unit(match[i].Value);
                if (match[i].Value.Contains("Target;"))
                    m_Target = new Unit(match[i].Value);
            }
            for (int i = 0; i < match.Count; i++)
            {
                String pat = match[i].Value;
                if (pat.Contains("[Buffs") &&
                   m_Player != null)
                    m_Player.updateBuffs(match[i].Value);
                if (pat.Contains("Spells") &&
                   m_Player != null)
                    m_Player.updateSpells(match[i].Value);
                if (pat.Contains("TargetBuffs") &&
                   m_Target != null)
                    m_Target.updateBuffs(match[i].Value);
            }
            if (m_Player != null)
            {
                // pass the classes to the rules engine
                // get certain rules and send keys to WoW
                Console.WriteLine("Player data: \n" + m_Player.ToString());// pop rules engine
                Console.WriteLine("Test Data: " + data);
            }
            else
                Console.WriteLine(m_BarCode.getStatus());
            lbl_ScrCapStat.Text = m_BarCode.getStatus();
            lsb_Data.Items.Insert(0, data);
        }
/*
        private int checkForWhite(int x, int y)
        {
            int count = 0;
            Color c = Color.Black;
            do
            {
                if (x >= m_Screen.Width)
                    break;
                c = m_Screen.GetPixel(x++, y);
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
                if (x >= m_Screen.Width)
                    break;
                c = m_Screen.GetPixel(x++, y);
                count++;
            } while (c.R == 0 && c.G == 0 && c.B == 0 || count > 8);
            return --count;
        }

        private void findBarCode()
        {
            int x = 0, y = 0;
            bool test = true;
            m_Screen = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);
            m_Graphics = Graphics.FromImage(m_Screen);
            m_Graphics.CopyFromScreen(Screen.PrimaryScreen.Bounds.X, Screen.PrimaryScreen.Bounds.Y, 0, 0, Screen.PrimaryScreen.Bounds.Size, CopyPixelOperation.SourceCopy);
            m_Screen.Save("ScreenCap.bmp");
            Color c = m_Screen.GetPixel(x++, y);
            do
            {
                #region Find_Start
                int ws = checkForWhite(x, y);
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
                            m_Startx = x + ws - 1;
                            m_Starty = y;
                            test = false;
                        }
                    }
                }

                #endregion
                if (x >= m_Screen.Width)
                {
                    x = 0;
                    y++;
                    if (y >= m_Screen.Height)
                        test = false;
                }
                if (test)
                    c = m_Screen.GetPixel(x++, y);
            } while (test);
        }
*/
        private void btn_ScreenCap_Click(object sender, EventArgs e)
        {
            getData();
        }

        public void getScreenCap()
        {/*
            int x = 0, y = 0, startX = -1, startY = -1;
            Color c = Color.Black;
            if (m_Startx == -1)
            {
                findBarCode();
                startX = m_Startx;
                startY = m_Starty;
            }
            else
            {
                m_Screen = new Bitmap(500, 10);
                m_Graphics = Graphics.FromImage(m_Screen);
                m_Graphics.CopyFromScreen(m_Startx, m_Starty, 0, 0, new Size(500, 10), CopyPixelOperation.SourceCopy);
                startX = 0;
                startY = 0;
            }
            if (startX > -1)
            {
                lbl_ScrCapStat.Text = "Found Data bar.";
                String text = "";
                Color lastC = Color.Black;
                x = startX + 1;
                y = startY;
                do
                {
                    if (x >= m_Screen.Width ||
                        y >= m_Screen.Height)
                        break;
                    c = m_Screen.GetPixel(x++, y);
                    if (!c.Equals(lastC) &&
                        c.R != 255 && c.G != 255 && c.B != 255)
                    {
                        text += (char)c.R;
                        text += (char)c.G;
                        text += (char)c.B;
                    }
                    lastC = c;
                } while (c.R != 255 && c.G != 255 && c.B != 255);
                m_Status = text;
                if (m_Status.Contains("[Player") &&
                   m_Status.Contains("]"))
                {
                    lbl_ScrCapStat.Text = "Found Data.";
                    String[] values = text.Split(']');
                    m_Player.updatePlayer(values[0]);
                    m_Player.updateBuffs(values[1]);
                    lsb_Data.Items.Add(text);
                }
                if (debug)
                    MessageBox.Show(text);
            }
            else
            {
                lbl_ScrCapStat.Text = "Didn't Find it.";
                //MessageBox.Show("Didn't Find it.");
            }*/
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
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

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // Load the profiles into the form
            m_Files.AddRange(new String[] { "Global.txt", "Attack.txt", "Initial.txt" });

            System.IO.DirectoryInfo dir = new System.IO.DirectoryInfo("./Profiles/");
            foreach (System.IO.FileInfo g in dir.GetFiles())
            {
                //LOAD FOLDERS 
                if (g.Attributes != FileAttributes.Directory)
                    lstb_Profiles.Items.Add(g.Name);
            }

            lstb_Profiles.SetSelected(0, true);
        }

        private void newProfileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            timer1.Enabled = false;
            ProfileDlg prof = new ProfileDlg();
            DialogResult dr = prof.ShowDialog(this);
            if (dr == DialogResult.OK)
            {
                // TODO : Write to file and add to list box.
                m_CurrentProfile = new Profile();
                m_CurrentProfile = prof.m_Profile;
                m_CurrentProfile.save();
                lstb_Profiles.Items.Add(m_CurrentProfile.m_Name + ".xml");
            }
//            timer1.Enabled = true;
        }

        private void editProfileToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            timer1.Enabled = false;
            ProfileDlg prof = new ProfileDlg();
            prof.setProfile(m_CurrentProfile);
            DialogResult dr = prof.ShowDialog(this);
            if (dr == DialogResult.OK)
            {
                // TODO : Write to file and add to list box.
                m_CurrentProfile = new Profile();
                m_CurrentProfile = prof.m_Profile;
                m_CurrentProfile.save();
                if(!lstb_Profiles.Items.Contains(m_CurrentProfile.m_Name + ".xml"))
                    lstb_Profiles.Items.Add(m_CurrentProfile.m_Name + ".xml");
            }
//            timer1.Enabled = true;
        }

        private void chb_OnOff_CheckedChanged(object sender, EventArgs e)
        {
            timer1.Enabled = chb_OnOff.Checked;
        }
    }
}