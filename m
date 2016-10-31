From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v3 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Mon, 31 Oct 2016 12:12:57 -0600 (MDT)
Message-ID: <alpine.DEB.2.20.1610311146000.8160@nanos>
References: <1477899468-5494-1-git-send-email-noamca@mellanox.com> <1477899468-5494-4-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477899468-5494-4-git-send-email-noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 31 Oct 2016, Noam Camus wrote:
>  
> -static unsigned long nps_timer_rate;
> +static unsigned long nps_timer1_freq;

This should be either in the previous patch or seperate.

>  static int nps_get_timer_clk(struct device_node *node,
>  			     unsigned long *timer_freq,
>  			     struct clk *clk)
> @@ -87,10 +87,10 @@ static int __init nps_setup_clocksource(struct device_node *node)
>  			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
>  				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
>  
> -	nps_get_timer_clk(node, &nps_timer_rate, clk);
> +	nps_get_timer_clk(node, &nps_timer1_freq, clk);
>  
> -	ret = clocksource_mmio_init(nps_msu_reg_low_addr, "EZnps-tick",
> -				    nps_timer_rate, 301, 32, nps_clksrc_read);
> +	ret = clocksource_mmio_init(nps_msu_reg_low_addr, "nps-tick",
> +				    nps_timer1_freq, 301, 32, nps_clksrc_read);
>  	if (ret) {
>  		pr_err("Couldn't register clock source.\n");
>  		clk_disable_unprepare(clk);
> @@ -101,3 +101,215 @@ static int __init nps_setup_clocksource(struct device_node *node)
>  
>  CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
>  		       nps_setup_clocksource);
> +CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clk_src, "ezchip,nps400-timer1",
> +		       nps_setup_clocksource);

What's the point of this change?

> +/*
> + * Arm the timer to interrupt after @cycles
> + */
> +static void nps_clkevent_timer_event_setup(unsigned int cycles)
> +{
> +	write_aux_reg(NPS_REG_TIMER0_LIMIT, cycles);
> +	write_aux_reg(NPS_REG_TIMER0_CNT, 0);   /* start from 0 */

Please do not use tail comments. They break the reading flow.

> +
> +	write_aux_reg(NPS_REG_TIMER0_CTRL, TIMER0_CTRL_IE | TIMER0_CTRL_NH);
> +}
> +
> +static void nps_clkevent_rm_thread(bool remove_thread)

I have a hard time to understand why a remove_thread function needs a
remove_thread boolean argument. Commenting things like this would be more
helpful than commenting the obvious.

