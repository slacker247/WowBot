using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Collections;

namespace WowBot
{
    public partial class ProfileDlg : Form
    {
        public Profile m_Profile = new Profile();

        public ProfileDlg()
        {
            InitializeComponent();
        }

        private void btn_BuffsAdd_Click(object sender, EventArgs e)
        {
            InputDlg input = new InputDlg();
            DialogResult dr = input.ShowDialog(this);
            if (dr == DialogResult.OK)
            {
                Spell spell = new Spell();
                spell.setName(input.txb_SpellName.Text);
                spell.addCommand(input.txb_Command.Text);
                m_Profile.m_Buffs[input.txb_SpellName.Text] = spell;
                lst_Buffs.Items.Add(input.txb_SpellName.Text);
            }
        }

        private void btn_BuffsDelete_Click(object sender, EventArgs e)
        {
            String name = lst_Buffs.SelectedItem.ToString();
            lst_Buffs.Items.Remove(lst_Buffs.SelectedItem);
            m_Profile.m_Buffs.Remove(name);
        }

        private void btn_InitAttackAdd_Click(object sender, EventArgs e)
        {
            InputDlg input = new InputDlg();
            DialogResult dr = input.ShowDialog(this);
            if (dr == DialogResult.OK)
            {
                Spell spell = new Spell();
                spell.setName(input.txb_SpellName.Text);
                spell.addCommand(input.txb_Command.Text);
                m_Profile.m_InitAttack[input.txb_SpellName.Text] = spell;
                lst_InitAttack.Items.Add(input.txb_SpellName.Text);
            }
        }

        private void btn_InitAttackDelete_Click(object sender, EventArgs e)
        {
            String name = lst_InitAttack.SelectedItem.ToString();
            lst_InitAttack.Items.Remove(lst_InitAttack.SelectedItem);
            m_Profile.m_InitAttack.Remove(name);
        }

        private void btn_AttackingAdd_Click(object sender, EventArgs e)
        {
            InputDlg input = new InputDlg();
            DialogResult dr = input.ShowDialog(this);
            if (dr == DialogResult.OK)
            {
                Spell spell = new Spell();
                spell.setName(input.txb_SpellName.Text);
                spell.addCommand(input.txb_Command.Text);
                m_Profile.m_Attacks[input.txb_SpellName.Text] = spell;
                lst_Attacking.Items.Add(input.txb_SpellName.Text);
            }
        }

        private void btn_AttackingDelete_Click(object sender, EventArgs e)
        {
            String name = lst_Attacking.SelectedItem.ToString();
            lst_Attacking.Items.Remove(lst_Attacking.SelectedItem);
            m_Profile.m_Attacks.Remove(name);
        }

        private void btn_Mounted_Click(object sender, EventArgs e)
        {
            InputDlg input = new InputDlg();
            if(m_Profile.m_Auras["Mounted"] != null)
            {
                input.txb_SpellName.Text = ((Spell)m_Profile.m_Auras["Mounted"]).getName();
                input.txb_Command.Text = ((Spell)m_Profile.m_Auras["Mounted"]).m_Command[0].ToString();
            }
            DialogResult dr = input.ShowDialog(this);
            if (dr == DialogResult.OK)
            {
                Spell spell = new Spell();
                spell.setName(input.txb_SpellName.Text);
                spell.addCommand(input.txb_Command.Text);
                m_Profile.m_Auras["Mounted"] = spell;
            }
        }

        private void btn_NotMounted_Click(object sender, EventArgs e)
        {
            InputDlg input = new InputDlg();
            if (m_Profile.m_Auras["Not Mounted"] != null)
            {
                input.txb_SpellName.Text = ((Spell)m_Profile.m_Auras["Not Mounted"]).getName();
                input.txb_Command.Text = ((Spell)m_Profile.m_Auras["Not Mounted"]).m_Command[0].ToString();
            }
            DialogResult dr = input.ShowDialog(this);
            if (dr == DialogResult.OK)
            {
                Spell spell = new Spell();
                spell.setName(input.txb_SpellName.Text);
                spell.addCommand(input.txb_Command.Text);
                m_Profile.m_Auras["Not Mounted"] = spell;
            }
        }

        private void btn_Ok_Click(object sender, EventArgs e)
        {
            if (tbx_ProfileName.Text != "")
            {
                m_Profile.m_Name = tbx_ProfileName.Text;
            }
            else
                MessageBox.Show(this, "Please enter a name.", "Missing info!", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        internal void setProfile(Profile profile)
        {
            m_Profile = profile;
            tbx_ProfileName.Text = m_Profile.m_Name;
            foreach(String key in m_Profile.m_Attacks.Keys)
                lst_Attacking.Items.Add(key);
            foreach (String key in m_Profile.m_Buffs.Keys)
                lst_Buffs.Items.Add(key);
            foreach (String key in m_Profile.m_InitAttack.Keys)
                lst_InitAttack.Items.Add(key);
        }
    }
}