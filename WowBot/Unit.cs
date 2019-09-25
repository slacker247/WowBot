using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace WowBot
{
    class Unit
    {
        protected String m_Name = "";
        protected int m_Level = 0;
        protected int m_MaxHealth = 0;
        protected int m_CurrentHealth = 0;
        protected int m_MaxPower = 0;
        protected int m_CurrentPower = 0;
        protected Hashtable m_Buffs = new Hashtable();
        protected Hashtable m_DeBuffs = new Hashtable();
        protected Hashtable m_Spells = new Hashtable();
        protected String m_State = "";
        protected String m_DefaultState = "";
        protected String m_PowerType = "";
        protected bool m_IsPlayer = false;
        protected bool m_InCombat = false;

        public bool init()
        {
            bool status = false;
            m_DefaultState = "Standing";
            return status;
        }

        public Unit()
        {
            init();
        }

        public Unit(String values)
        {
            init();
            values = values.Substring(1, values.Length - 2);
            setState(m_DefaultState);

            String[] data = values.Split(';');
            for (int i = 1; i < data.Length; i++)
            {
                String[] item = data[i].Split(':');
                switch (item[0])
                {
                    case "Name":
                        setName(item[1]);
                        break;
                    case "Level":
                        setLevel(Convert.ToInt32(item[1]));
                        break;
                    case "Mounted":
                        if (item[1].Equals("1"))
                            setState("Mounted");
                        break;
                    case "Swimming":
                        if (item[1].Equals("1"))
                            setState("Swimming");
                        break;
                    case "cHealth":
                        setCurrentHealth(Convert.ToInt32(item[1]));
                        break;
                    case "mHealth":
                        setMaxHealth(Convert.ToInt32(item[1]));
                        break;
                    case "cPower":
                        setCurrentPower(Convert.ToInt32(item[1]));
                        break;
                    case "mPower":
                        setMaxPower(Convert.ToInt32(item[1]));
                        break;
                    case "PowerType":
                        setPowerType(item[1]);
                        break;
                    case "isPlayer":
                        if (item[1].Equals("1"))
                            setIsPlayer(true);
                        else
                            setIsPlayer(false);
                        break;
                    case "Combat":
                        if (item[1].Equals("1"))
                            setInCombat(true);
                        else
                            setInCombat(false);
                        break;
                }
            }
        }

        public bool isSwimming()
        {
            if (m_State.Equals("Swimming"))
                return true;
            else
                return false;
        }

        public bool isMounted()
        {
            if (m_State.Equals("Mounted"))
                return true;
            else
                return false;
        }

        public bool setName(String name)
        {
            bool status = false;
            String old = m_Name;
            m_Name = name;
            //pcs.firePropertyChange("Name", old,
             //                      m_Name);
            return status;
        }

        public String getName()
        {
            return m_Name;
        }

        public bool setLevel(int level)
        {
            bool status = false;
            int old = m_Level;
            m_Level = level;
            //pcs.firePropertyChange("Level", old,
            //                       m_Level);
            return status;
        }

        public int getLevel()
        {
            return m_Level;
        }

        public bool setMaxHealth(int maxHealth)
        {
            bool status = false;
            int old = m_MaxHealth;
            m_MaxHealth = maxHealth;
            //pcs.firePropertyChange("MaxHealth", old,
            //                       m_MaxHealth);
            return status;
        }

        public int getMaxHealth()
        {
            return m_MaxHealth;
        }

        public bool setCurrentHealth(int currentHealth)
        {
            bool status = false;
            int old = m_CurrentHealth;
            m_CurrentHealth = currentHealth;
            //pcs.firePropertyChange("CurrentHealth", old,
            //                       m_CurrentHealth);
            return status;
        }

        public int getCurrentHealth()
        {
            return m_CurrentHealth;
        }

        public bool setMaxPower(int maxPower)
        {
            bool status = false;
            int old = m_MaxPower;
            m_MaxPower = maxPower;
            //pcs.firePropertyChange("MaxPower", old,
            //                       m_MaxPower);
            return status;
        }

        public int getMaxPower()
        {
            return m_MaxPower;
        }

        public bool setCurrentPower(int currentPower)
        {
            bool status = false;
            int old = m_CurrentPower;
            m_CurrentPower = currentPower;
            //pcs.firePropertyChange("CurrentPower", old,
            //                       m_CurrentPower);
            return status;
        }

        public int getCurrentPower()
        {
            return m_CurrentPower;
        }

        public bool setState(String state)
        {
            bool status = false;
            String old = m_State;
            m_State = state;
            //pcs.firePropertyChange("State", old,
            //                       m_State);
            return status;
        }

        public String getState()
        {
            return m_State;
        }

        public bool updateBuffs(String buffs)
        {
            bool status = false;
            buffs = buffs.Substring(1, buffs.Length - 2);
            Hashtable old = m_Buffs;
            m_Buffs.Clear();
            String[] values = buffs.Split('|');
            for(int i = 1; i < values.Length; i++)
            {
                Buff b = new Buff(values[i]);
                m_Buffs.Add(b.getName(), b);
            }
            //pcs.firePropertyChange("Buffs", old,
            //                       m_Buffs);
            return status;
        }

        public bool hasBuff(String buff)
        {
            bool test = m_Buffs.ContainsKey(buff);
            return test;
        }

        public bool updateDeBuffs(String deBuffs)
        {
            bool status = false;
            Hashtable old = m_DeBuffs;
            m_DeBuffs.Clear();
            String[] values = deBuffs.Split('|');
            for(int i = 1; i < values.Length; i++)
            {
                Buff b = new Buff(values[i]);
                m_DeBuffs.Add(b.getName(), b);
            }
            //pcs.firePropertyChange("DeBuffs", old,
            //                       m_DeBuffs);
            return status;
        }

        public bool hasDeBuffs()
        {
            bool status = false;
            if (m_DeBuffs.Count > 0)
                status = true;
            return status;
        }

        public bool updateSpells(String spells)
        {
            bool status = false;
            Hashtable old = m_Spells;
            m_Spells.Clear();
            String[] values = spells.Split('|');
            for(int i = 1; i < values.Length; i++)
            {
                Spell s = new Spell(values[i]);
                m_Spells.Add(s.getName(), s);
            }
            //pcs.firePropertyChange("Spells", old,
            //                       m_Spells);
            return status;
        }

        public bool canCast(String spell)
        {
            if(getState().Equals("Mounted"))
                return false;
            if(m_Spells.ContainsKey(spell))
            {
                Spell s = (Spell)m_Spells[spell];
                if(s.getPowerCost() < getCurrentPower() &&
                   s.isUsableSpell())
                {
                    return true;
                }
            }
            //if(!m_Buffs.ContainsKey(spell))
            //    return true;
            return false;
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

        public bool setIsPlayer(bool si)
        {
            bool status = false;
            bool old = m_IsPlayer;
            m_IsPlayer = si;
            //pcs.firePropertyChange("IsPlayer", old,
            //                       m_IsPlayer);
            return status;
        }

        public bool isPlayer()
        {
            return m_IsPlayer;
        }

        public bool setInCombat(bool si)
        {
            bool status = false;
            bool old = m_InCombat;
            m_InCombat = si;
            //pcs.firePropertyChange("InCombat", old,
            //                       m_InCombat);
            return status;
        }

        public bool inCombat()
        {
            return m_InCombat;
        }

        public String ToString()
        {
            String unit = "";
            unit += "Name: " + getName() + "\n";
            unit += "Level: " + getLevel() + "\n";
            unit += "State: " + getState() + "\n";
            unit += "Current Health: " + getCurrentHealth() + "\n";
            unit += "Max Health: " + getMaxHealth() + "\n";
            unit += "Current Power: " + getCurrentPower() + "\n";
            unit += "Max Power: " + getMaxPower() + "\n";
            unit += "Power Type: " + getPowerType() + "\n";
            unit += "Is Player: " + isPlayer() + "\n";
            unit += "In Combat: " + inCombat() + "\n";
            unit += "Buffs:\n";
            foreach(Buff b in m_Buffs.Values)
                unit += b.ToString() + "\n";
            unit += "DeBuffs:\n";
            foreach (Buff db in m_DeBuffs.Values)
                unit += db.ToString() + "\n";
            unit += "Spells:\n";
            foreach (Spell s in m_Spells.Values)
                unit += s.ToString() + "\n";

            return unit;
        }
    }
}