> +{
> +	unsigned int cflags;
> +	unsigned int enabled_threads;
> +	unsigned long flags;
> +	int thread;
> +
> +	local_irq_save(flags);

That's pointless. Both call sites have interrupts disabled.

> +	hw_schd_save(&cflags);
> +
> +	enabled_threads = read_aux_reg(AUX_REG_TIMER0_TSI);
> +
> +	/* remove thread from TSI1 */
> +	if (remove_thread) {
> +		thread = read_aux_reg(CTOP_AUX_THREAD_ID);
> +		enabled_threads &= ~(1 << thread);
> +		write_aux_reg(AUX_REG_TIMER0_TSI, enabled_threads);
> +	}
> +
> +	/* Re-arm the timer if needed */
> +	if (!enabled_threads)
> +		write_aux_reg(NPS_REG_TIMER0_CTRL, TIMER0_CTRL_NH);
> +	else
> +		write_aux_reg(NPS_REG_TIMER0_CTRL,
> +			      TIMER0_CTRL_IE | TIMER0_CTRL_NH);
> +
> +	hw_schd_restore(cflags);
> +	local_irq_restore(flags);
> +}
> +
> +static void nps_clkevent_add_thread(bool set_event)
> +{
> +	int thread;
> +	unsigned int cflags, enabled_threads;
> +	unsigned long flags;
> +
> +	local_irq_save(flags);

Ditto.

> +	hw_schd_save(&cflags);
> +
> +	/* add thread to TSI1 */
> +	thread = read_aux_reg(CTOP_AUX_THREAD_ID);
> +	enabled_threads = read_aux_reg(AUX_REG_TIMER0_TSI);
> +	enabled_threads |= (1 << thread);
> +	write_aux_reg(AUX_REG_TIMER0_TSI, enabled_threads);
> +
> +	/* set next timer event */
> +	if (set_event)
> +		write_aux_reg(NPS_REG_TIMER0_CTRL,
> +			      TIMER0_CTRL_IE | TIMER0_CTRL_NH);
> +
> +	hw_schd_restore(cflags);
> +	local_irq_restore(flags);
> +}
> +
> +static int nps_clkevent_set_next_event(unsigned long delta,
> +				       struct clock_event_device *dev)
> +{
> +	struct irq_desc *desc = irq_to_desc(nps_timer0_irq);
> +	struct irq_chip *chip = irq_data_get_irq_chip(&desc->irq_data);
> +
> +	nps_clkevent_add_thread(true);
> +	chip->irq_unmask(&desc->irq_data);

Oh no. You are not supposed to fiddle in the guts of the interrupts from a
random driver. Can you please explain what you are trying to do and why the
existing interfaces are not sufficient?

> +/*
> + * Whenever anyone tries to change modes, we just mask interrupts
> + * and wait for the next event to get set.
> + */
> +static int nps_clkevent_timer_shutdown(struct clock_event_device *dev)
> +{
> +	struct irq_desc *desc = irq_to_desc(nps_timer0_irq);
> +	struct irq_chip *chip = irq_data_get_irq_chip(&desc->irq_data);
> +
> +	chip->irq_mask(&desc->irq_data);
> +
> +	return 0;
> +}
> +

> +static int nps_clkevent_set_periodic(struct clock_event_device *dev)
> +{
> +	nps_clkevent_add_thread(false);
> +	if (read_aux_reg(CTOP_AUX_THREAD_ID) == 0)
> +		nps_clkevent_timer_event_setup(nps_timer0_freq / HZ);

So how is that enabling interrupts again?

> +
> +	return 0;
> +}
> +

> +static DEFINE_PER_CPU(struct clock_event_device, nps_clockevent_device) = {
> +	.name				=	"NPS Timer0",
> +	.features			=	CLOCK_EVT_FEAT_ONESHOT |
> +						CLOCK_EVT_FEAT_PERIODIC,
> +	.rating				=	300,
> +	.set_next_event			=	nps_clkevent_set_next_event,
> +	.set_state_periodic		=	nps_clkevent_set_periodic,
> +	.set_state_oneshot		=	nps_clkevent_set_oneshot,
> +	.set_state_oneshot_stopped	=	nps_clkevent_timer_shutdown,
> +	.set_state_shutdown		=	nps_clkevent_timer_shutdown,
> +	.tick_resume			=	nps_clkevent_timer_shutdown,
> +};
> +
> +static irqreturn_t timer_irq_handler(int irq, void *dev_id)
> +{
> +	/*
> +	 * Note that generic IRQ core could have passed @evt for @dev_id if
> +	 * irq_set_chip_and_handler() asked for handle_percpu_devid_irq()

And why are you not doing that?

> +	 */
> +	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
> +	int irq_reenable = clockevent_state_periodic(evt);
> +
> +	nps_clkevent_rm_thread(!irq_reenable);
> +
> +	evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int nps_timer_starting_cpu(unsigned int cpu)
> +{
> +	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
> +
> +	evt->cpumask = cpumask_of(smp_processor_id());
> +
> +	clockevents_config_and_register(evt, nps_timer0_freq, 0, ULONG_MAX);
> +	enable_percpu_irq(nps_timer0_irq, 0);

And at the same time you still use the percpu infrastructure ....

> +	return 0;
> +}
> +
> +static int nps_timer_dying_cpu(unsigned int cpu)
> +{
> +	disable_percpu_irq(nps_timer0_irq);
> +	return 0;
> +}
> +
> +static int __init nps_setup_clockevent(struct device_node *node)
> +{
> +	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
> +	struct clk *clk;
> +	int ret;
> +
> +	nps_timer0_irq = irq_of_parse_and_map(node, 0);
> +	if (nps_timer0_irq <= 0) {
> +		pr_err("clockevent: missing irq");
> +		return -EINVAL;
> +	}
> +
> +	nps_get_timer_clk(node, &nps_timer0_freq, clk);
> +
> +	/* Needs apriori irq_set_percpu_devid() done in intc map function */
> +	ret = request_percpu_irq(nps_timer0_irq, timer_irq_handler,
> +				 "Timer0 (per-cpu-tick)", evt);

This is wrong. the dev_id argument wants to be a __per_cpu pointer. So it
should be &nps_clockevent_device and not a pointer to the cpu local one.

> +	if (ret) {
> +		pr_err("Couldn't request irq\n");
> +		clk_disable_unprepare(clk);
> +		return ret;
> +	}
> +
> +	ret = cpuhp_setup_state(CPUHP_AP_NPS_TIMER_STARTING,
> +				"AP_NPS_TIMER_STARTING",

Please make this "clockevents/nps:starting"

> +				nps_timer_starting_cpu,
> +				nps_timer_dying_cpu);
> +	if (ret) {
> +		pr_err("Failed to setup hotplug state");
> +		clk_disable_unprepare(clk);

You leave the irq requested....

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
