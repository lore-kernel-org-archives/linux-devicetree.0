From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Tue, 1 Nov 2016 21:01:41 +0100
Message-ID: <20161101200141.GF1506@mai>
References: <1477224748-25223-1-git-send-email-noamca@mellanox.com>
 <1477224748-25223-4-git-send-email-noamca@mellanox.com>
 <20161031105251.GD1506@mai>
 <DB6PR0501MB2518720A0F95ACBBBCB1CB27AAAE0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <DB6PR0501MB2518720A0F95ACBBBCB1CB27AAAE0-wTfl6qNNZ1PL+HUNrKNnF8DSnupUy6xnnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 31, 2016 at 05:03:40PM +0000, Noam Camus wrote:
> >From: Daniel Lezcano [mailto:daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org] 
> >Sent: Monday, October 31, 2016 12:53 PM
> 
> >> 
> >> The design idea is that for each core there is dedicated regirtser
> 
> >s/regirtser/register/
> 
> >Hey ! re-read yourself.
> Thanks, I do but sometimes reading over and over and still left with such typos
> Will Fix on next patch Set V4
> 
> >> (TSI) serving all 16 HW threads.
> >> The register is a bitmask with one bit for each HW thread.
> >> When HW thread wants that next expiration of timer interrupt will hit 
> >> it then the proper bit should be set in this dedicated register.
> 
> >I'm not sure to understand this sentence. Do you mean each cpu/thread must
> >set a flag in the TSI register at BIT(phys_id) when they set a timer ?
> Correct, each thread needs to set its bit in TSI register, otherwise the he
> won't be interrupted by timer.
> 
> >> When timer expires all HW threads within this core which their bit is 
> >> set at the TSI register will be interrupted.
> 
> >Does it mean some HW threads will be wake up for nothing ?
> See below after the example you gave
> 
> >eg. 
> 
> >HWT1 sets the timer to expire within 2 seconds
> >HWT2 sets the timer to expire within 2 hours
> 
> >When the first timer expires, that will wake up HWT1 *and* HWT2 ?
> 
> You are correct, indeed not optimal but much simpler than managing book
> keeping of all 16 threads.  Functionality wise one who registered this timer
> will notice that it expired too soon and will register a new one.  This is how
> it works now in our machines.

Assuming cpu0 and cpu1 are sibling, does

taskset 0x1 time sleep 2 & taskset 0x2 time sleep 3

give a correct result without a dmesg log ?

Can you give the content of the /proc/timer_list ?

I'm not sure it is safe to have this kind of spurious interrupt for the time
framework.

> >The code is a bit confusing because of the very specific design of this timer.
> 
> >Below more questions for clarification.
> 
> ...
> >> diff --git a/drivers/clocksource/timer-nps.c 
> >> b/drivers/clocksource/timer-nps.c index 6156e54..0757328 100644
> >> --- a/drivers/clocksource/timer-nps.c
> >> +++ b/drivers/clocksource/timer-nps.c
> >> @@ -46,7 +46,7 @@
> >>  /* This array is per cluster of CPUs (Each NPS400 cluster got 256 
> >> CPUs) */  static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM] 
> >> __read_mostly;
> >>  
> >> -static unsigned long nps_timer_rate;
> >> +static unsigned long nps_timer1_freq;
> >
> >Why declare a global static variable for a local use in nps_setup_clocksource ? 
> Indeed no need. It will be fixed at V4
> 
> ...
> >> +/* Timer related Aux registers */
> >> +#define AUX_REG_TIMER0_TSI	0xFFFFF850	/* timer 0 HW threads mask */
> >> +#define NPS_REG_TIMER0_LIMIT	0x23		/* timer 0 limit */
> >> +#define NPS_REG_TIMER0_CTRL	0x22		/* timer 0 control */
> >> +#define NPS_REG_TIMER0_CNT	0x21		/* timer 0 count */
> >> +
> >> +#define TIMER0_CTRL_IE	(1 << 0) /* Interrupt when Count reaches limit */
> >> +#define TIMER0_CTRL_NH	(1 << 1) /* Count only when CPU NOT halted */
> 
> >Please, use BIT(nr) macro.
> Will fix that on V4.
> 
> >Can you elaborate "Count only when CPU NOT halted" ?
> The Idea here is:
> The Not Halted mode flag (NH) causes cycles to be counted only when the
> processor is running (not halted). When set to 0 the timer will count every
> clock cycle. When set to 1 the timer will only count when the processor is
> running. The NH flag is set to 0 when the processor is Reset.

When is the processor halted ? At idle time ?

There is an inconsistency here:

 - If the power management of the CPU allows to power it down and the timer
   belongs to the same power domain to the CPU, then it will be powered down
   also. In this case, the C3STOP flag must be used and the CPU wakeup must be
   delegated to a backup timer.

 - If there is no power management on the CPU. The timer must continue to
   count cycles in order to wake up the CPU if it is halted (assuming it
   is clock gated).

In both cases, TIMER0_CTRL_NH is not needed.

Or is the CPU halted *only* when debugging it ?

