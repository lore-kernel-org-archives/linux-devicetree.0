From: Thomas Gleixner <tglx@linutronix.de>
Subject: RE: [PATCH v3 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Tue, 1 Nov 2016 12:45:49 -0600 (MDT)
Message-ID: <alpine.DEB.2.20.1611011239150.14687@nanos>
References: <1477899468-5494-1-git-send-email-noamca@mellanox.com> <1477899468-5494-4-git-send-email-noamca@mellanox.com> <alpine.DEB.2.20.1610311146000.8160@nanos> <DB6PR0501MB2518D05EF3EFC35031C16371AAA10@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB6PR0501MB2518D05EF3EFC35031C16371AAA10@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Metcalf <cmetcalf@mellanox.com>
List-Id: devicetree@vger.kernel.org

On Tue, 1 Nov 2016, Noam Camus wrote:
> >> +static int nps_clkevent_set_next_event(unsigned long delta,
> >> +				       struct clock_event_device *dev) {
> >> +	struct irq_desc *desc = irq_to_desc(nps_timer0_irq);
> >> +	struct irq_chip *chip = irq_data_get_irq_chip(&desc->irq_data);
> >> +
> >> +	nps_clkevent_add_thread(true);
> >> +	chip->irq_unmask(&desc->irq_data);
> 

> > Oh no. You are not supposed to fiddle in the guts of the interrupts
> > from a random driver. Can you please explain what you are trying to do
> > and why the existing interfaces are> > not sufficient?

> This function is assigned and used by several hooks at clock_event_device
> type.  Main purpose is to support oneshot timer mode and in general
> support NOHZ_FULL and finally TASK_ISOLATION.

What has the fact that you fiddle in the irq desc to do with nohz full and
isolation?

> The idea for this is borrowed from arch/tile timer driver that just like
> us aiming to support the TASK_ISOLATION.

Which does not make it any better.

> Will it be better to replace these with
> irq_percpu_enable()/irq_percpu_disable() which seem to achieve quiet the
> same affect?

Correct. Not using existing functions is always a bad idea.

> 
> >> +static int nps_clkevent_set_periodic(struct clock_event_device *dev) 
> >> +{
> >> +	nps_clkevent_add_thread(false);
> >> +	if (read_aux_reg(CTOP_AUX_THREAD_ID) == 0)
> >> +		nps_clkevent_timer_event_setup(nps_timer0_freq / HZ);
> 
> >So how is that enabling interrupts again?

> I guess that in our system we never switch back to periodic.  Time
> infrastructure starts as periodic (I set CLOCK_EVT_FEAT_PERIODIC) and
> when timer is ready state is switched to oneshot mode and never goes back
> to periodic.  I might be missing here, but couldn't find any place where
> CLOCK_EVT_STATE_PERIODIC is set but in tick_setup_periodic().  Should I
> call here to enable interrupts anyway?

Right. We never switch back to periodic when we are in one shot mode. So,
you can spare that call.

> >> +	ret = cpuhp_setup_state(CPUHP_AP_NPS_TIMER_STARTING,
> >> +				"AP_NPS_TIMER_STARTING",
> >
> >Please make this "clockevents/nps:starting"
> Sorry but I can't see any similar thing all around.
> Could you explain why you prefer this format for the string?

Because its way better to read. We messed that up when we started the
conversion and switched over to the more informative strings later. Still
need to fixup the existing state derived strings.

Thanks,

	tglx
