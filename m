From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v8 3/6] clocksource: stm32: increase min delta value
Date: Fri, 8 Dec 2017 10:28:15 +0100
Message-ID: <4a9d9f25-ffcd-714c-c70f-ef1e9dbc8747@linaro.org>
References: <1510649563-22975-1-git-send-email-benjamin.gaignard@linaro.org>
 <1510649563-22975-4-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510649563-22975-4-git-send-email-benjamin.gaignard@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, tglx@linutronix.de, ludovic.barre@st.com, julien.thierry@arm.com, sudeep.holla@arm.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14/11/2017 09:52, Benjamin Gaignard wrote:
> The CPU is a CortexM4 @ 200MHZ and the clocks driving
> the timers are at 90MHZ with a min delta at 1 you could
> have an interrupt each 0.01 ms which is really to much.
> By increase it to 0x60 it give more time (around 1 ms)
> to CPU to handle the interrupt.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> ---
>  drivers/clocksource/timer-stm32.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
> index fc61fd1..ae41a19 100644
> --- a/drivers/clocksource/timer-stm32.c
> +++ b/drivers/clocksource/timer-stm32.c
> @@ -36,6 +36,8 @@
>  
>  #define TIM_EGR_UG	BIT(0)
>  
> +#define MIN_DELTA	0x60

Explain why 0x60 is a good value.

>  static int stm32_clock_event_shutdown(struct clock_event_device *evt)
>  {
>  	struct timer_of *to = to_timer_of(evt);
> @@ -129,7 +131,7 @@ static int __init stm32_clockevent_init(struct device_node *node)
>  	writel_relaxed(0, timer_of_base(to) + TIM_SR);
>  
>  	clockevents_config_and_register(&to->clkevt,
> -					timer_of_period(to), 0x1, max_delta);
> +					timer_of_period(to), MIN_DELTA, max_delta);
>  
>  	pr_info("%pOF: STM32 clockevent driver initialized (%d bits)\n",
>  			node, bits);
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
