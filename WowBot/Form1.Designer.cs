namespace WowBot
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.btn_Attack = new System.Windows.Forms.Button();
            this.btn_Stop = new System.Windows.Forms.Button();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.lstb_Profiles = new System.Windows.Forms.ListBox();
            this.btn_GlobalInit = new System.Windows.Forms.Button();
            this.btn_ScreenCap = new System.Windows.Forms.Button();
            this.timer2 = new System.Windows.Forms.Timer(this.components);
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.newProfileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.editProfileToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.editToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.editProfileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.lbl_ScrCapStat = new System.Windows.Forms.Label();
            this.chb_OnOff = new System.Windows.Forms.CheckBox();
            this.lsb_Data = new System.Windows.Forms.ListBox();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // btn_Attack
            // 
            this.btn_Attack.Location = new System.Drawing.Point(12, 210);
            this.btn_Attack.Name = "btn_Attack";
            this.btn_Attack.Size = new System.Drawing.Size(75, 23);
            this.btn_Attack.TabIndex = 0;
            this.btn_Attack.Text = "Attack";
            this.btn_Attack.UseVisualStyleBackColor = true;
            this.btn_Attack.Click += new System.EventHandler(this.btn_Attack_Click);
            // 
            // btn_Stop
            // 
            this.btn_Stop.Location = new System.Drawing.Point(12, 239);
            this.btn_Stop.Name = "btn_Stop";
            this.btn_Stop.Size = new System.Drawing.Size(75, 23);
            this.btn_Stop.TabIndex = 1;
            this.btn_Stop.Text = "Stop";
            this.btn_Stop.UseVisualStyleBackColor = true;
            this.btn_Stop.Click += new System.EventHandler(this.btn_Stop_Click);
            // 
            // timer1
            // 
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // lstb_Profiles
            // 
            this.lstb_Profiles.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lstb_Profiles.BackColor = System.Drawing.SystemColors.Info;
            this.lstb_Profiles.FormattingEnabled = true;
            this.lstb_Profiles.Location = new System.Drawing.Point(12, 25);
            this.lstb_Profiles.Name = "lstb_Profiles";
            this.lstb_Profiles.Size = new System.Drawing.Size(225, 173);
            this.lstb_Profiles.TabIndex = 2;
            this.lstb_Profiles.SelectedIndexChanged += new System.EventHandler(this.lstb_Profiles_SelectedIndexChanged);
            // 
            // btn_GlobalInit
            // 
            this.btn_GlobalInit.Location = new System.Drawing.Point(12, 268);
            this.btn_GlobalInit.Name = "btn_GlobalInit";
            this.btn_GlobalInit.Size = new System.Drawing.Size(75, 23);
            this.btn_GlobalInit.TabIndex = 3;
            this.btn_GlobalInit.Text = "Global";
            this.btn_GlobalInit.UseVisualStyleBackColor = true;
            this.btn_GlobalInit.Click += new System.EventHandler(this.btn_GlobalInit_Click);
            // 
            // btn_ScreenCap
            // 
            this.btn_ScreenCap.Location = new System.Drawing.Point(94, 209);
            this.btn_ScreenCap.Name = "btn_ScreenCap";
            this.btn_ScreenCap.Size = new System.Drawing.Size(75, 23);
            this.btn_ScreenCap.TabIndex = 4;
            this.btn_ScreenCap.Text = "Screen Cap";
            this.btn_ScreenCap.UseVisualStyleBackColor = true;
            this.btn_ScreenCap.Click += new System.EventHandler(this.btn_ScreenCap_Click);
            // 
            // timer2
            // 
            this.timer2.Interval = 2000;
            this.timer2.Tick += new System.EventHandler(this.timer2_Tick);
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.editToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(249, 24);
            this.menuStrip1.TabIndex = 5;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.newProfileToolStripMenuItem,
            this.editProfileToolStripMenuItem1,
            this.exitToolStripMenuItem});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
            this.fileToolStripMenuItem.Text = "File";
            // 
            // newProfileToolStripMenuItem
            // 
            this.newProfileToolStripMenuItem.Name = "newProfileToolStripMenuItem";
            this.newProfileToolStripMenuItem.Size = new System.Drawing.Size(135, 22);
            this.newProfileToolStripMenuItem.Text = "New Profile";
            this.newProfileToolStripMenuItem.Click += new System.EventHandler(this.newProfileToolStripMenuItem_Click);
            // 
            // editProfileToolStripMenuItem1
            // 
            this.editProfileToolStripMenuItem1.Name = "editProfileToolStripMenuItem1";
            this.editProfileToolStripMenuItem1.Size = new System.Drawing.Size(135, 22);
            this.editProfileToolStripMenuItem1.Text = "Edit Profile";
            this.editProfileToolStripMenuItem1.Click += new System.EventHandler(this.editProfileToolStripMenuItem1_Click);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(135, 22);
            this.exitToolStripMenuItem.Text = "Exit";
            // 
            // editToolStripMenuItem
            // 
            this.editToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.editProfileToolStripMenuItem});
            this.editToolStripMenuItem.Name = "editToolStripMenuItem";
            this.editToolStripMenuItem.Size = new System.Drawing.Size(39, 20);
            this.editToolStripMenuItem.Text = "Edit";
            // 
            // editProfileToolStripMenuItem
            // 
            this.editProfileToolStripMenuItem.Name = "editProfileToolStripMenuItem";
            this.editProfileToolStripMenuItem.Size = new System.Drawing.Size(131, 22);
            this.editProfileToolStripMenuItem.Text = "Edit Profile";
            // 
            // lbl_ScrCapStat
            // 
            this.lbl_ScrCapStat.AutoSize = true;
            this.lbl_ScrCapStat.Location = new System.Drawing.Point(102, 239);
            this.lbl_ScrCapStat.Name = "lbl_ScrCapStat";
            this.lbl_ScrCapStat.Size = new System.Drawing.Size(96, 13);
            this.lbl_ScrCapStat.TabIndex = 6;
            this.lbl_ScrCapStat.Text = "Screen Cap Status";
            // 
            // chb_OnOff
            // 
            this.chb_OnOff.AutoSize = true;
            this.chb_OnOff.Location = new System.Drawing.Point(105, 268);
            this.chb_OnOff.Name = "chb_OnOff";
            this.chb_OnOff.Size = new System.Drawing.Size(59, 17);
            this.chb_OnOff.TabIndex = 7;
            this.chb_OnOff.Text = "On/Off";
            this.chb_OnOff.UseVisualStyleBackColor = true;
            this.chb_OnOff.CheckedChanged += new System.EventHandler(this.chb_OnOff_CheckedChanged);
            // 
            // lsb_Data
            // 
            this.lsb_Data.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lsb_Data.BackColor = System.Drawing.SystemColors.Info;
            this.lsb_Data.FormattingEnabled = true;
            this.lsb_Data.HorizontalScrollbar = true;
            this.lsb_Data.Location = new System.Drawing.Point(12, 297);
            this.lsb_Data.Name = "lsb_Data";
            this.lsb_Data.Size = new System.Drawing.Size(225, 69);
            this.lsb_Data.TabIndex = 8;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(249, 378);
            this.Controls.Add(this.lsb_Data);
            this.Controls.Add(this.chb_OnOff);
            this.Controls.Add(this.lbl_ScrCapStat);
            this.Controls.Add(this.btn_ScreenCap);
            this.Controls.Add(this.btn_GlobalInit);
            this.Controls.Add(this.lstb_Profiles);
            this.Controls.Add(this.btn_Stop);
            this.Controls.Add(this.btn_Attack);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_Attack;
        private System.Windows.Forms.Button btn_Stop;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.ListBox lstb_Profiles;
        private System.Windows.Forms.Button btn_GlobalInit;
        private System.Windows.Forms.Button btn_ScreenCap;
        private System.Windows.Forms.Timer timer2;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem newProfileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem editProfileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem editProfileToolStripMenuItem1;
        private System.Windows.Forms.Label lbl_ScrCapStat;
        private System.Windows.Forms.CheckBox chb_OnOff;
        private System.Windows.Forms.ListBox lsb_Data;
    }
}

