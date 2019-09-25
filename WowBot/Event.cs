using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

namespace WowBot
{
    class Event
    {
        public TimeSpan timer;
        public ArrayList Actions = new ArrayList();
        public long TimeSinceLastExe = 99999999999999;
    }
}
