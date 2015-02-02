From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/4] clocksource: mmp: add mmp timer driver
Date: Mon, 2 Feb 2015 10:34:34 +0000
Message-ID: <20150202103434.GA7459@leverpostej>
References: <1422865899-8152-1-git-send-email-chao.xie@marvell.com>
 <1422865899-8152-2-git-send-email-chao.xie@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1422865899-8152-2-git-send-email-chao.xie@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chao Xie <chao.xie@marvell.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 02, 2015 at 08:31:36AM +0000, Chao Xie wrote:
> From: Chao Xie <chao.xie@marvell.com>
> 
> MMP timer is attached to APB bus, It has the following
> limitation.
> 1. When get count of timer counter, it need some delay
>    to get a stable count.
> 2. When set match register, it need disable the counter
>    first, and enable it after set the match register.
>    The disabling need wait for 2 clock cycle to take
>    effect.
> 
> To improve above #1, shadow register for count is added.
> To improve above #2, CRSR register is added for quick updating.
> 
> So there are three types of timer.
> timer1: old timer.
> timer2: old timer with shadow register.
> timer3: old timer with shadow and CRSR register.
> 
> This timer driver will be used for many SOCes.
> 1. pxa168, pxa910, pxa988 pxa1088 have only timer1.
> 2. pxa1L88, pxa1U88 have timer1 and timer3.
> 3. pxa1928 has timer 2.
> 
> The driver supports DT and non-DT initialization.
> The driver supports UP/SMP SOCes and 64 bit core.
> 
> Signed-off-by: Chao Xie <chao.xie@marvell.com>
> ---
>  .../devicetree/bindings/arm/mrvl/timer.txt         |  61 +-
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/timer-mmp.c                    | 837 +++++++++++++++++++++
>  include/linux/mmp_timer.h                          |  40 +
>  4 files changed, 933 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/clocksource/timer-mmp.c
>  create mode 100644 include/linux/mmp_timer.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/mrvl/timer.txt b/Documentation/devicetree/bindings/arm/mrvl/timer.txt
> index 9a6e251..b49cb3e 100644
> --- a/Documentation/devicetree/bindings/arm/mrvl/timer.txt
> +++ b/Documentation/devicetree/bindings/arm/mrvl/timer.txt
> @@ -1,13 +1,62 @@
>  * Marvell MMP Timer controller
> 
> +Each timer have multiple counters, so the timer DT need include counter's
> +description.
> +
> +1. Timer
> +
>  Required properties:
> -- compatible : Should be "mrvl,mmp-timer".
> +- compatible : Should be "marvell,mmp-timer".
>  - reg : Address and length of the register set of timer controller.
> -- interrupts : Should be the interrupt number.
> +- clocks : The first clock is the fequency of the apb bus that the timer
> +  attached to. The second clock is the fast clock frequency of the timer.
> +  This frequency and fast clock are used to calculated delay
> +  loops for clock operations.

It might be a good idea to use clock-names for "apb" and "fast" and use
them in the driver.

> +
> +Optional properties:
> +- marvell,timer-has-crsr : This timer has CRSR register.
> +- marvell,timer-has-shadow : This timer has shadow register.
> +
> +2. Counter

The coutner nodes appear to be sub-nodes of the timer. That should be
stated explicitly.

> +
> +Required properties:
> +- compatible : It can be
> +      "marvell,timer-counter-clkevt" : The counter is used for clock event
> +                                       device.
> +      "marvell,timer-counter-clksrc" : The counter is used for clock source.
> +      "marvell,timer-counter-delay" : The counter is used for delay timer.

These are all Linux-internal details. I don't see why we should need
separate strings; Linux should be able to allocate these as appropriate
(and a single timer should be able to be both a clocksource and a delay
timer).

Is there any reason you envisage for having separate strings here? It
douesn't make sense to me to do so.

> +- marvell,timer-counter-id : The counter index in this timer.

It sounds like you could use reg for this, unless you have other
sub-nodes you'll need to instantiate?

> 
> -Example:
> -       timer0: timer@d4014000 {
> -               compatible = "mrvl,mmp-timer";
> -               reg = <0xd4014000 0x100>;
> +Optional properties:
> +- marvell,fast-clock : whether the counter use the fast-clock for counting.

It looks below like this is a policy decision, rather than a description
of the HW. When would you select the fast clock and when would you not?
Why can't the driver figure this out?

> +- interrupts : The interrupt for clock event device.
> +  Only valid for "marvell,timer-counter-clkevt".
> +- marvell,timer-counter-cpu : which CPU the counter is bound. Only valid for
> +  "marvell,timer-counter-clkevt".

This sounds like a policy decision, rather than a description of the HW.

Additionally, the number usage seems to be a Linux logical ID, rather
than a physical CPU ID. This is broken.

> +- marvell,timer-counter-broadcast : When this counter acts as clock event
> +  device. It is broadcast clock event device.
> +  Only valid for "marvell,timer-counter-clkevt".

This is a Linux-internal detail. There shouldn't be a binding for this.

> +- marvell,timer-counter-nodynirq : When this counter acts as broadcast clock
> +  event device, it cannot switch the IRQ of broadcast clock event to any CPU.
> +  Only valid for "marvell,timer-counter-clkevt".

Likewise. Why can't you change the affinity?

For all of the above properties, it sounds like what you actually
need/want to do is to check if the number of available timers >=
num_possible_cpus(), and if so, (dynamically) allocate a counter to each
CPU. If not, set up a timer as a broadcast source (with dynirq).

Thanks,
Mark.