> It may be used when working with JTAG (I never used it this way though).
> 
> >> +static unsigned long nps_timer0_freq; static unsigned long 
> >> +nps_timer0_irq;
> >> +
> >> +/*
> >> + * Arm the timer to interrupt after @cycles  */ static void 
> >> +nps_clkevent_timer_event_setup(unsigned int cycles) {
> >> +	write_aux_reg(NPS_REG_TIMER0_LIMIT, cycles);
> >> +	write_aux_reg(NPS_REG_TIMER0_CNT, 0);   /* start from 0 */
> >> +
> >> +	write_aux_reg(NPS_REG_TIMER0_CTRL, TIMER0_CTRL_IE | TIMER0_CTRL_NH); 
> >> +}
> >> +
> >> +static void nps_clkevent_rm_thread(bool remove_thread) {
> >> +	unsigned int cflags;
> >> +	unsigned int enabled_threads;
> >> +	unsigned long flags;
> >> +	int thread;
> >> +
> >> +	local_irq_save(flags);
> >> +	hw_schd_save(&cflags);
> >
> >Can you explain why those two lines are needed ?
> The idea is that access to shared core registers (among threads) is not done
> in parallel to keep their consistency.  For example Read Modified Write of TSI
> register is not atomic, so using two lines above avoid any interference during
> this code execution.

Mmmh, I'm not used to hardware scheduling. Why hw_schd_save() is needed ?

regmap provides the API to deal with read/write of shared register.

> >> +
> >> +static int nps_clkevent_set_next_event(unsigned long delta,
> >> +				       struct clock_event_device *dev) {
> >> +	struct irq_desc *desc = irq_to_desc(nps_timer0_irq);
> >> +	struct irq_chip *chip = irq_data_get_irq_chip(&desc->irq_data);
> >> +
> >> +	nps_clkevent_add_thread(true);
> >> +	chip->irq_unmask(&desc->irq_data);
> 
> >Can you explain why invoking low level IRQ callbacks is needed here ?
> I needed those callbacks functionality and didn't want to duplicate it here.

If you need these callbacks here, then there is probably an issue with the
driver design.

> >> +
> >> +static int nps_clkevent_set_periodic(struct clock_event_device *dev) 
> >> +{
> >> +	nps_clkevent_add_thread(false);
> >> +	if (read_aux_reg(CTOP_AUX_THREAD_ID) == 0)
> >> +		nps_clkevent_timer_event_setup(nps_timer0_freq / HZ);
> 
> >Please explain this. I read only CPU0 can set the periodic timer.
> When system works in periodic mode for clock events we just need to set for
> all HW threads within same core their respective bit at TSI register.  We also
> need but only once to arm the shared timer control register.  Since that for
> each core thread 0 is always available we choose HW thread 0 to do that.  ...

I see. Please, add the explanation as a comment in the code.

> >> +static int __init nps_setup_clockevent(struct device_node *node) {
> >> +	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
> >> +	struct clk *clk;
> 
> >clk = 0xDEADBEEF
> >> +	int ret;
> >> +
> >> +	nps_timer0_irq = irq_of_parse_and_map(node, 0);
> >> +	if (nps_timer0_irq <= 0) {
> >> +		pr_err("clockevent: missing irq");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	nps_get_timer_clk(node, &nps_timer0_freq, clk);
> >> +
> >> +	/* Needs apriori irq_set_percpu_devid() done in intc map function */
> >> +	ret = request_percpu_irq(nps_timer0_irq, timer_irq_handler,
> >> +				 "Timer0 (per-cpu-tick)", evt);
> >> +	if (ret) {
> >> +		pr_err("Couldn't request irq\n");
> >> +		clk_disable_unprepare(clk);
> 
> >clk is on the stack, hence returning back from the function, clk is
> >undefined.
> 
> >clk_disable_unprepare(0xDEADBEEF) ==> kernel panic
> 
> >It does not make sense to add the nps_get_timer_clk() function.
> 
> >Better to have a couple of duplicated lines and properly rollback from the
> >right place instead of rollbacking supposed actions taken from inside a
> >function.
> As I wrote above I will use **clk for the rollback, so nps_get_timer_clk()
> will make sense and avoid code duplication.
> 
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = cpuhp_setup_state(CPUHP_AP_NPS_TIMER_STARTING,
> >> +				"AP_NPS_TIMER_STARTING",
> >> +				nps_timer_starting_cpu,
> >> +				nps_timer_dying_cpu);
> >> +	if (ret) {
> >> +		pr_err("Failed to setup hotplug state");
> >> +		clk_disable_unprepare(clk);
> >> +		return ret;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clkevt, "ezchip,nps400-timer0",
> >> +		       nps_setup_clockevent);
> >> +#endif /* CONFIG_EZNPS_MTM_EXT */
> >> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h 
> >> index 34bd805..9efc1a3 100644
> >> --- a/include/linux/cpuhotplug.h
> >> +++ b/include/linux/cpuhotplug.h
> >> @@ -60,6 +60,7 @@ enum cpuhp_state {
> >> 	CPUHP_AP_MARCO_TIMER_STARTING,
> >>  	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
> >>  	CPUHP_AP_ARC_TIMER_STARTING,
> >> +	CPUHP_AP_NPS_TIMER_STARTING,
> 
> >Oops, wait. Here, arch/arc/kernel/time.c should be moved in
> >drivers/clocksource and consolidated with this driver.
> 
> >Very likely, CPUHP_AP_ARC_TIMER_STARTING can be used for all ARC timers.
> 
> Indeed the ARC timer driver served as my inspiration but due to HW threads
> handling they are not the same.  Moving drivers from arch/arc to
> driver/clocksource is not my call (Vineet Gupta is the maintainer of ARC) And
> I think they quiet differ now so consolidation gain is not obvious.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
