From: Noam Camus <noamca@mellanox.com>
Subject: RE: [PATCH v2 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Tue, 8 Nov 2016 08:30:03 +0000
Message-ID: <DB6PR0501MB25184EFB9A5CFD3AA41CFDC1AAA60@DB6PR0501MB2518.eurprd05.prod.outlook.com>
References: <1477224748-25223-1-git-send-email-noamca@mellanox.com>
 <1477224748-25223-4-git-send-email-noamca@mellanox.com>
 <20161031105251.GD1506@mai>
 <DB6PR0501MB2518720A0F95ACBBBCB1CB27AAAE0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
 <20161101200141.GF1506@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161101200141.GF1506@mai>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
List-Id: devicetree@vger.kernel.org

> From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org]=20
> Sent: Tuesday, November 1, 2016 10:02 PM
...
>Assuming cpu0 and cpu1 are sibling, does

>taskset 0x1 time sleep 2 & taskset 0x2 time sleep 3

I will use 16,17 instead of 0,1
>give a correct result without a dmesg log ?
[root@192.168.8.2 /]$ [root@192.168.8.2 /]$ taskset 65536 time sleep 2 & ta=
skset 131072 time sleep 3
real    0m 2.54s
user    0m 0.04s
sys     0m 0.14s
real    0m 3.47s
user    0m 0.00s
sys     0m 0.15s
[1]+  Done                       taskset 65536 time sleep 2

Seem OK to me.

> Can you give the content of the /proc/timer_list ?
[root@192.168.8.2 /]$ cat /proc/timer_list
Timer List Version: v0.8
HRTIMER_MAX_CLOCK_BASES: 4
now at 2421277626774 nsecs

cpu: 0
 clock 0:
  .base:       9fccb540
  .index:      0
  .resolution: 1 nsecs
  .get_time:   ktime_get
  .offset:     0 nsecs
active timers:
 #0: <9fccb69c>, tick_sched_timer, S:01
 # expires at 2421140000000-2421140000000 nsecs [in -137626774 to -13762677=
4 nsecs]
 clock 1:
  .base:       9fccb560
  .index:      1
  .resolution: 1 nsecs
  .get_time:   ktime_get_real
  .offset:     0 nsecs
active timers:
 clock 2:
  .base:       9fccb580
  .index:      2
  .resolution: 1 nsecs
  .get_time:   ktime_get_boottime
  .offset:     0 nsecs
active timers:
 clock 3:
  .base:       9fccb5a0
  .index:      3
  .resolution: 1 nsecs
  .get_time:   ktime_get_clocktai
  .offset:     0 nsecs
active timers:
  .expires_next   : 2421140000000 nsecs
  .hres_active    : 1
  .nr_events      : 615427
  .nr_retries     : 10052
  .nr_hangs       : 37
  .max_hang_time  : 682411010
  .nohz_mode      : 2
  .last_tick      : 0 nsecs
  .tick_stopped   : 0
  .idle_jiffies   : 0
  .idle_calls     : 0
  .idle_sleeps    : 0
  .idle_entrytime : 2421131605769 nsecs
  .idle_waketime  : 0 nsecs
  .idle_exittime  : 0 nsecs
  .idle_sleeptime : 1900903609165 nsecs
  .iowait_sleeptime: 0 nsecs
  .last_jiffies   : 0
  .next_timer     : 0
  .idle_expires   : 0 nsecs
jiffies: 212114

cpu: 16
 clock 0:
  .base:       9fcd7540
  .index:      0
  .resolution: 1 nsecs
  .get_time:   ktime_get
  .offset:     0 nsecs
active timers:
 clock 1:
  .base:       9fcd7560
  .index:      1
  .resolution: 1 nsecs
  .get_time:   ktime_get_real
  .offset:     0 nsecs
active timers:
 clock 2:
  .base:       9fcd7580
  .index:      2
  .resolution: 1 nsecs
  .get_time:   ktime_get_boottime
  .offset:     0 nsecs
