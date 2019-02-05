From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 05/12] ARM: davinci: da850: switch to using the
 clocksource driver
Date: Mon, 4 Feb 2019 20:35:00 -0600
Message-ID: <8baa1707-aaea-ef83-839f-be23787d0312@lechnology.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-6-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204171757.32073-6-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 2/4/19 11:17 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We now have a proper clocksource driver for davinci. Switch the platform
> to using it.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   arch/arm/mach-davinci/da850.c | 56 ++++++++++++++---------------------
>   1 file changed, 22 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
> index beb34ee42e3a..66c2ffd4885b 100644
> --- a/arch/arm/mach-davinci/da850.c
> +++ b/arch/arm/mach-davinci/da850.c
> @@ -34,7 +34,8 @@
>   #include <mach/da8xx.h>
>   #include <mach/irqs.h>
>   #include <mach/pm.h>
> -#include <mach/time.h>
> +
> +#include <clocksource/timer-davinci.h>
>   
>   #include "mux.h"
>   
> @@ -436,38 +437,24 @@ static struct davinci_id da850_ids[] = {
>   	},
>   };
>   
> -static struct davinci_timer_instance da850_timer_instance[4] = {
> -	{
> -		.base		= DA8XX_TIMER64P0_BASE,
> -		.bottom_irq	= IRQ_DA8XX_TINT12_0,
> -		.top_irq	= IRQ_DA8XX_TINT34_0,
> -	},
> -	{
> -		.base		= DA8XX_TIMER64P1_BASE,
> -		.bottom_irq	= IRQ_DA8XX_TINT12_1,
> -		.top_irq	= IRQ_DA8XX_TINT34_1,
> -	},
> -	{
> -		.base		= DA850_TIMER64P2_BASE,
> -		.bottom_irq	= IRQ_DA850_TINT12_2,
> -		.top_irq	= IRQ_DA850_TINT34_2,
> -	},
> -	{
> -		.base		= DA850_TIMER64P3_BASE,
> -		.bottom_irq	= IRQ_DA850_TINT12_3,
> -		.top_irq	= IRQ_DA850_TINT34_3,
> +static const struct davinci_timer_cfg da850_timer_cfg = {
> +	.reg = {
> +		.start		= DA8XX_TIMER64P0_BASE,
> +		.end		= DA8XX_TIMER64P0_BASE + SZ_4K,

Missing minus one?

+		.end		= DA8XX_TIMER64P0_BASE + SZ_4K - 1,


> +		.flags		= IORESOURCE_MEM,
>   	},
> -};
> -
> -/*
> - * T0_BOT: Timer 0, bottom		: Used for clock_event
> - * T0_TOP: Timer 0, top			: Used for clocksource
> - * T1_BOT, T1_TOP: Timer 1, bottom & top: Used for watchdog timer
> - */
> -static struct davinci_timer_info da850_timer_info = {
> -	.timers		= da850_timer_instance,
> -	.clockevent_id	= T0_BOT,
> -	.clocksource_id	= T0_TOP,
> +	.irq = {
> +		{

It would be nice to use the enum values from <clocksource/timer-davinci.h>
here so we know which IRQ is which.

		[DAVINCI_TIMER_CLOCKEVENT_IRQ] = {

> +			.start	= IRQ_DA8XX_TINT12_0,
> +			.end	= IRQ_DA8XX_TINT12_0,

Can .end be omitted since it is the same as .start?

> +			.flags	= IORESOURCE_IRQ,
> +		},
> +		{

		[DAVINCI_TIMER_CLOCKSOURCE_IRQ] = {

> +			.start	= IRQ_DA8XX_TINT34_0,
> +			.end	= IRQ_DA8XX_TINT34_0,
> +			.flags	= IORESOURCE_IRQ,
> +		}
> +	}
>   };
>   
>   #ifdef CONFIG_CPU_FREQ
> @@ -742,7 +729,6 @@ static const struct davinci_soc_info davinci_soc_info_da850 = {
>   	.intc_type		= DAVINCI_INTC_TYPE_CP_INTC,
>   	.intc_irq_prios		= da850_default_priorities,
>   	.intc_irq_num		= DA850_N_CP_INTC_IRQ,
> -	.timer_info		= &da850_timer_info,
>   	.emac_pdata		= &da8xx_emac_pdata,
>   	.sram_dma		= DA8XX_SHARED_RAM_BASE,
>   	.sram_len		= SZ_128K,
> @@ -765,6 +751,7 @@ void __init da850_init_time(void)
>   	void __iomem *pll0;
>   	struct regmap *cfgchip;
>   	struct clk *clk;
> +	int rv;

bikeshed: int ret; and int err; are used way more often, so rv looks
strange to me.

>   
>   	clk_register_fixed_rate(NULL, "ref_clk", NULL, 0, DA850_REF_FREQ);
>   
> @@ -779,7 +766,8 @@ void __init da850_init_time(void)
>   		return;
>   	}
>   
> -	davinci_timer_init(clk);
> +	rv = davinci_timer_register(clk, &da850_timer_cfg);
> +	WARN(rv, "Unable to register the timer: %d\n", rv);
>   }
>   
>   static struct resource da850_pll1_resources[] = {
> 
