From: Noam Camus <noamca@mellanox.com>
Subject: RE: [PATCH v2 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Mon, 31 Oct 2016 17:03:40 +0000
Message-ID: <DB6PR0501MB2518720A0F95ACBBBCB1CB27AAAE0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
References: <1477224748-25223-1-git-send-email-noamca@mellanox.com>
 <1477224748-25223-4-git-send-email-noamca@mellanox.com>
 <20161031105251.GD1506@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161031105251.GD1506@mai>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>
List-Id: devicetree@vger.kernel.org

>From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org]=20
>Sent: Monday, October 31, 2016 12:53 PM

>>=20
>> The design idea is that for each core there is dedicated regirtser

>s/regirtser/register/

>Hey ! re-read yourself.
Thanks, I do but sometimes reading over and over and still left with such t=
ypos
Will Fix on next patch Set V4

>> (TSI) serving all 16 HW threads.
>> The register is a bitmask with one bit for each HW thread.
>> When HW thread wants that next expiration of timer interrupt will hit=20
>> it then the proper bit should be set in this dedicated register.

>I'm not sure to understand this sentence. Do you mean each cpu/thread must=
 set a flag in the TSI register at BIT(phys_id) when they set a timer ?
Correct, each thread needs to set its bit in TSI register, otherwise the he=
 won't be interrupted by timer.

>> When timer expires all HW threads within this core which their bit is=20
>> set at the TSI register will be interrupted.

>Does it mean some HW threads will be wake up for nothing ?
See below after the example you gave

>eg.=20

>HWT1 sets the timer to expire within 2 seconds
>HWT2 sets the timer to expire within 2 hours

>When the first timer expires, that will wake up HWT1 *and* HWT2 ?

You are correct, indeed not optimal but much simpler than managing book kee=
ping of all 16 threads.
Functionality wise one who registered this timer will notice that it expire=
d too soon and will register a new one.
This is how it works now in our machines.

>The code is a bit confusing because of the very specific design of this ti=
mer.

>Below more questions for clarification.

...
>> diff --git a/drivers/clocksource/timer-nps.c=20
>> b/drivers/clocksource/timer-nps.c index 6156e54..0757328 100644
>> --- a/drivers/clocksource/timer-nps.c
>> +++ b/drivers/clocksource/timer-nps.c
>> @@ -46,7 +46,7 @@
>>  /* This array is per cluster of CPUs (Each NPS400 cluster got 256=20
>> CPUs) */  static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM]=20
>> __read_mostly;
>> =20
>> -static unsigned long nps_timer_rate;
>> +static unsigned long nps_timer1_freq;
>
>Why declare a global static variable for a local use in nps_setup_clocksou=
rce ?=20
Indeed no need. It will be fixed at V4

...
>> +/* Timer related Aux registers */
>> +#define AUX_REG_TIMER0_TSI	0xFFFFF850	/* timer 0 HW threads mask */
>> +#define NPS_REG_TIMER0_LIMIT	0x23		/* timer 0 limit */
>> +#define NPS_REG_TIMER0_CTRL	0x22		/* timer 0 control */
>> +#define NPS_REG_TIMER0_CNT	0x21		/* timer 0 count */
>> +
>> +#define TIMER0_CTRL_IE	(1 << 0) /* Interrupt when Count reaches limit *=
/
>> +#define TIMER0_CTRL_NH	(1 << 1) /* Count only when CPU NOT halted */

>Please, use BIT(nr) macro.
Will fix that on V4.

>Can you elaborate "Count only when CPU NOT halted" ?
The Idea here is:
The Not Halted mode flag (NH) causes cycles to be counted only when the pro=
cessor is running (not halted). When set to 0 the timer will count every cl=
ock cycle. When set to 1 the timer will only count when the processor is ru=
nning. The NH flag is set to 0 when the processor is Reset.
It may be used when working with JTAG (I never used it this way though).