active timers:
 clock 3:
  .base:       9fcd75a0
  .index:      3
  .resolution: 1 nsecs
  .get_time:   ktime_get_clocktai
  .offset:     0 nsecs
active timers:
  .expires_next   : 9223372036854775807 nsecs
  .hres_active    : 1
  .nr_events      : 18
  .nr_retries     : 1
  .nr_hangs       : 0
  .max_hang_time  : 0
  .nohz_mode      : 2
  .last_tick      : 2410120000000 nsecs
  .tick_stopped   : 1
  .idle_jiffies   : 211017
  .idle_calls     : 27
  .idle_sleeps    : 27
  .idle_entrytime : 2410189597725 nsecs
  .idle_waketime  : 2410189342725 nsecs
  .idle_exittime  : 2410110197721 nsecs
  .idle_sleeptime : 2408852044732 nsecs
  .iowait_sleeptime: 0 nsecs
  .last_jiffies   : 211019
  .next_timer     : 9223372036854775807
  .idle_expires   : 9223372036854775807 nsecs
jiffies: 212114

cpu: 17
 clock 0:
  .base:       9fce3540
  .index:      0
  .resolution: 1 nsecs
  .get_time:   ktime_get
  .offset:     0 nsecs
active timers:
 clock 1:
  .base:       9fce3560
  .index:      1
  .resolution: 1 nsecs
  .get_time:   ktime_get_real
  .offset:     0 nsecs
active timers:
 clock 2:
  .base:       9fce3580
  .index:      2
  .resolution: 1 nsecs
  .get_time:   ktime_get_boottime
  .offset:     0 nsecs
active timers:
 clock 3:
  .base:       9fce35a0
  .index:      3
  .resolution: 1 nsecs
  .get_time:   ktime_get_clocktai
  .offset:     0 nsecs
active timers:
  .expires_next   : 9223372036854775807 nsecs
  .hres_active    : 1
  .nr_events      : 22
  .nr_retries     : 1
  .nr_hangs       : 0
  .max_hang_time  : 0
  .nohz_mode      : 2
  .last_tick      : 2412120000000 nsecs
  .tick_stopped   : 1
  .idle_jiffies   : 211212
  .idle_calls     : 32
  .idle_sleeps    : 32
  .idle_entrytime : 2412123353729 nsecs
  .idle_waketime  : 2412123049733 nsecs
  .idle_exittime  : 2412110161733 nsecs
  .idle_sleeptime : 2410832354720 nsecs
  .iowait_sleeptime: 0 nsecs
  .last_jiffies   : 211213
  .next_timer     : 9223372036854775807
  .idle_expires   : 9223372036854775807 nsecs
jiffies: 212114

Tick Device: mode:     1
Per CPU device: 0
Clock Event Device: ARC Timer0
 max_delta_ns:   51539607733
 min_delta_ns:   1000
 mult:           178956970
 shift:          31
 mode:           3
 next_event:     2421140000000 nsecs
 set_next_event: arc_clkevent_set_next_event
 periodic: arc_clkevent_set_periodic
 event_handler:  hrtimer_interrupt
 retries:        0

Tick Device: mode:     1
Per CPU device: 16
Clock Event Device: ARC Timer0
 max_delta_ns:   51539607733
 min_delta_ns:   1000
 mult:           178956970
 shift:          31
 mode:           3
 next_event:     9223372036854775807 nsecs
 set_next_event: arc_clkevent_set_next_event
 periodic: arc_clkevent_set_periodic
 event_handler:  hrtimer_interrupt
 retries:        2

Tick Device: mode:     1
Per CPU device: 17
Clock Event Device: ARC Timer0
 max_delta_ns:   51539607733
 min_delta_ns:   1000
 mult:           178956970
 shift:          31
 mode:           3
 next_event:     9223372036854775807 nsecs
 set_next_event: arc_clkevent_set_next_event
 periodic: arc_clkevent_set_periodic
 event_handler:  hrtimer_interrupt
 retries:        2

-Noam
