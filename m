From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH RESEND V2 2/3] clocksource: imx-sysctr: Make timer work
 with clock driver using platform driver model
Date: Thu, 27 Jun 2019 14:36:27 +0200
Message-ID: <41ab1a50-f431-ec73-8444-11ecca1412d8@linaro.org>
References: <20190623123850.22584-1-Anson.Huang@nxp.com>
 <20190623123850.22584-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623123850.22584-2-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, l.stach@pengutronix.de, abel.vesa@nxp.com, ccaione@baylibre.com, angus@akkea.ca, andrew.smirnov@gmail.com, agx@sigxcpu.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 23/06/2019 14:38, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> On some i.MX8M platforms, clock driver uses platform driver
> model and it is NOT ready during timer initialization phase,
> the clock operations will fail and system counter driver will
> fail too. As all the i.MX8M platforms' system counter clock
> are from OSC which is always enabled, so it is no need to enable
> clock for system counter driver, the ONLY thing is to pass
> clock frequence to driver.
> 
> To make system counter driver work for upper scenario, add an
> option of skipping of_clk operation for system counter driver,
> an optional property "clock-frequency" is introduced to pass
> the frequency value to system counter driver and indicate driver
> to skip of_clk operations.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- improve commit log, no content change.
> ---
>  drivers/clocksource/timer-imx-sysctr.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-imx-sysctr.c b/drivers/clocksource/timer-imx-sysctr.c
> index fd7d680..8ff3d7e 100644
> --- a/drivers/clocksource/timer-imx-sysctr.c
> +++ b/drivers/clocksource/timer-imx-sysctr.c
> @@ -129,6 +129,14 @@ static void __init sysctr_clockevent_init(void)
>  static int __init sysctr_timer_init(struct device_node *np)
>  {
>  	int ret = 0;
> +	u32 rate;
> +
> +	if (!of_property_read_u32(np, "clock-frequency",
> +				  &rate)) {
> +		to_sysctr.of_clk.rate = rate;
> +		to_sysctr.of_clk.period = DIV_ROUND_UP(rate, HZ);
> +		to_sysctr.flags &= ~TIMER_OF_CLOCK;
> +	}

Please take the opportunity to add the TIMER_OF_CLOCK_FREQUENCY flag in
timer-of and the corresponding code above.

Then check the clock-frequency presence and add TIMER_OF_CLOCK or
TIMER_OF_CLOCK_FREQUENCY flag to the timer-of structure.

eg:

    to_sysctr.flags |= of_find_property(np, "clock-frequency", NULL) ?
		TIMER_OF_CLOCK_FREQUENCY : TIMER_OF_CLOCK;
	



>  	ret = timer_of_init(np, &to_sysctr);
>  	if (ret)
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
