From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 2/2] clocksource: add J-Core timer/clocksource
 driver
Date: Sat, 8 Oct 2016 13:32:06 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1610081312190.5222@nanos>
References: <cover.1474693319.git.dalias@libc.org> <22c1ee0f908fe3bf8b70f5e87d659ceb29af1434.1474693319.git.dalias@libc.org> <20160926210716.GA12855@brightrain.aerifal.cx> <4b02ba7d-4a31-297a-bbbd-be26da615e7b@linaro.org> <20160926222352.GE19318@brightrain.aerifal.cx>
 <alpine.DEB.2.20.1609261936130.4915@nanos> <20160927004258.GF19318@brightrain.aerifal.cx> <20160927220820.GH19318@brightrain.aerifal.cx> <alpine.DEB.2.20.1609301319410.4799@nanos> <20161008013210.GX19318@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20161008013210.GX19318@brightrain.aerifal.cx>
Sender: linux-sh-owner@vger.kernel.org
To: Rich Felker <dalias@libc.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

On Fri, 7 Oct 2016, Rich Felker wrote:
> 
> If I'm not mistaken, the bug is in tick_nohz_restart. According to the

I think you are mistaken. Let's look at CPU0 only:

          <idle>-0     [000] d...   150.829698: __tick_nohz_idle_enter: can stop idle tick
          <idle>-0     [000] d...   150.829774: __tick_nohz_idle_enter: entering stop_sched_tick
          <idle>-0     [000] d...   150.830001: tick_stop: success=1 dependency=NONE
          <idle>-0     [000] d...   150.830127: hrtimer_cancel: hrtimer=109e949c
          <idle>-0     [000] d...   150.830380: jcore_pit_set_next_event: pit 109eccb0 0 set delta 82124660 en=4410000 cntr=75 throt=82124660
          <idle>-0     [000] d...   150.830498: hrtimer_start: hrtimer=109e949c function=tick_sched_timer expires=150840000000 softexpires=150840000000
          <idle>-0     [000] d...   150.830720: jcore_pit_set_next_event: pit 109eccb0 0 set delta 539823 en=4410000 cntr=34 throt=539823

Tick is programmed to fire at 150.84

          <idle>-0     [000] d...   150.830822: __tick_nohz_idle_enter: returning from stop_sched_tick
          <idle>-0     [000] d...   150.830940: rcu_dyntick: Start 140000000000000 0
          <idle>-0     [000] d...   150.831072: rcu_dyntick: End 0 1
          <idle>-0     [000] d...   150.831165: cpu_idle: state=0 cpu_id=0
          <idle>-0     [000] d...   150.831269: rcu_dyntick: Start 1 0
          <idle>-0     [000] ....   150.831368: cpu_startup_entry: enabled irqs, spinning

CPU spins and waits for an interrupt to happen


          <idle>-0     [000] d...   150.841530: rcu_dyntick: End 0 1

Dropping out of the spin about the time we expect the PIT interrupt to
fire. And an interrupt is the reason why we drop out because the 'need
resched' flag is not set and we end up in:

          <idle>-0     [000] d.s.   150.841724: tick_irq_enter: update jiffies via irq

which is called from irq_enter()

          <idle>-0     [000] d.s.   150.841918: tick_do_update_jiffies64: finished do_timer(1)
          <idle>-0     [000] d.s.   150.842348: tick_do_update_jiffies64: finished updating jiffies


So here we would expect:

    	 irq_handler_entry: irq=16 name=jcore_pit
	 ...
	 irq_handler_exit .....
    	 

or any other interrupt being invoked. But we see this here:

          <idle>-0     [000] d...   150.842603: __tick_nohz_idle_enter: can stop idle tick

And that's just wrong. 

Now looking at CPU1 at the same time:

          <idle>-0     [001] d.h.   150.841829: irq_handler_entry: irq=16 name=jcore_          <idle>-0     [001] d.h.   150.842054: hrtimer_cancel: hrtimer=109f449c
          <idle>-0     [001] d.h.   150.842218: hrtimer_expire_entry: hrtimer=109f449c function=tick_sched_timer now=150840579940

So there the PIT interrupt enters and runs the interrupt handler.

Now looking deeper at the PIT interrupts:

     kworker/0:1-208   [000] d.h.   150.641822: irq_handler_entry: irq=16 name=jcore_pit
     kworker/0:1-208   [000] d.h.   150.644928: irq_handler_exit: irq=16 ret=handled


          <idle>-0     [001] dnh.   150.645370: irq_handler_entry: irq=16 name=jcore_pit
          <idle>-0     [001] dnh.   150.647444: irq_handler_exit: irq=16 ret=handled

Both CPUs have the same interrupt number for their per cpu PIT interrupt.

IIRC you said earlier when the percpu interrupt discussion happened, that
your per cpu PITs have distinct interrupt numbers, but that does not seem
the case here.

That's where you have to dig.

Thanks,

	tglx


