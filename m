From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 2/6] clocksource: add Marvell Orion SoC timer
Date: Sat, 08 Jun 2013 00:03:13 +0200
Message-ID: <51B258A1.2060107@linaro.org>
References: <1370536034-23956-1-git-send-email-sebastian.hesselbarth@gmail.com> <1370536034-23956-3-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1370536034-23956-3-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/06/2013 06:27 PM, Sebastian Hesselbarth wrote:
> This patch add a DT enabled driver for timers found on Marvell Orion =
SoCs
> (Kirkwood, Dove, Orion5x, and Discovery Innovation). It installs a fr=
ee-
> running clocksource on timer0 and a clockevent source on timer1.
> Corresponding device tree documentation is also added.
>=20
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com=
>
> ---
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Rob Landley <rob@landley.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gregory Clement <gregory.clement@free-electrons.com>
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../bindings/timer/marvell,orion-timer.txt         |   17 +++
>  drivers/clocksource/Kconfig                        |    5 +
>  drivers/clocksource/Makefile                       |    1 +
>  drivers/clocksource/time-orion.c                   |  143 ++++++++++=
++++++++++
>  4 files changed, 166 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/marvell,o=
rion-timer.txt
>  create mode 100644 drivers/clocksource/time-orion.c
>=20
> diff --git a/Documentation/devicetree/bindings/timer/marvell,orion-ti=
mer.txt b/Documentation/devicetree/bindings/timer/marvell,orion-timer.t=
xt
> new file mode 100644
> index 0000000..62bb826
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/marvell,orion-timer.txt
> @@ -0,0 +1,17 @@
> +Marvell Orion SoC timer
> +
> +Required properties:
> +- compatible: shall be "marvell,orion-timer"
> +- reg: base address of the timer register starting with TIMERS CONTR=
OL register
> +- interrupt-parent: phandle of the bridge interrupt controller
> +- interrupts: should contain the interrupts for Timer0 and Timer1
> +- clocks: phandle of timer reference clock (tclk)
> +
> +Example:
> +	timer: timer {
> +		compatible =3D "marvell,orion-timer";
> +		reg =3D <0x20300 0x20>;
> +		interrupt-parent =3D <&bridge_intc>;
> +		interrupts =3D <1>, <2>;
> +		clocks =3D <&core_clk 0>;
> +	};
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> index f151c6c..2404869 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -25,6 +25,11 @@ config DW_APB_TIMER_OF
>  config ARMADA_370_XP_TIMER
>  	bool
> =20
> +config ORION_TIMER
> +	select CLKSRC_OF
> +	select CLKSRC_MMIO
> +	bool
> +
>  config SUN4I_TIMER
>  	bool

[ ... ]

> +
> +static irqreturn_t orion_clkevt_irq_handler(int irq, void *dev_id)
> +{
> +	orion_clkevt.event_handler(&orion_clkevt);
> +	return IRQ_HANDLED;
> +}
> +
> +static struct irqaction orion_clkevt_irq =3D {
> +	.name		=3D "orion_event",
> +	.flags		=3D IRQF_DISABLED | IRQF_TIMER,

IRQF_DISABLED is deprecated, it is a noop, you shall remove it.

> +	.handler	=3D orion_clkevt_irq_handler,
> +};
> +
> +static void __init orion_timer_init(struct device_node *np)
> +{

[ ... ]

> +	/* setup timer1 as clockevent timer */
> +	if (setup_irq(irq, &orion_clkevt_irq))
> +		panic("%s: unable to setup irq\n", np->name);
> +
> +	ticks_per_jiffy =3D (clk_get_rate(clk) + HZ/2) / HZ;
> +	orion_clkevt.cpumask =3D cpumask_of(0);

        orion_clkevt.irq =3D irq;

> +	clockevents_config_and_register(&orion_clkevt, clk_get_rate(clk),
> +					ORION_ONESHOT_MIN, ORION_ONESHOT_MAX);
> +}
> +CLOCKSOURCE_OF_DECLARE(orion_timer, "marvell,orion-timer", orion_tim=
er_init);
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

