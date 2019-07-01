From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V3 1/5] clocksource: timer-of: Support getting clock
 frequency from DT
Date: Mon, 1 Jul 2019 09:04:14 +0000
Message-ID: <DB3PR0402MB3916A54972EE7887FCB18A23F5F90__21832.3558963434$1561971882$gmane$org@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190628033041.8513-1-Anson.Huang@nxp.com>
 <17a7bde4-e5e0-a746-52a5-1075ce263152@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <17a7bde4-e5e0-a746-52a5-1075ce263152@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devi>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Daniel

> Subject: Re: [PATCH V3 1/5] clocksource: timer-of: Support getting clock
> frequency from DT
> 
> 
> Hi Anson,
> 
> thanks for taking care of adding the clock-frequency handling in the timer-of.

Sure.

> 
> On 28/06/2019 05:30, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > More and more platforms use platform driver model for clock driver, so
> > the clock driver is NOT ready during timer initialization phase, it
> > will cause timer initialization failed.
> >
> > To support those platforms with upper scenario, introducing a new flag
> > TIMER_OF_CLOCK_FREQUENCY which is mutually exclusive with
> > TIMER_OF_CLOCK flag to support getting timer clock frequency from DT,
> > then of_clk operations can be skipped.
> >
> > User needs to select either TIMER_OF_CLOCK_FREQUENCY or
> TIMER_OF_CLOCK
> > flag if want to use timer-of driver to initialize the clock rate, and
> > the corresponding clock name or property name needs to be specified.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> > New patch:
> > 	- Add new flag of TIMER_OF_CLOCK_FREQUENCY, mutually exclusive
> with TIMER_OF_CLOCK, to support
> > 	  getting clock frequency from DT directly;
> > 	- Add prop_name to of_timer_clk structure, if using
> TIMER_OF_CLOCK_FREQUENCY flag, user needs
> > 	  to pass the property name for timer-of driver to get clock frequency
> from DT, this is to avoid
> > 	  the couple of timer-of driver and DT, so timer-of driver does NOT
> use a fixed property name.
> > ---
> >  drivers/clocksource/timer-of.c | 23 +++++++++++++++++++++++
> > drivers/clocksource/timer-of.h |  8 +++++---
> >  2 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clocksource/timer-of.c
> > b/drivers/clocksource/timer-of.c index 8054228..c91a8b6 100644
> > --- a/drivers/clocksource/timer-of.c
> > +++ b/drivers/clocksource/timer-of.c
> > @@ -161,6 +161,21 @@ static __init int timer_of_base_init(struct
> device_node *np,
> >  	return 0;
> >  }
> >
> > +static __init int timer_of_clk_frequency_init(struct device_node *np,
> > +					      struct of_timer_clk *of_clk) {
> > +	int ret;
> > +	u32 rate;
> > +
> > +	ret = of_property_read_u32(np, of_clk->prop_name, &rate);
> > +	if (!ret) {
> > +		of_clk->rate = rate;
> > +		of_clk->period = DIV_ROUND_UP(rate, HZ);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  int __init timer_of_init(struct device_node *np, struct timer_of *to)
> > {
> >  	int ret = -EINVAL;
> > @@ -178,6 +193,11 @@ int __init timer_of_init(struct device_node *np,
> struct timer_of *to)
> >  		if (ret)
> >  			goto out_fail;
> >  		flags |= TIMER_OF_CLOCK;
> > +	} else if (to->flags & TIMER_OF_CLOCK_FREQUENCY) {
> > +		ret = timer_of_clk_frequency_init(np, &to->of_clk);
> > +		if (ret)
> > +			goto out_fail;
> > +		flags |= TIMER_OF_CLOCK_FREQUENCY;
> >  	}
> 
> /* Pre-condition */
> 
> if (to->flags & (TIMER_OF_CLOCK | TIMER_OF_CLOCK_FREQUENCY))
> 	return -EINVAL;
> 
> [ ... ]
> 
> if (to->flags & TIMER_OF_CLOCK) {
> }
> 
> if (to->flags & TIMER_OF_CLOCK_FREQUENCY) { }
> 

Ah, make sense, they are exclusive, will add it in next version.

> >  	if (to->flags & TIMER_OF_IRQ) {
> > @@ -201,6 +221,9 @@ int __init timer_of_init(struct device_node *np,
> struct timer_of *to)
> >  	if (flags & TIMER_OF_CLOCK)
> >  		timer_of_clk_exit(&to->of_clk);
> >
> > +	if (flags & TIMER_OF_CLOCK_FREQUENCY)
> > +		to->of_clk.rate = 0;
> > +
> >  	if (flags & TIMER_OF_BASE)
> >  		timer_of_base_exit(&to->of_base);
> >  	return ret;
> > diff --git a/drivers/clocksource/timer-of.h
> > b/drivers/clocksource/timer-of.h index a5478f3..f1a083e 100644
> > --- a/drivers/clocksource/timer-of.h
> > +++ b/drivers/clocksource/timer-of.h
> > @@ -4,9 +4,10 @@
> >
> >  #include <linux/clockchips.h>
> >
> > -#define TIMER_OF_BASE	0x1
> > -#define TIMER_OF_CLOCK	0x2
> > -#define TIMER_OF_IRQ	0x4
> > +#define TIMER_OF_BASE			0x1
> > +#define TIMER_OF_CLOCK			0x2
> > +#define TIMER_OF_IRQ			0x4
> > +#define TIMER_OF_CLOCK_FREQUENCY	0x8
> >
> >  struct of_timer_irq {
> >  	int irq;
> > @@ -26,6 +27,7 @@ struct of_timer_base {  struct of_timer_clk {
> >  	struct clk *clk;
> >  	const char *name;
> > +	const char *prop_name;
> 
> For the moment, keep it hardcoded with "clock-frequency" directly in the
> function.

OK, then I will NOT add any dt-binding for this property. The reason to use prop_name
instead of hardcode is I don't want to create a binding doc just for this property.

Thanks,
Anson. 
