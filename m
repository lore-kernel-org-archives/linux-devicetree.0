From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 04/11] ARM: davinci: da850: switch to using the
 clocksource driver
Date: Tue, 12 Mar 2019 13:36:36 -0500
Message-ID: <8c8cfed0-f52b-06c7-21e2-38039dc99a71@lechnology.com>
References: <20190226120633.18200-1-brgl@bgdev.pl>
 <20190226120633.18200-5-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226120633.18200-5-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 2/26/19 6:06 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We now have a proper clocksource driver for davinci. Switch the da850
> platform to using it.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>

>   arch/arm/mach-davinci/da850.c | 41 ++++++++++-------------------------
>   1 file changed, 11 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
> index 72d64d39d42a..5ce58ae0d764 100644
> --- a/arch/arm/mach-davinci/da850.c
> +++ b/arch/arm/mach-davinci/da850.c
> @@ -34,7 +34,8 @@
>   #include <mach/cputype.h>
>   #include <mach/da8xx.h>
>   #include <mach/pm.h>
> -#include <mach/time.h>
> +
> +#include <clocksource/timer-davinci.h>
>   
>   #include "irqs.h"
>   #include "mux.h"
> @@ -332,38 +333,17 @@ static struct davinci_id da850_ids[] = {
>   	},
>   };
>   
> -static struct davinci_timer_instance da850_timer_instance[4] = {
> -	{
> -		.base		= DA8XX_TIMER64P0_BASE,
> -		.bottom_irq	= DAVINCI_INTC_IRQ(IRQ_DA8XX_TINT12_0),
> -		.top_irq	= DAVINCI_INTC_IRQ(IRQ_DA8XX_TINT34_0),
> -	},
> -	{
> -		.base		= DA8XX_TIMER64P1_BASE,
> -		.bottom_irq	= DAVINCI_INTC_IRQ(IRQ_DA8XX_TINT12_1),
> -		.top_irq	= DAVINCI_INTC_IRQ(IRQ_DA8XX_TINT34_1),
> -	},
> -	{
> -		.base		= DA850_TIMER64P2_BASE,
> -		.bottom_irq	= DAVINCI_INTC_IRQ(IRQ_DA850_TINT12_2),
> -		.top_irq	= DAVINCI_INTC_IRQ(IRQ_DA850_TINT34_2),
> -	},
> -	{
> -		.base		= DA850_TIMER64P3_BASE,
> -		.bottom_irq	= DAVINCI_INTC_IRQ(IRQ_DA850_TINT12_3),
> -		.top_irq	= DAVINCI_INTC_IRQ(IRQ_DA850_TINT34_3),
> -	},
> -};
> -
>   /*
>    * T0_BOT: Timer 0, bottom		: Used for clock_event
>    * T0_TOP: Timer 0, top			: Used for clocksource
>    * T1_BOT, T1_TOP: Timer 1, bottom & top: Used for watchdog timer

It looks like we could drop the mention of the watchdog timer here.
And T0_BOT/T0_TOP don't really have a meaning anymore.

>    */
> -static struct davinci_timer_info da850_timer_info = {
> -	.timers		= da850_timer_instance,
> -	.clockevent_id	= T0_BOT,
> -	.clocksource_id	= T0_TOP,
> +static const struct davinci_timer_cfg da850_timer_cfg = {
> +	.reg = DEFINE_RES_IO(DA8XX_TIMER64P0_BASE, SZ_4K),
> +	.irq = {
> +		DEFINE_RES_IRQ(DAVINCI_INTC_IRQ(IRQ_DA8XX_TINT12_0)),
> +		DEFINE_RES_IRQ(DAVINCI_INTC_IRQ(IRQ_DA8XX_TINT34_0)),
> +	},
>   };
