using System;
using System.Collections.Generic;
using System.Text;

namespace WowBot
{
    class Buff
    {
        protected String m_Name = "";
        protected bool m_IsPlayers = false;
        protected float m_ExpTime = 0f;
        protected String m_DebuffType = "";
        protected String m_Rank = "";
        protected int m_Count = 0;
        protected float m_Duration = 0f;
        protected bool m_IsStealable = false;

        public bool init()
        {
            bool status = false;
            return status;
        }

        public Buff()
        {
        }

        public Buff(String values)
        {
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
                        setRank(item[1]);
                        break;
                    case "Count":
                        setCount(Convert.ToInt32(item[1]));
                        break;
                    case "debuffType":
                        setDebuffType(item[1]);
                        break;
                    case "duration":
                        setDuration((float)Convert.ToDouble(item[1]));
                        break;
                    case "expTime":
                        setExpTime((float)Convert.ToDouble(item[1]));
                        break;
                    case "isMine":
                        if (item[1].Equals("1"))
                            setIsPlayers(true);
                        else
                            setIsPlayers(false);
                        break;
                    case "isStealable":
                        if (item[1].Equals("1"))
                            setIsStealable(true);
                        else
                            setIsStealable(false);
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
             //                      m_Name);
            return status;
        }

        public bool isPlayers()
        {
            return m_IsPlayers;
        }

        public bool setIsPlayers(bool si)
        {
            bool status = false;
            bool old = m_IsPlayers;
            m_IsPlayers = si;
            //pcs.firePropertyChange("PlayersBuff", old,
             //                      m_IsPlayers);
            return status;
        }

        public float getExpTime()
        {
            return m_ExpTime;
        }

        public bool setExpTime(float time)
        {
            bool status = false;
            float old = m_ExpTime;
            m_ExpTime = time;
            //pcs.firePropertyChange("ExpTime", old,
             //                      m_ExpTime);
            return status;
        }

        public String getDebuffType()
        {
            return m_DebuffType;
        }

        public bool setDebuffType(String type)
        {
            bool status = false;
            String old = m_DebuffType;
            m_DebuffType = type;
            //pcs.firePropertyChange("DebuffType", old,
            //                       m_DebuffType);
            return status;
        }

        public String getRank()
        {
            return m_Rank;
        }

        public bool setRank(String rank)
        {
            bool status = false;
            String old = m_Rank;
            m_Rank = rank;
            //pcs.firePropertyChange("BuffRank", old,
            //                       m_Rank);
            return status;
        }

        public int getCount()
        {
            return m_Count;
        }

        public bool setCount(int count)
        {
            bool status = false;
            int old = m_Count;
            m_Count = count;
            //pcs.firePropertyChange("BuffCount", old,
             //                      m_Count);
            return status;
        }

        public float getDuration()
        {
            return m_Duration;
        }

        public bool setDuration(float duration)
        {
            bool status = false;
            float old = m_Duration;
            m_Duration = duration;
            //pcs.firePropertyChange("BuffDuration", old,
            //                       m_Duration);
            return status;
        }

        public bool isStealable()
        {
            return m_IsStealable;
        }

        public bool setIsStealable(bool stealable)
        {
            bool status = false;
            bool old = m_IsStealable;
            m_IsStealable = stealable;
            //pcs.firePropertyChange("IsStealable", old,
            //                       m_IsStealable);
            return status;
        }

        public String ToString()
        {
            String buff = "";
            buff += "Name: " + m_Name + "\n";
            buff += "Is Players: " + m_IsPlayers + "\n";
            buff += "Experation Time: " + m_ExpTime + "\n";
            buff += "Debuff Type: " + m_DebuffType + "\n";
            buff += "Rank: " + m_Rank + "\n";
            buff += "Count: " + m_Count + "\n";
            buff += "Duraction: " + m_Duration + "\n";
            buff += "Is Stealable: " + m_IsStealable + "\n";
            return buff;
        }
    }
}
