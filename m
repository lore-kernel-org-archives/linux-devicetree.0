From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 5/5] clocksource/drivers/timer-mediatek: Add support
 for system timer
Date: Thu, 28 Jun 2018 16:08:59 +0200
Message-ID: <b025b8c2-9cfd-466e-ec1c-9fa5e2148904@linaro.org>
References: <1530182744-10731-1-git-send-email-stanley.chu@mediatek.com>
 <1530182744-10731-6-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530182744-10731-6-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 28/06/2018 12:45, Stanley Chu wrote:
> This patch adds a new "System Timer" on the Mediatek SoCs.
> 
> The System Timer is introduced as an always-on timer being
> clockevent device for tick-broadcasting.
> 
> For clock, it is driven by 13 MHz system clock.
> The implementation uses the system clock with no clock
> source divider.
> 
> For interrupt, the clock event timer can be used by all cores.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---

Please do the GPT prefix in patch 3/5, so this patch will contain 'syst'
addition only.

>  drivers/clocksource/timer-mediatek.c |  225 +++++++++++++++++++++++++---------
>  1 file changed, 167 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index d94d8e1..6878736 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -26,32 +26,46 @@
>  #include <linux/slab.h>
>  #include "timer-of.h"
>  
> -#define GPT_IRQ_EN_REG		0x00
> -#define GPT_IRQ_ENABLE(val)	BIT((val) - 1)
> -#define GPT_IRQ_ACK_REG		0x08
> -#define GPT_IRQ_ACK(val)	BIT((val) - 1)
> -
> -#define TIMER_CTRL_REG(val)	(0x10 * (val))
> -#define TIMER_CTRL_OP(val)	(((val) & 0x3) << 4)
> -#define TIMER_CTRL_OP_ONESHOT	(0)
> -#define TIMER_CTRL_OP_REPEAT	(1)
> -#define TIMER_CTRL_OP_FREERUN	(3)
> -#define TIMER_CTRL_CLEAR	(2)
> -#define TIMER_CTRL_ENABLE	(1)
> -#define TIMER_CTRL_DISABLE	(0)
> -
> -#define TIMER_CLK_REG(val)	(0x04 + (0x10 * (val)))
> -#define TIMER_CLK_SRC(val)	(((val) & 0x1) << 4)
> -#define TIMER_CLK_SRC_SYS13M	(0)
> -#define TIMER_CLK_SRC_RTC32K	(1)
> -#define TIMER_CLK_DIV1		(0x0)
> -#define TIMER_CLK_DIV2		(0x1)
> -
> -#define TIMER_CNT_REG(val)	(0x08 + (0x10 * (val)))
> -#define TIMER_CMP_REG(val)	(0x0C + (0x10 * (val)))
> -
> -#define GPT_CLK_EVT	1
> -#define GPT_CLK_SRC	2
> +#define TIMER_CLK_EVT           (1)
> +#define TIMER_CLK_SRC           (2)
> +
> +#define TIMER_SYNC_TICKS        (3)
> +
> +/* gpt */
> +#define GPT_IRQ_EN_REG          0x00
> +#define GPT_IRQ_ENABLE(val)     BIT((val) - 1)
> +#define GPT_IRQ_ACK_REG	        0x08
> +#define GPT_IRQ_ACK(val)        BIT((val) - 1)
> +
> +#define GPT_CTRL_REG(val)       (0x10 * (val))
> +#define GPT_CTRL_OP(val)        (((val) & 0x3) << 4)
> +#define GPT_CTRL_OP_ONESHOT     (0)
> +#define GPT_CTRL_OP_REPEAT      (1)
> +#define GPT_CTRL_OP_FREERUN     (3)
> +#define GPT_CTRL_CLEAR          (2)
> +#define GPT_CTRL_ENABLE         (1)
> +#define GPT_CTRL_DISABLE        (0)
> +
> +#define GPT_CLK_REG(val)        (0x04 + (0x10 * (val)))
> +#define GPT_CLK_SRC(val)        (((val) & 0x1) << 4)
> +#define GPT_CLK_SRC_SYS13M      (0)
> +#define GPT_CLK_SRC_RTC32K      (1)
> +#define GPT_CLK_DIV1            (0x0)
> +#define GPT_CLK_DIV2            (0x1)
> +
> +#define GPT_CNT_REG(val)        (0x08 + (0x10 * (val)))
> +#define GPT_CMP_REG(val)        (0x0C + (0x10 * (val)))

Please do the GPT prefix in patch 3/5, so this patch will contain 'syst'
addition only and will make review easier.

Thanks.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
