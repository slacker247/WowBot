using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace WowBot
{
    class Spell
    {
        protected String m_Name = "";
        protected int m_Rank = 0;
        protected int m_PowerCost = 0;
        protected bool m_IsFunnel = false;
        protected String m_PowerType = "";
        protected int m_CastingTime = 0;
        protected int m_MinRange = 0;
        protected int m_MaxRange = 0;
        protected bool m_IsAttackSpell = false;
        protected bool m_IsConsumableSpell = false;
        protected bool m_IsUsableSpell = false;
        protected bool m_IsPassiveSpell = false;
        public ArrayList m_Command = new ArrayList();

        public bool init()
        {
            bool status = false;
            return status;
        }

        public Spell()
        {
            init();
        }

        public Spell(String values)
        {
            init();
            String[] data = values.Split(';');
            for (int i = 1; i < data.Length; i++)
            {
                String[] item = data[i].Split(':');
                switch (item[0])
                {
                    case "Name":
                        setName(item[1]);
                        break;
                    case "Rank":
                        setRank(Convert.ToInt32(item[1]));
                        break;
                    case "powerCost":
                        setPowerCost(Convert.ToInt32(item[1]));
                        break;
                    case "castingTime":
                        setCastingTime(Convert.ToInt32(item[1]));
                        break;
                    case "minRange":
                        setMinRange(Convert.ToInt32(item[1]));
                        break;
                    case "maxRange":
                        setMaxRange(Convert.ToInt32(item[1]));
                        break;
                    case "isAttackSpell":
                        setIsAttackSpell(Convert.ToBoolean(item[1]));
                        break;
                    case "isConsumableSpell":
                        setIsConsumableSpell(Convert.ToBoolean(item[1]));
                        break;
                    case "isUsableSpell":
                        setIsUsableSpell(Convert.ToBoolean(item[1]));
                        break;
                    case "isPassiveSpell":
                        setIsPassiveSpell(Convert.ToBoolean(item[1]));
                        break;
                    case "isFunnel":
                        setIsFunnel(Convert.ToBoolean(item[1]));
                        break;
                    case "powerType":
                        setPowerType(item[1]);
                        break;
                }
            }
        }

        public String getName()
        {
            return m_Name;
        }

        public bool setName(String name)
        {
            bool status = false;
            String old = m_Name;
            m_Name = name;
            //pcs.firePropertyChange("Name", old,
            //                       m_Name);
            return status;
        }

        public bool setRank(int rank)
        {
            bool status = false;
            int old = m_Rank;
            m_Rank = rank;
            //pcs.firePropertyChange("Rank", old,
            //                       m_Rank);
            return status;
        }

        public int getRank()
        {
            return m_Rank;
        }

        public bool setPowerCost(int cost)
        {
            bool status = false;
            int old = m_PowerCost;
            m_PowerCost = cost;
            //pcs.firePropertyChange("PowerCost", old,
            //                       m_PowerCost);
            return status;
        }

        public int getPowerCost()
        {
            return m_PowerCost;
        }

        public bool setIsFunnel(bool si)
        {
            bool status = false;
            bool old = m_IsFunnel;
            m_IsFunnel = si;
            //pcs.firePropertyChange("IsFunnel", old,
            //                       m_IsFunnel);
            return status;
        }

        public bool isFunnel()
        {
            return m_IsFunnel;
        }

        public bool setPowerType(String type)
        {
            bool status = false;
            String old = m_PowerType;
            m_PowerType = type;
            //pcs.firePropertyChange("PowerType", old,
            //                       m_PowerType);
            return status;
        }

        public String getPowerType()
        {
            return m_PowerType;
        }

        public bool setCastingTime(int time)
        {
            bool status = false;
            int old = m_CastingTime;
            m_CastingTime = time;
            //pcs.firePropertyChange("CastingTime", old,
            //                       m_CastingTime);
            return status;
        }

        public int getCastingTime()
        {
            return m_CastingTime;
        }

        public bool setMinRange(int range)
        {
            bool status = false;
            int old = m_MinRange;
            m_MinRange = range;
            //pcs.firePropertyChange("MinRange", old,
            //                       m_MinRange);
            return status;
        }

        public int getMinRange()
        {
            return m_MinRange;
        }

        public bool setMaxRange(int range)
        {
            bool status = false;
            int old = m_MaxRange;
            m_MaxRange = range;
            //pcs.firePropertyChange("MaxRange", old,
            //                       m_MaxRange);
            return status;
        }

        public int getMaxRange()
        {
            return m_MaxRange;
        }

        public bool setIsAttackSpell(bool si)
        {
            bool status = false;
            bool old = m_IsAttackSpell;
            m_IsAttackSpell = si;
            //pcs.firePropertyChange("IsAttackSpell", old,
            //                       m_IsAttackSpell);
            return status;
        }

        public bool isAttackSpell()
        {
            return m_IsAttackSpell;
        }

        public bool setIsConsumableSpell(bool si)
        {
            bool status = false;
            bool old = m_IsConsumableSpell;
            m_IsConsumableSpell = si;
            //pcs.firePropertyChange("IsConsumableSpell", old,
            //                       m_IsConsumableSpell);
            return status;
        }

        public bool isConsumableSpell()
        {
            return m_IsConsumableSpell;
        }

        public bool setIsUsableSpell(bool si)
        {
            bool status = false;
            bool old = m_IsUsableSpell;
            m_IsUsableSpell = si;
            //pcs.firePropertyChange("IsUsableSpell", old,
            //                       m_IsUsableSpell);
            return status;
        }

        public bool isUsableSpell()
        {
            return m_IsUsableSpell;
        }

        public bool setIsPassiveSpell(bool si)
        {
            bool status = false;
            bool old = m_IsPassiveSpell;
            m_IsPassiveSpell = si;
            //pcs.firePropertyChange("IsPassiveSpell", old,
             //                      m_IsPassiveSpell);
            return status;
        }

        public bool isPassiveSpell()
        {
            return m_IsPassiveSpell;
        }

        public override String ToString()
        {
            String spell = "";
            spell += "Name: " + m_Name + "\n";
            spell += "Rank: " + m_Rank + "\n";
            spell += "Power Cost: " + m_PowerCost + "\n";
            spell += "Is Funnel: " + m_IsFunnel + "\n";
            spell += "Power Type: " + m_PowerType + "\n";
            spell += "Casting Time: " + m_CastingTime + "\n";
            spell += "Minimum Range: " + m_MinRange + "\n";
            spell += "Max Range: " + m_MaxRange + "\n";
            spell += "Is Attack Spell: " + m_IsAttackSpell + "\n";
            spell += "Is Consumable Spell: " + m_IsConsumableSpell + "\n";
            spell += "Is Usable Spell: " + m_IsUsableSpell + "\n";
            spell += "Is Passive Spell: " + m_IsPassiveSpell + "\n";
            return spell;
        }

        public void addCommand(string p)
        {
            m_Command.Add(p);
        }
    }
}