>> +static unsigned long nps_timer0_freq; static unsigned long=20
>> +nps_timer0_irq;
>> +
>> +/*
>> + * Arm the timer to interrupt after @cycles  */ static void=20
>> +nps_clkevent_timer_event_setup(unsigned int cycles) {
>> +	write_aux_reg(NPS_REG_TIMER0_LIMIT, cycles);
>> +	write_aux_reg(NPS_REG_TIMER0_CNT, 0);   /* start from 0 */
>> +
>> +	write_aux_reg(NPS_REG_TIMER0_CTRL, TIMER0_CTRL_IE | TIMER0_CTRL_NH);=20
>> +}
>> +
>> +static void nps_clkevent_rm_thread(bool remove_thread) {
>> +	unsigned int cflags;
>> +	unsigned int enabled_threads;
>> +	unsigned long flags;
>> +	int thread;
>> +
>> +	local_irq_save(flags);
>> +	hw_schd_save(&cflags);
>
>Can you explain why those two lines are needed ?
The idea is that access to shared core registers (among threads) is not don=
e in parallel to keep their consistency.
For example Read Modified Write of TSI register is not atomic, so using two=
 lines above avoid any interference during
this code execution.

...
>> +
>> +static int nps_clkevent_set_next_event(unsigned long delta,
>> +				       struct clock_event_device *dev) {
>> +	struct irq_desc *desc =3D irq_to_desc(nps_timer0_irq);
>> +	struct irq_chip *chip =3D irq_data_get_irq_chip(&desc->irq_data);
>> +
>> +	nps_clkevent_add_thread(true);
>> +	chip->irq_unmask(&desc->irq_data);

>Can you explain why invoking low level IRQ callbacks is needed here ?
I needed those callbacks functionality and didn't want to duplicate it here=
.

...
>> +
>> +static int nps_clkevent_set_periodic(struct clock_event_device *dev)=20
>> +{
>> +	nps_clkevent_add_thread(false);
>> +	if (read_aux_reg(CTOP_AUX_THREAD_ID) =3D=3D 0)
>> +		nps_clkevent_timer_event_setup(nps_timer0_freq / HZ);

>Please explain this. I read only CPU0 can set the periodic timer.
When system works in periodic mode for clock events we just need to set for=
 all HW threads within same core their respective bit at TSI register.=20
We also need but only once to arm the shared timer control register.
Since that for each core thread 0 is always available we choose HW thread 0=
 to do that.
...
>> +
>> +static int __init nps_setup_clockevent(struct device_node *node) {
>> +	struct clock_event_device *evt =3D this_cpu_ptr(&nps_clockevent_device=
);
>> +	struct clk *clk;

>clk =3D 0xDEADBEEF
>> +	int ret;
>> +
>> +	nps_timer0_irq =3D irq_of_parse_and_map(node, 0);
>> +	if (nps_timer0_irq <=3D 0) {
>> +		pr_err("clockevent: missing irq");
>> +		return -EINVAL;
>> +	}
>> +
>> +	nps_get_timer_clk(node, &nps_timer0_freq, clk);
>> +
>> +	/* Needs apriori irq_set_percpu_devid() done in intc map function */
>> +	ret =3D request_percpu_irq(nps_timer0_irq, timer_irq_handler,
>> +				 "Timer0 (per-cpu-tick)", evt);
>> +	if (ret) {
>> +		pr_err("Couldn't request irq\n");
>> +		clk_disable_unprepare(clk);

>clk is on the stack, hence returning back from the function, clk is undefi=
ned.

>clk_disable_unprepare(0xDEADBEEF) =3D=3D> kernel panic

>It does not make sense to add the nps_get_timer_clk() function.

>Better to have a couple of duplicated lines and properly rollback from the=
 right place instead of rollbacking supposed actions taken from inside a fu=
nction.
As I wrote above I will use **clk for the rollback, so nps_get_timer_clk() =
will make sense and avoid code duplication.

>> +		return ret;
>> +	}
>> +
>> +	ret =3D cpuhp_setup_state(CPUHP_AP_NPS_TIMER_STARTING,
>> +				"AP_NPS_TIMER_STARTING",
>> +				nps_timer_starting_cpu,
>> +				nps_timer_dying_cpu);
>> +	if (ret) {
>> +		pr_err("Failed to setup hotplug state");
>> +		clk_disable_unprepare(clk);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clkevt, "ezchip,nps400-timer0",
>> +		       nps_setup_clockevent);
>> +#endif /* CONFIG_EZNPS_MTM_EXT */
>> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h=20
>> index 34bd805..9efc1a3 100644
>> --- a/include/linux/cpuhotplug.h
>> +++ b/include/linux/cpuhotplug.h
>> @@ -60,6 +60,7 @@ enum cpuhp_state {
>> 	CPUHP_AP_MARCO_TIMER_STARTING,
>>  	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>>  	CPUHP_AP_ARC_TIMER_STARTING,
>> +	CPUHP_AP_NPS_TIMER_STARTING,

>Oops, wait. Here, arch/arc/kernel/time.c should be moved in drivers/clocks=
ource and consolidated with this driver.

>Very likely, CPUHP_AP_ARC_TIMER_STARTING can be used for all ARC timers.

Indeed the ARC timer driver served as my inspiration but due to HW threads =
handling they are not the same.
Moving drivers from arch/arc to driver/clocksource is not my call (Vineet G=
upta is the maintainer of ARC)
And I think they quiet differ now so consolidation gain is not obvious.

-Noam=20
