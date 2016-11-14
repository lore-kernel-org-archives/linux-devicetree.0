From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v5 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Mon, 14 Nov 2016 15:34:54 +0100
Message-ID: <20161114143454.GE2016@mai>
References: <1479021872-14237-1-git-send-email-noamca@mellanox.com>
 <1479021872-14237-4-git-send-email-noamca@mellanox.com>
 <20161114112326.GC2016@mai>
 <DB6PR0501MB25183C670A48F44DB916D7FEAABC0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB6PR0501MB25183C670A48F44DB916D7FEAABC0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 14, 2016 at 01:58:15PM +0000, Noam Camus wrote:
> > From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org] 
> > Sent: Monday, November 14, 2016 1:23 PM
> 
> 
> >> + */
> >> +static void nps_clkevent_rm_thread(bool remove_thread) {
> >> +	unsigned int cflags;
> >> +	unsigned int enabled_threads = 0;
> >> +	int thread;
> >> +
> >> +	hw_schd_save(&cflags);
> 
> >I'm not used with hardware scheduling. Can you explain why this is needed
> >here ? What >window race we want to close ?
> We are using HW scheduling off/on in order to keep consistency of auxiliary
> registers shared among HW threads within the same core.  Example to such
> registers NPS_REG_TIMER0_TSI and NPS_REG_TIMER0_CTRL.  Since update procedure
> of these registers is not atomic we use save/restore macros to turn off/on
> the HW scheduling. This way we insure that no HW scheduling occurs and
> another HW thread (represented as another CPU) will execute in this same
> critical code path.  If we take for example nps_clkevent_add_thread() we can
> see that we are doing some read modify write to NPS_REG_TIMER0_TSI and
> optionally writing to NPS_REG_TIMER0_CTRL. This flow should be atomic and is
> protected by our save/restore macros.  Do note that interrupts are disabled
> at this point so we are safe from all asynchronous events. 
 
The function nps_clkevent_timer_event_setup() writes into the NPS_REG_TIMER0_CTRL
register but there is no critical section there. What prevents another HW thread
to write this register at the same time ?

I do believe we have a framework to access shared registers, otherwise a simple
spinlock would be simpler and perhaps faster than disabling the entire hardware
scheduling for the system, no ?

> >> +static void nps_clkevent_add_thread(bool set_event) {
> >> +	int thread;
> >> +	unsigned int cflags, enabled_threads;
> >> +
> >> +	hw_schd_save(&cflags);
> >> +
> >> +	/* add thread to TSI1 */
> >> +	thread = read_aux_reg(CTOP_AUX_THREAD_ID);
> >> +	enabled_threads = read_aux_reg(NPS_REG_TIMER0_TSI);
> >> +	enabled_threads |= (1 << thread);
> >> +	write_aux_reg(NPS_REG_TIMER0_TSI, enabled_threads);
> >> +
> >> +	/* set next timer event */
> >> +	if (set_event)
> >> +		write_aux_reg(NPS_REG_TIMER0_CTRL,
> >> +			      TIMER0_CTRL_IE | TIMER0_CTRL_NH);
> >> +
> >> +	hw_schd_restore(cflags);
> >> +}
> 
> >Not sure the boolean parameters for *_rm_thread and *_add_thread helps to
> >clarify the code. Depending on the race window with hw_schd_save/restore We
> >should be able to simplify it.
> I am not sure I am following you here, how race window may simplify this
> code?  If those routines will get no parameter I can't determine when to add
> or not (same as remove).  ...

Regarding the comment I did above, it is possible the critical section is
reduced and moved into the shutdown function. Thus, the boolean wouldn't be
needed anymore, well that is conditional to the above comment. Discard the
comment for the moment, until the hw sched vs spinlock vs NPS_REG_TIMER0_CTRL
is sorted out.

> >> +static DEFINE_PER_CPU(struct clock_event_device, nps_clockevent_device) = {
> >> +	.name				=	"NPS Timer0",
> >> +	.features			=	CLOCK_EVT_FEAT_ONESHOT |
> >> +						CLOCK_EVT_FEAT_PERIODIC,
> >> +	.rating				=	300,
> >> +	.set_next_event			=	nps_clkevent_set_next_event,
> >> +	.set_state_periodic		=	nps_clkevent_set_periodic,
> >> +	.set_state_oneshot		=	nps_clkevent_set_oneshot,
> >> +	.set_state_oneshot_stopped	=	nps_clkevent_timer_shutdown,
> >> +	.set_state_shutdown		=	nps_clkevent_timer_shutdown,
> 
> >Doesn't set_state_shutdown and set_state_oneshot_stopped need to remove the HW thread from the TSI ?
> You are correct, I will fix that.

And tick_resume. Perhaps, that is the reason why NO_HZ hangs.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
