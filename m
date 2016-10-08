From: Rich Felker <dalias@libc.org>
Subject: Re: [PATCH v7 2/2] clocksource: add J-Core timer/clocksource driver
Date: Fri, 7 Oct 2016 21:32:10 -0400
Message-ID: <20161008013210.GX19318@brightrain.aerifal.cx>
References: <cover.1474693319.git.dalias@libc.org>
 <22c1ee0f908fe3bf8b70f5e87d659ceb29af1434.1474693319.git.dalias@libc.org>
 <20160926210716.GA12855@brightrain.aerifal.cx>
 <4b02ba7d-4a31-297a-bbbd-be26da615e7b@linaro.org>
 <20160926222352.GE19318@brightrain.aerifal.cx>
 <alpine.DEB.2.20.1609261936130.4915@nanos>
 <20160927004258.GF19318@brightrain.aerifal.cx>
 <20160927220820.GH19318@brightrain.aerifal.cx>
 <alpine.DEB.2.20.1609301319410.4799@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1609301319410.4799@nanos>
Sender: linux-sh-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 30, 2016 at 03:15:11PM +0200, Thomas Gleixner wrote:
> On Tue, 27 Sep 2016, Rich Felker wrote:
> > I've managed to get a trace with a stall. I'm not sure what the best
> > way to share the full thing is, since it's large, but here are the
> > potentially interesting parts.
> 
> Upload it somewhere.
>  
> > The first is a big time gap with no events, from 82.446093 to
> > 109.852709:
> > 
> 
> >           <idle>-0     [001] d.h.    82.443398: irq_handler_entry: irq=16 name=jcore_pit
> >           <idle>-0     [001] d.h.    82.443573: hrtimer_cancel: hrtimer=109f449c
> >           <idle>-0     [001] d.h.    82.443689: hrtimer_expire_entry: hrtimer=109f449c function=tick_sched_timer now=82356112320
> 
> Tick timer expires
> 
> >           <idle>-0     [001] d.h.    82.443911: softirq_raise: vec=1 [action=TIMER]
> >           <idle>-0     [001] d.h.    82.444089: softirq_raise: vec=9 [action=RCU]
> >           <idle>-0     [001] d.h.    82.444306: softirq_raise: vec=7 [action=SCHED]
> 
> Raises softirqs
> 
> >           <idle>-0     [001] d.h.    82.444448: hrtimer_expire_exit: hrtimer=109f449c
> >           <idle>-0     [001] d.h.    82.444592: hrtimer_start: hrtimer=109f449c function=tick_sched_timer expires=82360000000 softexpires=82360000000
> 
> Rearms the next period
> 
> >           <idle>-0     [001] d.h.    82.444821: irq_handler_exit: irq=16 ret=handled
> >           <idle>-0     [001] ..s.    82.445034: softirq_entry: vec=1 [action=TIMER]
> >           <idle>-0     [001] ..s.    82.445222: softirq_exit: vec=1 [action=TIMER]
> >           <idle>-0     [001] ..s.    82.445341: softirq_entry: vec=7 [action=SCHED]
> >           <idle>-0     [001] ..s.    82.445745: softirq_exit: vec=7 [action=SCHED]
> >           <idle>-0     [001] ..s.    82.445880: softirq_entry: vec=9 [action=RCU]
> >           <idle>-0     [001] ..s.    82.446093: softirq_exit: vec=9 [action=RCU]
> 
> Softirqs done and the machine vanishes into lala land ....
> 
> And now after that gap we have a cancel/start on CPU 0
> 
> >           <idle>-0     [000] dn..   109.852709: hrtimer_cancel: hrtimer=109e949c
> >           <idle>-0     [000] dn..   109.853043: hrtimer_start: hrtimer=109e949c function=tick_sched_timer expires=109770000000 softexpires=109770000000
> 
> >               sh-388   [000] d.h.   109.855851: irq_handler_entry: irq=18 name=uartlite
> >               sh-388   [000] d.h.   109.856751: irq_handler_exit: irq=18 ret=handled
> >               sh-388   [000] d.h.   109.857264: irq_handler_entry: irq=18 name=uartlite
> >               sh-388   [000] d.h.   109.857458: irq_handler_exit: irq=18 ret=unhandled
> >           <idle>-0     [001] d.h.   109.857684: irq_handler_entry: irq=16 name=jcore_pit
> >           <idle>-0     [001] d.h.   109.857934: hrtimer_cancel: hrtimer=109f449c
> >           <idle>-0     [001] d.h.   109.858087: hrtimer_expire_entry: hrtimer=109f449c function=tick_sched_timer now=109770452820
> 
> And this expiry happens on CPU 1, but the expiry time looks like the one
> which got armed on CPU 0 above !?!?!
> 
> >           <idle>-0     [001] d.h.   109.858639: softirq_raise: vec=1 [action=TIMER]
> >           <idle>-0     [001] d.h.   109.858839: softirq_raise: vec=9 [action=RCU]
> >           <idle>-0     [001] d.h.   109.859097: softirq_raise: vec=7 [action=SCHED]
> >           <idle>-0     [001] d.h.   109.859282: hrtimer_expire_exit: hrtimer=109f449c
> >           <idle>-0     [001] d.h.   109.859428: hrtimer_start: hrtimer=109f449c function=tick_sched_timer expires=109780000000 softexpires=109780000000
> >           <idle>-0     [001] d.h.   109.859637: irq_handler_exit: irq=16 ret=handled
> >           <idle>-0     [001] ..s.   109.859806: softirq_entry: vec=1 [action=TIMER]
> >           <idle>-0     [001] ..s.   109.859984: softirq_exit: vec=1 [action=TIMER]
> >           <idle>-0     [001] ..s.   109.860098: softirq_entry: vec=7 [action=SCHED]
> >           <idle>-0     [001] ..s.   109.860533: softirq_exit: vec=7 [action=SCHED]
> >           <idle>-0     [001] ..s.   109.860663: softirq_entry: vec=9 [action=RCU]
> >           <idle>-0     [001] .ns.   109.861424: softirq_exit: vec=9 [action=RCU]
> >               sh-388   [000] d.h.   109.861831: irq_handler_entry: irq=16 name=jcore_pit
> >               sh-388   [000] d.h.   109.862071: hrtimer_cancel: hrtimer=109e949c
> >        rcu_sched-7     [001] ....   109.862141: timer_init: timer=160a9eb0
> >               sh-388   [000] d.h.   109.862233: hrtimer_expire_entry: hrtimer=109e949c function=tick_sched_timer now=109774586740
> 
> And CPU0 has it's timer firing 4.5ms late .....
> 
> >        rcu_sched-7     [001] d...   109.862317: timer_start: timer=160a9eb0 function=process_timeout expires=4294948275 [timeout=1] flags=0x00000001
> > 
> > However no stall message appeared on the console here, and I suspect
> > it might have just been a gap in event recording because it doesn't
> > look terribly suspicious. At first I thought (and discussed with
> 
> Well. If there are gaps in the traces then decoding this is going to be a
> nightmare.
> 
> > Daniel off-list) that the hrtimer_cancel at the end of the long gap
> > might have been spinning for the whole time, but this does not match
> > the behavior of the stalls I'm observing waith tracing off; by hooking
> 
> Why would it spinning? There is no way that the callback of the tick timer
> runs when cancel is called. It's cpu local.....
> 
> > up LED output in the hrtimer_cancel code paths, I see rapid bursts of
> > successful hrtimer_cancel (no repeated hrtimer_try_to_cancel looping)
> > leading up to the rcu_sched stall message. That matches with what I'm
> > seeing later in the event log, between 109s and 132s where the stall
> > occurred:
> > 
> >           <idle>-0     [000] d.h.   109.946127: irq_handler_entry: irq=16 name=jcore_pit
> >           <idle>-0     [000] d.h.   109.946339: hrtimer_cancel: hrtimer=109e949c
> >           <idle>-0     [000] d.h.   109.946486: hrtimer_expire_entry: hrtimer=109e949c function=tick_sched_timer now=109858865160
> >           <idle>-0     [000] d.h.   109.946714: softirq_raise: vec=1 [action=TIMER]
> >           <idle>-0     [000] d.h.   109.946918: softirq_raise: vec=9 [action=RCU]
> >           <idle>-0     [000] d.h.   109.947193: softirq_raise: vec=7 [action=SCHED]
> >           <idle>-0     [000] d.h.   109.947364: hrtimer_expire_exit: hrtimer=109e949c
> >           <idle>-0     [000] d.h.   109.947498: hrtimer_start: hrtimer=109e949c function=tick_sched_timer expires=109860000000 softexpires=109860000000
> >           <idle>-0     [000] d.h.   109.947736: hrtimer_cancel: hrtimer=109e949c
> >           <idle>-0     [000] d.h.   109.947887: hrtimer_expire_entry: hrtimer=109e949c function=tick_sched_timer now=109860266000
> >           <idle>-0     [000] d.h.   109.948394: softirq_raise: vec=1 [action=TIMER]
> >           <idle>-0     [000] d.h.   109.948600: softirq_raise: vec=9 [action=RCU]
> >           <idle>-0     [000] d.h.   109.948870: softirq_raise: vec=7 [action=SCHED]
> >           <idle>-0     [000] d.h.   109.949036: hrtimer_expire_exit: hrtimer=109e949c
> >           <idle>-0     [000] d.h.   109.949170: hrtimer_start: hrtimer=109e949c function=tick_sched_timer expires=109870000000 softexpires=109870000000
> >           <idle>-0     [000] d.h.   109.949389: irq_handler_exit: irq=16 ret=handled
> >           <idle>-0     [000] ..s.   109.949585: softirq_entry: vec=1 [action=TIMER]
> >           <idle>-0     [000] ..s.   109.949785: softirq_exit: vec=1 [action=TIMER]
> >           <idle>-0     [000] ..s.   109.949902: softirq_entry: vec=7 [action=SCHED]
> >           <idle>-0     [000] ..s.   109.950347: softirq_exit: vec=7 [action=SCHED]
> >           <idle>-0     [000] ..s.   109.950472: softirq_entry: vec=9 [action=RCU]
> >           <idle>-0     [000] ..s.   109.951089: softirq_exit: vec=9 [action=RCU]
> >           <idle>-0     [001] dn..   109.951213: hrtimer_cancel: hrtimer=109f449c
> >           <idle>-0     [001] dn..   109.951476: hrtimer_start: hrtimer=109f449c function=tick_sched_timer expires=109870000000 softexpires=109870000000
> >        rcu_sched-7     [001] d...   109.952030: timer_cancel: timer=160a9eb0
> >        rcu_sched-7     [001] ....   109.952478: timer_init: timer=160a9eb0
> >        rcu_sched-7     [001] d...   109.952633: timer_start: timer=160a9eb0 function=process_timeout expires=4294948284 [timeout=1] flags=0x00000001
> 
> So that should kick rcu_sched-7 in 10ms, latest 20ms from now and CPU1 goes
> into a NOHZ idle sleep.
> 
> >           <idle>-0     [001] d...   109.953436: tick_stop: success=1 dependency=NONE
> >           <idle>-0     [001] d...   109.953617: hrtimer_cancel: hrtimer=109f449c
> >           <idle>-0     [001] d...   109.953818: hrtimer_start: hrtimer=109f449c function=tick_sched_timer expires=109880000000 softexpires=109880000000
> 
> which is (using the 0.087621us delta between the trace clock and clock
> MONO) at: 109.880 + 0.087621 = 109.968
> 
> Which is about correct as we expect the RCU timer to fire at:
>       
>       109.952633 + 0.01 = 109.963633
> 
> or latest at
> 
>       109.952633 + 0.02 = 109.983633
>    
> There is another caveat. That nohz stuff can queue the rcu timer on CPU0, which
> it did not because:
> 
> >        rcu_sched-7     [001] d...   109.952633: timer_start: timer=160a9eb0 function=process_timeout expires=4294948284 [timeout=1] flags=0x00000001
> 
> The CPU nr encoded in flags is: 1
> 
> Now we cancel and restart the timer w/o seing the interrupt expiring
> it. And that expiry should have happened at 109.968000 !?!
> 
> >           <idle>-0     [001] d...   109.968225: hrtimer_cancel: hrtimer=109f449c
> >           <idle>-0     [001] d...   109.968526: hrtimer_start: hrtimer=109f449c function=tick_sched_timer expires=109890000000 softexpires=109890000000
> 
> So this advances the next tick even further out. And CPU 0 sets the timer to
> the exact smae value:
> 
> >           <idle>-0     [000] d.h.   109.969104: hrtimer_start: hrtimer=109e949c function=tick_sched_timer expires=109890000000 softexpires=109890000000
> 
> 
> >           <idle>-0     [000] d.h.   109.977690: irq_handler_entry: irq=16 name=jcore_pit
> >           <idle>-0     [000] d.h.   109.977911: hrtimer_cancel: hrtimer=109e949c
> >           <idle>-0     [000] d.h.   109.978053: hrtimer_expire_entry: hrtimer=109e949c function=tick_sched_timer now=109890434160
> 
> Which expires here. And CPU1 instead of getting an interrupt and expiring
> the timer does the cancel/restart to the next jiffie again:
> 
> >           <idle>-0     [001] d...   109.978206: hrtimer_cancel: hrtimer=109f449c
> >           <idle>-0     [001] d...   109.978495: hrtimer_start: hrtimer=109f449c function=tick_sched_timer expires=109900000000 softexpires=109900000000
> 
> And this repeats;
> 
> >           <idle>-0     [000] d.h.   109.987726: irq_handler_entry: irq=16 name=jcore_pit
> >           <idle>-0     [000] d.h.   109.987954: hrtimer_cancel: hrtimer=109e949c
> >           <idle>-0     [000] d.h.   109.988095: hrtimer_expire_entry: hrtimer=109e949c function=tick_sched_timer now=109900474620
> 
> >           <idle>-0     [001] d...   109.988243: hrtimer_cancel: hrtimer=109f449c
> >           <idle>-0     [001] d...   109.988537: hrtimer_start: hrtimer=109f449c fun9c
> 
> There is something badly wrong here.
> 
> >           <idle>-0     [000] ..s.   110.019443: softirq_entry: vec=1 [action=TIMER]
> >           <idle>-0     [000] ..s.   110.019617: softirq_exit: vec=1 [action=TIMER]
> >           <idle>-0     [000] ..s.   110.019730: softirq_entry: vec=7 [action=SCHED]
> >           <idle>-0     [000] ..s.   110.020174: softirq_exit: vec=7 [action=SCHED]
> >           <idle>-0     [000] d.h.   110.027674: irq_handler_entry: irq=16 name=jcore_pit
> > 
> > The rcu_sched process does not run again after the tick_stop until
> > 132s, and only a few RCU softirqs happen (all shown above). During
> > this time, cpu1 has no interrupt activity and nothing in the trace
> > except the above hrtimer_cancel/hrtimer_start pairs (not sure how
> > they're happening without any interrupts).
> 
> If you drop out of the arch idle into the core idle loop then you might end
> up with this. You want to add a few trace points or trace_printks() to the
> involved functions. tick_nohz_restart() tick_nohz_stop_sched_tick()
> tick_nohz_restart_sched_tick() and the idle code should be a good starting
> point.
>  
> > This pattern repeats until almost 131s, where cpu1 goes into a frenzy
> > of hrtimer_cancel/start:
> 
> It's not a frenzy. It's the same pattern as above. It arms the timer to the
> next tick, but that timer never ever fires. And it does that every tick ....
> 
> Please put a tracepoint into your set_next_event() callback as well. SO
> this changes here:

Here is a full log with added printk's of a stall:

http://sprunge.us/PgOZ

The relevant excerpt where the stall begins is:

       rcu_sched-7     [000] d...   150.828744: timer_start: timer=1636feac function=process_timeout expires=4294952380 [timeout=1] flags=0x00000000
       rcu_sched-7     [000] d...   150.828892: rcu_utilization: Start context switch
       rcu_sched-7     [000] d...   150.828988: rcu_grace_period: rcu_sched 51 cpuqs
       rcu_sched-7     [000] d...   150.829080: rcu_utilization: End context switch
       rcu_sched-7     [000] d...   150.829230: sched_stat_runtime: comm=rcu_sched pid=7 runtime=2813820 [ns] vruntime=10018192393 [ns]
       rcu_sched-7     [000] d...   150.829496: sched_switch: prev_comm=rcu_sched prev_pid=7 prev_prio=120 prev_state=S ==> next_comm=swapper/0 next_pid=0 next_prio=120
          <idle>-0     [000] d...   150.829698: __tick_nohz_idle_enter: can stop idle tick
          <idle>-0     [000] d...   150.829774: __tick_nohz_idle_enter: entering stop_sched_tick
          <idle>-0     [000] d...   150.830001: tick_stop: success=1 dependency=NONE
          <idle>-0     [000] d...   150.830127: hrtimer_cancel: hrtimer=109e949c
          <idle>-0     [000] d...   150.830380: jcore_pit_set_next_event: pit 109eccb0 0 set delta 82124660 en=4410000 cntr=75 throt=82124660
          <idle>-0     [000] d...   150.830498: hrtimer_start: hrtimer=109e949c function=tick_sched_timer expires=150840000000 softexpires=150840000000
          <idle>-0     [000] d...   150.830720: jcore_pit_set_next_event: pit 109eccb0 0 set delta 539823 en=4410000 cntr=34 throt=539823
          <idle>-0     [000] d...   150.830822: __tick_nohz_idle_enter: returning from stop_sched_tick
          <idle>-0     [000] d...   150.830940: rcu_dyntick: Start 140000000000000 0
          <idle>-0     [000] d...   150.831072: rcu_dyntick: End 0 1
          <idle>-0     [000] d...   150.831165: cpu_idle: state=0 cpu_id=0
          <idle>-0     [000] d...   150.831269: rcu_dyntick: Start 1 0
          <idle>-0     [000] ....   150.831368: cpu_startup_entry: enabled irqs, spinning
          <idle>-0     [001] d...   150.831491: rcu_dyntick: End 0 1
          <idle>-0     [001] d.h.   150.831704: irq_handler_entry: irq=16 name=jcore_pit
          <idle>-0     [001] d.h.   150.831855: hrtimer_cancel: hrtimer=109f449c
          <idle>-0     [001] d.h.   150.831965: hrtimer_expire_entry: hrtimer=109f449c function=tick_sched_timer now=150830402668
          <idle>-0     [001] d.h.   150.832075: tick_sched_do_timer: update jiffies via tick
          <idle>-0     [001] d.h.   150.832217: tick_do_update_jiffies64: finished do_timer(1)
          <idle>-0     [001] d.h.   150.832335: tick_do_update_jiffies64: finished updating jiffies
          <idle>-0     [001] d.h.   150.832462: softirq_raise: vec=1 [action=TIMER]
          <idle>-0     [001] d.h.   150.832566: rcu_utilization: Start scheduler-tick
          <idle>-0     [001] d.h.   150.832719: softirq_raise: vec=9 [action=RCU]
          <idle>-0     [001] d.h.   150.832811: rcu_utilization: End scheduler-tick
          <idle>-0     [001] d.h.   150.833012: softirq_raise: vec=7 [action=SCHED]
          <idle>-0     [001] d.h.   150.833146: hrtimer_expire_exit: hrtimer=109f449c
          <idle>-0     [001] d.h.   150.833244: hrtimer_start: hrtimer=109f449c function=tick_sched_timer expires=150840000000 softexpires=150840000000
          <idle>-0     [001] d.h.   150.833481: jcore_pit_set_next_event: pit 109f7cb0 1 set delta 402319 en=4410000 cntr=54 throt=402319
          <idle>-0     [001] d.h.   150.833583: irq_handler_exit: irq=16 ret=handled
          <idle>-0     [001] ..s.   150.833735: softirq_entry: vec=1 [action=TIMER]
          <idle>-0     [001] ..s.   150.833869: softirq_exit: vec=1 [action=TIMER]
          <idle>-0     [001] ..s.   150.833959: softirq_entry: vec=7 [action=SCHED]
          <idle>-0     [001] ..s.   150.834298: softirq_exit: vec=7 [action=SCHED]
          <idle>-0     [001] ..s.   150.834398: softirq_entry: vec=9 [action=RCU]
          <idle>-0     [001] ..s.   150.834494: rcu_utilization: Start RCU core
          <idle>-0     [001] d.s.   150.834628: rcu_future_grace_period: rcu_sched 51 50 52 0 0 1 Startleaf
          <idle>-0     [001] d.s.   150.834738: rcu_future_grace_period: rcu_sched 51 50 52 0 0 1 Startedleaf
          <idle>-0     [001] d.s.   150.834839: rcu_grace_period: rcu_sched 50 AccWaitCB
          <idle>-0     [001] d.s.   150.834931: rcu_grace_period: rcu_sched 51 cpustart
          <idle>-0     [001] ..s.   150.835062: rcu_utilization: End RCU core
          <idle>-0     [001] ..s.   150.835156: softirq_exit: vec=9 [action=RCU]
          <idle>-0     [001] d...   150.835304: __tick_nohz_idle_enter: entering stop_sched_tick
          <idle>-0     [001] d...   150.835399: __tick_nohz_idle_enter: returning from stop_sched_tick
          <idle>-0     [001] d...   150.835497: rcu_dyntick: Start 1 0
          <idle>-0     [001] d...   150.841525: rcu_dyntick: End 0 1
          <idle>-0     [000] d...   150.841530: rcu_dyntick: End 0 1
          <idle>-0     [000] d.s.   150.841724: tick_irq_enter: update jiffies via irq
          <idle>-0     [001] d.h.   150.841829: irq_handler_entry: irq=16 name=jcore_pit
          <idle>-0     [000] d.s.   150.841918: tick_do_update_jiffies64: finished do_timer(1)
          <idle>-0     [001] d.h.   150.842054: hrtimer_cancel: hrtimer=109f449c
          <idle>-0     [001] d.h.   150.842218: hrtimer_expire_entry: hrtimer=109f449c function=tick_sched_timer now=150840579940
          <idle>-0     [000] d.s.   150.842348: tick_do_update_jiffies64: finished updating jiffies
          <idle>-0     [001] d.h.   150.842382: tick_sched_do_timer: update jiffies via tick
          <idle>-0     [001] d.h.   150.842576: softirq_raise: vec=1 [action=TIMER]
          <idle>-0     [000] d...   150.842603: __tick_nohz_idle_enter: can stop idle tick
          <idle>-0     [000] d...   150.842700: __tick_nohz_idle_enter: entering stop_sched_tick
          <idle>-0     [001] d.h.   150.842718: rcu_utilization: Start scheduler-tick
          <idle>-0     [001] d.h.   150.842869: rcu_grace_period: rcu_sched 51 cpuqs
          <idle>-0     [000] d...   150.842937: tick_nohz_restart: restart
          <idle>-0     [001] d.h.   150.843051: softirq_raise: vec=9 [action=RCU]
          <idle>-0     [000] d...   150.843115: hrtimer_cancel: hrtimer=109e949c
          <idle>-0     [001] d.h.   150.843179: rcu_utilization: End scheduler-tick
          <idle>-0     [000] d...   150.843455: jcore_pit_set_next_event: pit 109eccb0 0 set delta 81472695 en=4410000 cntr=74 throt=81472695
          <idle>-0     [001] d.h.   150.843467: softirq_raise: vec=7 [action=SCHED]
          <idle>-0     [001] d.h.   150.843651: hrtimer_expire_exit: hrtimer=109f449c
          <idle>-0     [000] d...   150.843698: hrtimer_start: hrtimer=109e949c function=tick_sched_timer expires=150850000000 softexpires=150850000000
          <idle>-0     [001] d.h.   150.843789: hrtimer_start: hrtimer=109f449c function=tick_sched_timer expires=150850000000 softexpires=150850000000
          <idle>-0     [000] d...   150.844005: jcore_pit_set_next_event: pit 109eccb0 0 set delta 377377 en=4410000 cntr=42 throt=377377
          <idle>-0     [001] d.h.   150.844115: jcore_pit_set_next_event: pit 109f7cb0 1 set delta 372809 en=4410000 cntr=66 throt=372809
          <idle>-0     [000] d...   150.844132: tick_nohz_restart: return from restart
          <idle>-0     [000] d...   150.844240: __tick_nohz_idle_enter: returning from stop_sched_tick
          <idle>-0     [001] d.h.   150.844260: irq_handler_exit: irq=16 ret=handled
          <idle>-0     [000] d...   150.844377: rcu_dyntick: Start 1 0
          <idle>-0     [001] ..s.   150.844473: softirq_entry: vec=1 [action=TIMER]
          <idle>-0     [001] ..s.   150.844612: softirq_exit: vec=1 [action=TIMER]
          <idle>-0     [001] ..s.   150.844701: softirq_entry: vec=7 [action=SCHED]
          <idle>-0     [001] ..s.   150.845036: softirq_exit: vec=7 [action=SCHED]
          <idle>-0     [001] ..s.   150.845136: softirq_entry: vec=9 [action=RCU]
          <idle>-0     [001] ..s.   150.845231: rcu_utilization: Start RCU core
          <idle>-0     [001] d.s.   150.845413: rcu_future_grace_period: rcu_sched 51 50 52 0 0 1 Startleaf
          <idle>-0     [001] d.s.   150.845518: rcu_future_grace_period: rcu_sched 51 50 52 0 0 1 Prestartleaf
          <idle>-0     [001] d.s.   150.845619: rcu_grace_period: rcu_sched 51 AccWaitCB
          <idle>-0     [001] d.s.   150.845723: rcu_quiescent_state_report: rcu_sched 51 2>1 0 0 1 0
          <idle>-0     [001] ..s.   150.845857: rcu_utilization: End RCU core
          <idle>-0     [001] ..s.   150.845949: softirq_exit: vec=9 [action=RCU]
          <idle>-0     [001] d...   150.846098: __tick_nohz_idle_enter: entering stop_sched_tick
          <idle>-0     [001] d...   150.846192: __tick_nohz_idle_enter: returning from stop_sched_tick
          <idle>-0     [001] d...   150.846289: rcu_dyntick: Start 1 0
          <idle>-0     [000] d...   150.851519: rcu_dyntick: End 0 1
          <idle>-0     [001] d...   150.851522: rcu_dyntick: End 0 1
          <idle>-0     [000] d.s.   150.851709: tick_irq_enter: update jiffies via irq
          <idle>-0     [001] d.h.   150.851824: irq_handler_entry: irq=16 name=jcore_pit
          <idle>-0     [000] d.s.   150.851900: tick_do_update_jiffies64: finished do_timer(1)
          <idle>-0     [001] d.h.   150.852047: hrtimer_cancel: hrtimer=109f449c
          <idle>-0     [001] d.h.   150.852213: hrtimer_expire_entry: hrtimer=109f449c function=tick_sched_timer now=150850574115
          <idle>-0     [000] d.s.   150.852307: tick_do_update_jiffies64: finished updating jiffies
          <idle>-0     [001] d.h.   150.852375: tick_sched_do_timer: update jiffies via tick
          <idle>-0     [000] d...   150.852566: __tick_nohz_idle_enter: can stop idle tick
          <idle>-0     [001] d.h.   150.852578: softirq_raise: vec=1 [action=TIMER]
          <idle>-0     [000] d...   150.852660: __tick_nohz_idle_enter: entering stop_sched_tick
          <idle>-0     [001] d.h.   150.852723: rcu_utilization: Start scheduler-tick
          <idle>-0     [000] d...   150.852907: tick_nohz_restart: restart
          <idle>-0     [001] d.h.   150.852934: rcu_utilization: End scheduler-tick
          <idle>-0     [000] d...   150.853076: hrtimer_cancel: hrtimer=109e949c
          <idle>-0     [001] d.h.   150.853229: softirq_raise: vec=7 [action=SCHED]
          <idle>-0     [001] d.h.   150.853412: hrtimer_expire_exit: hrtimer=109f449c
          <idle>-0     [000] d...   150.853412: jcore_pit_set_next_event: pit 109eccb0 0 set delta 80974397 en=4410000 cntr=34 throt=80974397
          <idle>-0     [001] d.h.   150.853549: hrtimer_start: hrtimer=109f449c function=tick_sched_timer expires=150860000000 softexpires=150860000000
          <idle>-0     [000] d...   150.853645: hrtimer_start: hrtimer=109e949c function=tick_sched_timer expires=150860000000 softexpires=150860000000
          <idle>-0     [001] d.h.   150.853879: jcore_pit_set_next_event: pit 109f7cb0 1 set delta 384360 en=4410000 cntr=66 throt=384360
          <idle>-0     [000] d...   150.853941: jcore_pit_set_next_event: pit 109eccb0 0 set delta 380089 en=4410000 cntr=42 throt=380089
          <idle>-0     [001] d.h.   150.854024: irq_handler_exit: irq=16 ret=handled
          <idle>-0     [000] d...   150.854082: tick_nohz_restart: return from restart
          <idle>-0     [000] d...   150.854186: __tick_nohz_idle_enter: returning from stop_sched_tick
          <idle>-0     [001] ..s.   150.854235: softirq_entry: vec=1 [action=TIMER]
          <idle>-0     [000] d...   150.854325: rcu_dyntick: Start 1 0
          <idle>-0     [001] ..s.   150.854426: softirq_exit: vec=1 [action=TIMER]
          <idle>-0     [001] ..s.   150.854520: softirq_entry: vec=7 [action=SCHED]
          <idle>-0     [001] ..s.   150.854861: softirq_exit: vec=7 [action=SCHED]
          <idle>-0     [001] d...   150.855017: __tick_nohz_idle_enter: entering stop_sched_tick
          <idle>-0     [001] d...   150.855111: __tick_nohz_idle_enter: returning from stop_sched_tick
          <idle>-0     [001] d...   150.855208: rcu_dyntick: Start 1 0
          <idle>-0     [000] d...   150.861516: rcu_dyntick: End 0 1
          <idle>-0     [001] d...   150.861523: rcu_dyntick: End 0 1
          <idle>-0     [000] d.s.   150.861703: tick_irq_enter: update jiffies via irq

If I'm not mistaken, the bug is in tick_nohz_restart. According to the
comment, it forwards the timer to take place one jiffy in the future,
whereas one of its callers, tick_nohz_stop_sched_tick, expects it to
"prod the hardware into firing an interrupt". That's not going to
happen right away (as needed to get proper timing), and not going to
happen at all if the idle loop keeps breaking out and forwarding the
timer over and over again.

Before commit 0ff53d09642204c648424def0caa9117e7a3caaf ("tick: sched:
Force tick interrupt and get rid of softirq magic"), a timer softirq
was always raised, which seems to have made it impossible to get into
this situation. Adding back the raise_softirq_irqoff(TIMER_SOFTIRQ)
seems to make the problem go away -- with that change, my "rcu_sched
is stalled in swait" LED only lights briefly. But it's clearly not the
right fix; the interrupt load with this change is comparable to
periodic-tick.

FWIW I also spent a good deal of time exploring the possibility of a
hardware problem, but couldn't find any. The timer interrupt is firing
when it's programmed to; the kernel is just repeatedly reprogramming
it to fire in the future.

Rich
