From: Noam Camus <noamca@mellanox.com>
Subject: RE: [PATCH v3 3/3] clocksource: Add clockevent support to NPS400
 driver
Date: Tue, 1 Nov 2016 09:03:32 +0000
Message-ID: <DB6PR0501MB2518D05EF3EFC35031C16371AAA10@DB6PR0501MB2518.eurprd05.prod.outlook.com>
References: <1477899468-5494-1-git-send-email-noamca@mellanox.com>
 <1477899468-5494-4-git-send-email-noamca@mellanox.com>
 <alpine.DEB.2.20.1610311146000.8160@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1610311146000.8160@nanos>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Metcalf <cmetcalf@mellanox.com>
List-Id: devicetree@vger.kernel.org

> From: Thomas Gleixner [mailto:tglx@linutronix.de]=20
> Sent: Monday, October 31, 2016 8:13 PM

>> =20
>> -static unsigned long nps_timer_rate;
>> +static unsigned long nps_timer1_freq;

>This should be either in the previous patch or seperate.
Will fix in V4

....

>> @@ -101,3 +101,215 @@ static int __init nps_setup_clocksource(struct=20
>> device_node *node)
>> =20
>>  CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
>>  		       nps_setup_clocksource);
>> +CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clk_src, "ezchip,nps400-timer1",
>> +		       nps_setup_clocksource);

>What's the point of this change?
I do this as preparation for next patch where we use timer0 for clockevent =
while timer1 is kept for clocksource.=20
I realize that it is not aligned with binding document, so I will move this=
 to next patch.

>> +/*
>> + * Arm the timer to interrupt after @cycles  */ static void=20
>> +nps_clkevent_timer_event_setup(unsigned int cycles) {
>> +	write_aux_reg(NPS_REG_TIMER0_LIMIT, cycles);
>> +	write_aux_reg(NPS_REG_TIMER0_CNT, 0);   /* start from 0 */

>Please do not use tail comments. They break the reading flow.
Will fix in V4

>> +
>> +	write_aux_reg(NPS_REG_TIMER0_CTRL, TIMER0_CTRL_IE | TIMER0_CTRL_NH);=20
>> +}
>> +
>> +static void nps_clkevent_rm_thread(bool remove_thread)

>I have a hard time to understand why a remove_thread function needs a remo=
ve_thread boolean argument. Commenting things like this would be more helpf=
ul than commenting the obvious.
Sorry for that, will be commented in V4

>> +{
>> +	unsigned int cflags;
>> +	unsigned int enabled_threads;
>>+	unsigned long flags;
>> +	int thread;
>> +
>> +	local_irq_save(flags);

>That's pointless. Both call sites have interrupts disabled.
Will be fixed in V4

...
>> +
>> +static void nps_clkevent_add_thread(bool set_event) {
>> +	int thread;
>> +	unsigned int cflags, enabled_threads;
>> +	unsigned long flags;
>> +
>> +	local_irq_save(flags);

>Ditto.
Will be removed as well at V4

...

>> +static int nps_clkevent_set_next_event(unsigned long delta,
>> +				       struct clock_event_device *dev) {
>> +	struct irq_desc *desc =3D irq_to_desc(nps_timer0_irq);
>> +	struct irq_chip *chip =3D irq_data_get_irq_chip(&desc->irq_data);
>> +
>> +	nps_clkevent_add_thread(true);
>> +	chip->irq_unmask(&desc->irq_data);

>Oh no. You are not supposed to fiddle in the guts of the interrupts from a=
 random driver. Can you please explain what you are trying to do and why >t=
he existing interfaces are not sufficient?
This function is assigned and used by several hooks at clock_event_device t=
ype.
Main purpose is to support oneshot timer mode and in general support NOHZ_F=
ULL and finally TASK_ISOLATION.
The idea for this is borrowed from arch/tile timer driver that just like us=
 aiming to support the TASK_ISOLATION.
Will it be better to replace these with irq_percpu_enable()/irq_percpu_disa=
ble() which seem to achieve quiet the same affect?
...

>> +static int nps_clkevent_set_periodic(struct clock_event_device *dev)=20
>> +{
>> +	nps_clkevent_add_thread(false);
>> +	if (read_aux_reg(CTOP_AUX_THREAD_ID) =3D=3D 0)
>> +		nps_clkevent_timer_event_setup(nps_timer0_freq / HZ);

>So how is that enabling interrupts again?
I guess that in our system we never switch back to periodic.
Time infrastructure starts as periodic (I set CLOCK_EVT_FEAT_PERIODIC) and =
when timer is ready
state is switched to oneshot mode and never goes back to periodic.
I might be missing here, but couldn't find any place where CLOCK_EVT_STATE_=
PERIODIC is set but in tick_setup_periodic().
Should I call here to enable interrupts anyway?

>> +
>> +static irqreturn_t timer_irq_handler(int irq, void *dev_id) {
>> +	/*
>> +	 * Note that generic IRQ core could have passed @evt for @dev_id if
>> +	 * irq_set_chip_and_handler() asked for handle_percpu_devid_irq()
>
>And why are you not doing that?
Will do that in V4

>> +static int __init nps_setup_clockevent(struct device_node *node) {
>> +	struct clock_event_device *evt =3D this_cpu_ptr(&nps_clockevent_device=
);
>> +	struct clk *clk;
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
>
>This is wrong. the dev_id argument wants to be a __per_cpu pointer. So it =
should be &nps_clockevent_device and not a pointer to the cpu local one.
Will fix that in V4

>> +	if (ret) {
>> +		pr_err("Couldn't request irq\n");
>> +		clk_disable_unprepare(clk);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D cpuhp_setup_state(CPUHP_AP_NPS_TIMER_STARTING,
>> +				"AP_NPS_TIMER_STARTING",
>
>Please make this "clockevents/nps:starting"
Sorry but I can't see any similar thing all around.
Could you explain why you prefer this format for the string?

>> +				nps_timer_starting_cpu,
>> +				nps_timer_dying_cpu);
>> +	if (ret) {
>> +		pr_err("Failed to setup hotplug state");
>> +		clk_disable_unprepare(clk);
>
>You leave the irq requested....
Will fix that in V4.

Many thanks for all comments.
Waiting for your answers on my few questions above.
-Noam
