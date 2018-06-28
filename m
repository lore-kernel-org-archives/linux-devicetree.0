From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 4/5] clocksource/drivers/timer-mediatek: Convert the
 driver to timer-of
Date: Thu, 28 Jun 2018 16:03:18 +0200
Message-ID: <5cdfbfdf-4d6e-de18-0f20-2f3b50129b87@linaro.org>
References: <1530182744-10731-1-git-send-email-stanley.chu@mediatek.com>
 <1530182744-10731-5-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530182744-10731-5-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 28/06/2018 12:45, Stanley Chu wrote:
> Convert the driver to use the timer_of helpers.
> This allows to remove custom proprietary structure,
> factors out and simplifies the code.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/clocksource/timer-mediatek.c |  222 ++++++++++++++++------------------
>  1 file changed, 104 insertions(+), 118 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index ff284f2..d94d8e1 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -18,16 +18,13 @@
>  
>  #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>  
> -#include <linux/clk.h>
>  #include <linux/clockchips.h>
> +#include <linux/clocksource.h>
>  #include <linux/interrupt.h>
> -#include <linux/irq.h>
>  #include <linux/irqreturn.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_irq.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
> +#include "timer-of.h"
>  
>  #define GPT_IRQ_EN_REG		0x00
>  #define GPT_IRQ_ENABLE(val)	BIT((val) - 1)
> @@ -56,49 +53,57 @@
>  #define GPT_CLK_EVT	1
>  #define GPT_CLK_SRC	2
>  
> -struct mtk_clock_event_device {
> -	void __iomem *gpt_base;
> -	u32 ticks_per_jiffy;
> -	struct clock_event_device dev;
> +struct mtk_timer_private {
> +	unsigned long ticks_per_jiffy;
>  };

This private structure is not needed. There is timer_of_clk->period

cf.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clocksource/timer-of.c#n144





-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
