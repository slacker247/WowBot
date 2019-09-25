using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.IO;
using System.Xml.Serialization;
using System.Xml;

namespace WowBot
{
    public class Profile
    {
        public String m_Name;
        public Hashtable m_Buffs = new Hashtable();
        public Hashtable m_InitAttack = new Hashtable();
        public Hashtable m_Attacks = new Hashtable();
        public Hashtable m_Auras = new Hashtable();

        public void load(string xmlFile)
        {
            m_Buffs.Clear();
            m_Auras.Clear();
            m_Attacks.Clear();
            m_InitAttack.Clear();
            XmlDocument xDoc = new XmlDocument();
            xDoc.Load(xmlFile);
            m_Name = xDoc.GetElementsByTagName("Name")[0].InnerText;
            XmlNodeList Buffs = xDoc.GetElementsByTagName("Buffs");
            foreach (XmlNode node in Buffs[0].ChildNodes)
            {
                Spell sp = new Spell();
                sp.setName(node["name"].InnerText);
                for(int i = 1; i < node.ChildNodes.Count; i++)
                    sp.addCommand(node.ChildNodes[i].InnerText);
                m_Buffs[sp.getName()] = sp;
            }
            XmlNodeList InitAttack = xDoc.GetElementsByTagName("InitAttack");
            foreach (XmlNode node in InitAttack[0].ChildNodes)
            {
                Spell sp = new Spell();
                sp.setName(node["name"].InnerText);
                for (int i = 1; i < node.ChildNodes.Count; i++)
                    sp.addCommand(node.ChildNodes[i].InnerText);
                m_InitAttack[sp.getName()] = sp;
            }
            XmlNodeList Attacks = xDoc.GetElementsByTagName("Attacks");
            foreach (XmlNode node in Attacks[0].ChildNodes)
            {
                Spell sp = new Spell();
                sp.setName(node["name"].InnerText);
                for (int i = 1; i < node.ChildNodes.Count; i++)
                    sp.addCommand(node.ChildNodes[i].InnerText);
                m_Attacks[sp.getName()] = sp;
            }
            XmlNodeList Auras = xDoc.GetElementsByTagName("Auras");
            foreach (XmlNode node in Auras[0].ChildNodes)
            {
                Spell sp = new Spell();
                sp.setName(node["name"].InnerText);
                for (int i = 2; i < node.ChildNodes.Count; i++)
                    sp.addCommand(node.ChildNodes[i].InnerText);
                m_Auras[node.ChildNodes[0].InnerText] = sp;
            }
        }

        public void save(string xmlFile)
        {
            StreamWriter SW;
            SW = File.CreateText(xmlFile);
            SW.WriteLine("<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n<data>");
            SW.WriteLine("<Name>" + m_Name + "</Name>");
            SW.WriteLine("<Buffs>");
            foreach (String key in m_Buffs.Keys)
            {
                SW.WriteLine("<buff>");
                Spell sp = (Spell)m_Buffs[key];
                SW.WriteLine("<name>" + sp.getName() + "</name>");
                foreach (String command in sp.m_Command)
                    SW.WriteLine("<command>" + command + "</command>");
                SW.WriteLine("</buff>");
            }
            SW.WriteLine("</Buffs>");
            SW.WriteLine("<InitAttack>");
            foreach (String key in m_InitAttack.Keys)
            {
                SW.WriteLine("<Attack>");
                Spell sp = (Spell)m_InitAttack[key];
                SW.WriteLine("<name>" + sp.getName() + "</name>");
                foreach (String command in sp.m_Command)
                    SW.WriteLine("<command>" + command + "</command>");
                SW.WriteLine("</Attack>");
            }
            SW.WriteLine("</InitAttack>");
            SW.WriteLine("<Attacks>");
            foreach (String key in m_Attacks.Keys)
            {
                SW.WriteLine("<Attack>");
                Spell sp = (Spell)m_Attacks[key];
                SW.WriteLine("<name>" + sp.getName() + "</name>");
                foreach (String command in sp.m_Command)
                    SW.WriteLine("<command>" + command + "</command>");
                SW.WriteLine("</Attack>");
            }
            SW.WriteLine("</Attacks>");
            SW.WriteLine("<Auras>");
            foreach (String key in m_Auras.Keys)
            {
                SW.WriteLine("<Aura>");
                Spell sp = (Spell)m_Auras[key];
                SW.WriteLine("<key>" + key + "</key>");
                SW.WriteLine("<name>" + sp.getName() + "</name>");
                foreach (String command in sp.m_Command)
                    SW.WriteLine("<command>" + command + "</command>");
                SW.WriteLine("</Aura>");
            }
            SW.WriteLine("</Auras>");
            SW.WriteLine("</data>");
            SW.Close();
        }

        public void save()
        {
            save("./Profiles/" + m_Name + ".xml");
        }

    }
}
