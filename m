Return-Path: <SRS0=Lb5v=U7=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH RESEND V4 1/5] clocksource: timer-of: Support getting
 clock frequency from DT
References: <20190702075513.17451-1-Anson.Huang@nxp.com>
 <c7ff76e5-d73d-e71e-c3f4-445bdd2c5b93@linaro.org>
 <DB3PR0402MB39166F04BAF9BA9D6C75B3A8F5F80@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <0540a255-93e5-d68f-5bf5-31f9043fb3ad@linaro.org>
Date: Tue, 2 Jul 2019 11:07:40 +0200
MIME-Version: 1.0
In-Reply-To: <DB3PR0402MB39166F04BAF9BA9D6C75B3A8F5F80@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Anson Huang <anson.huang@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 02/07/2019 11:03, Anson Huang wrote:
> Hi, Daniel
> 
>> Hi Anson,
>>
>> why did you resend the series?
> 
> Previous patch series has build warning and I did NOT notice, sorry for that,
> 
> drivers/clocksource/timer-of.c: In function ‘timer_of_init’:
> drivers/clocksource/timer-of.c:185:30: warning: suggest parentheses around comparison in operand of ‘&’ [-Wparentheses]
>   if (to->flags & clock_flags == clock_flags)
>                               ^
> 
> so I resend the patch series with below, sorry for missing mention of the changes in resent patch series.
> 
>  +	if ((to->flags & clock_flags) == clock_flags)
> 
> Sorry for mail storm...

No problem at all, I prefer this caught and fixed early :)

Next time just send a V5 because 'resend' means there is no change but
there was a problem with the email (could be also interpreted as a
gentle ping).

>> On 02/07/2019 09:55, Anson.Huang@nxp.com wrote:
>>> From: Anson Huang <Anson.Huang@nxp.com>
>>>
>>> More and more platforms use platform driver model for clock driver, so
>>> the clock driver is NOT ready during timer initialization phase, it
>>> will cause timer initialization failed.
>>>
>>> To support those platforms with upper scenario, introducing a new flag
>>> TIMER_OF_CLOCK_FREQUENCY which is mutually exclusive with
>>> TIMER_OF_CLOCK flag to support getting timer clock frequency from DT's
>>> timer node, the property name should be "clock-frequency", then of_clk
>>> operations can be skipped.
>>>
>>> User needs to select either TIMER_OF_CLOCK_FREQUENCY or
>> TIMER_OF_CLOCK
>>> flag if want to use timer-of driver to initialize the clock rate.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>> ---
>>> Changes since V3:
>>> 	- use hardcoded "clock-frequency" instead of adding new variable
>> prop_name;
>>> 	- add pre-condition check for TIMER_OF_CLOCK and
>> TIMER_OF_CLOCK_FREQUENCY, they MUST be exclusive.
>>> ---
>>>  drivers/clocksource/timer-of.c | 29 +++++++++++++++++++++++++++++
>>> drivers/clocksource/timer-of.h |  7 ++++---
>>>  2 files changed, 33 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/clocksource/timer-of.c
>>> b/drivers/clocksource/timer-of.c index 8054228..858f684 100644
>>> --- a/drivers/clocksource/timer-of.c
>>> +++ b/drivers/clocksource/timer-of.c
>>> @@ -161,11 +161,30 @@ static __init int timer_of_base_init(struct
>> device_node *np,
>>>  	return 0;
>>>  }
>>>
>>> +static __init int timer_of_clk_frequency_init(struct device_node *np,
>>> +					      struct of_timer_clk *of_clk) {
>>> +	int ret;
>>> +	u32 rate;
>>> +
>>> +	ret = of_property_read_u32(np, "clock-frequency", &rate);
>>> +	if (!ret) {
>>> +		of_clk->rate = rate;
>>> +		of_clk->period = DIV_ROUND_UP(rate, HZ);
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>  int __init timer_of_init(struct device_node *np, struct timer_of *to)
>>> {
>>> +	unsigned long clock_flags = TIMER_OF_CLOCK |
>>> +TIMER_OF_CLOCK_FREQUENCY;
>>>  	int ret = -EINVAL;
>>>  	int flags = 0;
>>>
>>> +	if ((to->flags & clock_flags) == clock_flags)
>>> +		return ret;
>>> +
>>>  	if (to->flags & TIMER_OF_BASE) {
>>>  		ret = timer_of_base_init(np, &to->of_base);
>>>  		if (ret)
>>> @@ -180,6 +199,13 @@ int __init timer_of_init(struct device_node *np,
>> struct timer_of *to)
>>>  		flags |= TIMER_OF_CLOCK;
>>>  	}
>>>
>>> +	if (to->flags & TIMER_OF_CLOCK_FREQUENCY) {
>>> +		ret = timer_of_clk_frequency_init(np, &to->of_clk);
>>> +		if (ret)
>>> +			goto out_fail;
>>> +		flags |= TIMER_OF_CLOCK_FREQUENCY;
>>> +	}
>>> +
>>>  	if (to->flags & TIMER_OF_IRQ) {
>>>  		ret = timer_of_irq_init(np, &to->of_irq);
>>>  		if (ret)
>>> @@ -201,6 +227,9 @@ int __init timer_of_init(struct device_node *np,
>> struct timer_of *to)
>>>  	if (flags & TIMER_OF_CLOCK)
>>>  		timer_of_clk_exit(&to->of_clk);
>>>
>>> +	if (flags & TIMER_OF_CLOCK_FREQUENCY)
>>> +		to->of_clk.rate = 0;
>>> +
>>>  	if (flags & TIMER_OF_BASE)
>>>  		timer_of_base_exit(&to->of_base);
>>>  	return ret;
>>> diff --git a/drivers/clocksource/timer-of.h
>>> b/drivers/clocksource/timer-of.h index a5478f3..a08e108 100644
>>> --- a/drivers/clocksource/timer-of.h
>>> +++ b/drivers/clocksource/timer-of.h
>>> @@ -4,9 +4,10 @@
>>>
>>>  #include <linux/clockchips.h>
>>>
>>> -#define TIMER_OF_BASE	0x1
>>> -#define TIMER_OF_CLOCK	0x2
>>> -#define TIMER_OF_IRQ	0x4
>>> +#define TIMER_OF_BASE			0x1
>>> +#define TIMER_OF_CLOCK			0x2
>>> +#define TIMER_OF_IRQ			0x4
>>> +#define TIMER_OF_CLOCK_FREQUENCY	0x8
>>>
>>>  struct of_timer_irq {
>>>  	int irq;


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
