namespace WowBot
{
    partial class ProfileDlg
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
            this.button1 = new System.Windows.Forms.Button();
            this.btn_Ok = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.tbx_ProfileName = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btn_BuffsDelete = new System.Windows.Forms.Button();
            this.btn_BuffsAdd = new System.Windows.Forms.Button();
            this.lst_Buffs = new System.Windows.Forms.ListBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.btn_InitAttackDelete = new System.Windows.Forms.Button();
            this.btn_InitAttackAdd = new System.Windows.Forms.Button();
            this.lst_InitAttack = new System.Windows.Forms.ListBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btn_AttackingDelete = new System.Windows.Forms.Button();
            this.btn_AttackingAdd = new System.Windows.Forms.Button();
            this.lst_Attacking = new System.Windows.Forms.ListBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btn_NotMounted = new System.Windows.Forms.Button();
            this.btn_Mounted = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.button1.Location = new System.Drawing.Point(287, 404);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "Cancel";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // btn_Ok
            // 
            this.btn_Ok.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.btn_Ok.Location = new System.Drawing.Point(206, 404);
            this.btn_Ok.Name = "btn_Ok";
            this.btn_Ok.Size = new System.Drawing.Size(75, 23);
            this.btn_Ok.TabIndex = 1;
            this.btn_Ok.Text = "Ok";
            this.btn_Ok.UseVisualStyleBackColor = true;
            this.btn_Ok.Click += new System.EventHandler(this.btn_Ok_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(70, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Profile Name:";
            // 
            // tbx_ProfileName
            // 
            this.tbx_ProfileName.Location = new System.Drawing.Point(88, 17);
            this.tbx_ProfileName.Name = "tbx_ProfileName";
            this.tbx_ProfileName.Size = new System.Drawing.Size(155, 20);
            this.tbx_ProfileName.TabIndex = 3;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btn_BuffsDelete);
            this.groupBox1.Controls.Add(this.btn_BuffsAdd);
            this.groupBox1.Controls.Add(this.lst_Buffs);
            this.groupBox1.Location = new System.Drawing.Point(12, 43);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(172, 189);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Buffs";
            // 
            // btn_BuffsDelete
            // 
            this.btn_BuffsDelete.Location = new System.Drawing.Point(89, 161);
            this.btn_BuffsDelete.Name = "btn_BuffsDelete";
            this.btn_BuffsDelete.Size = new System.Drawing.Size(75, 23);
            this.btn_BuffsDelete.TabIndex = 2;
            this.btn_BuffsDelete.Text = "Delete";
            this.btn_BuffsDelete.UseVisualStyleBackColor = true;
            this.btn_BuffsDelete.Click += new System.EventHandler(this.btn_BuffsDelete_Click);
            // 
            // btn_BuffsAdd
            // 
            this.btn_BuffsAdd.Location = new System.Drawing.Point(7, 161);
            this.btn_BuffsAdd.Name = "btn_BuffsAdd";
            this.btn_BuffsAdd.Size = new System.Drawing.Size(75, 23);
            this.btn_BuffsAdd.TabIndex = 1;
            this.btn_BuffsAdd.Text = "Add";
            this.btn_BuffsAdd.UseVisualStyleBackColor = true;
            this.btn_BuffsAdd.Click += new System.EventHandler(this.btn_BuffsAdd_Click);
            // 
            // lst_Buffs
            // 
            this.lst_Buffs.FormattingEnabled = true;
            this.lst_Buffs.Location = new System.Drawing.Point(7, 20);
            this.lst_Buffs.Name = "lst_Buffs";
            this.lst_Buffs.Size = new System.Drawing.Size(157, 134);
            this.lst_Buffs.TabIndex = 0;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.btn_InitAttackDelete);
            this.groupBox2.Controls.Add(this.btn_InitAttackAdd);
            this.groupBox2.Controls.Add(this.lst_InitAttack);
            this.groupBox2.Location = new System.Drawing.Point(190, 43);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(172, 189);
            this.groupBox2.TabIndex = 5;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Initiate Attack";
            // 
            // btn_InitAttackDelete
            // 
            this.btn_InitAttackDelete.Location = new System.Drawing.Point(89, 161);
            this.btn_InitAttackDelete.Name = "btn_InitAttackDelete";
            this.btn_InitAttackDelete.Size = new System.Drawing.Size(75, 23);
            this.btn_InitAttackDelete.TabIndex = 2;
            this.btn_InitAttackDelete.Text = "Delete";
            this.btn_InitAttackDelete.UseVisualStyleBackColor = true;
            this.btn_InitAttackDelete.Click += new System.EventHandler(this.btn_InitAttackDelete_Click);
            // 
            // btn_InitAttackAdd
            // 
            this.btn_InitAttackAdd.Location = new System.Drawing.Point(7, 161);
            this.btn_InitAttackAdd.Name = "btn_InitAttackAdd";
            this.btn_InitAttackAdd.Size = new System.Drawing.Size(75, 23);
            this.btn_InitAttackAdd.TabIndex = 1;
            this.btn_InitAttackAdd.Text = "Add";
            this.btn_InitAttackAdd.UseVisualStyleBackColor = true;
            this.btn_InitAttackAdd.Click += new System.EventHandler(this.btn_InitAttackAdd_Click);
            // 
            // lst_InitAttack
            // 
            this.lst_InitAttack.FormattingEnabled = true;
            this.lst_InitAttack.Location = new System.Drawing.Point(7, 20);
            this.lst_InitAttack.Name = "lst_InitAttack";
            this.lst_InitAttack.Size = new System.Drawing.Size(157, 134);
            this.lst_InitAttack.TabIndex = 0;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.btn_AttackingDelete);
            this.groupBox3.Controls.Add(this.btn_AttackingAdd);
            this.groupBox3.Controls.Add(this.lst_Attacking);
            this.groupBox3.Location = new System.Drawing.Point(15, 238);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(172, 189);
            this.groupBox3.TabIndex = 6;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Attacking";
            // 
            // btn_AttackingDelete
            // 
            this.btn_AttackingDelete.Location = new System.Drawing.Point(89, 161);
            this.btn_AttackingDelete.Name = "btn_AttackingDelete";
            this.btn_AttackingDelete.Size = new System.Drawing.Size(75, 23);
            this.btn_AttackingDelete.TabIndex = 2;
            this.btn_AttackingDelete.Text = "Delete";
            this.btn_AttackingDelete.UseVisualStyleBackColor = true;
            this.btn_AttackingDelete.Click += new System.EventHandler(this.btn_AttackingDelete_Click);
            // 
            // btn_AttackingAdd
            // 
            this.btn_AttackingAdd.Location = new System.Drawing.Point(7, 161);
            this.btn_AttackingAdd.Name = "btn_AttackingAdd";
            this.btn_AttackingAdd.Size = new System.Drawing.Size(75, 23);
            this.btn_AttackingAdd.TabIndex = 1;
            this.btn_AttackingAdd.Text = "Add";
            this.btn_AttackingAdd.UseVisualStyleBackColor = true;
            this.btn_AttackingAdd.Click += new System.EventHandler(this.btn_AttackingAdd_Click);
            // 
            // lst_Attacking
            // 
            this.lst_Attacking.FormattingEnabled = true;
            this.lst_Attacking.Location = new System.Drawing.Point(7, 20);
            this.lst_Attacking.Name = "lst_Attacking";
            this.lst_Attacking.Size = new System.Drawing.Size(157, 134);
            this.lst_Attacking.TabIndex = 0;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.btn_NotMounted);
            this.groupBox4.Controls.Add(this.btn_Mounted);
            this.groupBox4.Location = new System.Drawing.Point(194, 239);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(160, 153);
            this.groupBox4.TabIndex = 7;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Auras";
            // 
            // btn_NotMounted
            // 
            this.btn_NotMounted.Location = new System.Drawing.Point(7, 50);
            this.btn_NotMounted.Name = "btn_NotMounted";
            this.btn_NotMounted.Size = new System.Drawing.Size(80, 23);
            this.btn_NotMounted.TabIndex = 1;
            this.btn_NotMounted.Text = "Not Mounted";
            this.btn_NotMounted.UseVisualStyleBackColor = true;
            this.btn_NotMounted.Click += new System.EventHandler(this.btn_NotMounted_Click);
            // 
            // btn_Mounted
            // 
            this.btn_Mounted.Location = new System.Drawing.Point(7, 20);
            this.btn_Mounted.Name = "btn_Mounted";
            this.btn_Mounted.Size = new System.Drawing.Size(80, 23);
            this.btn_Mounted.TabIndex = 0;
            this.btn_Mounted.Text = "Mounted";
            this.btn_Mounted.UseVisualStyleBackColor = true;
            this.btn_Mounted.Click += new System.EventHandler(this.btn_Mounted_Click);
            // 
            // ProfileDlg
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(374, 437);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.tbx_ProfileName);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btn_Ok);
            this.Controls.Add(this.button1);
            this.Name = "ProfileDlg";
            this.Text = "Profile Dialog";
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btn_Ok;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbx_ProfileName;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btn_BuffsDelete;
        private System.Windows.Forms.Button btn_BuffsAdd;
        private System.Windows.Forms.ListBox lst_Buffs;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btn_InitAttackDelete;
        private System.Windows.Forms.Button btn_InitAttackAdd;
        private System.Windows.Forms.ListBox lst_InitAttack;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button btn_AttackingDelete;
        private System.Windows.Forms.Button btn_AttackingAdd;
        private System.Windows.Forms.ListBox lst_Attacking;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Button btn_NotMounted;
        private System.Windows.Forms.Button btn_Mounted;
    }
}