From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 4/9] clocksource: mediatek: Use GPT as sched clock source
Date: Fri, 3 Jul 2015 21:48:42 +0800
Message-ID: <CAGS+omDa4X7daAYD6SDuEM6bMQwojNUCnGMGiUwnJ6M_yBTRLg@mail.gmail.com>
References: <1431763110-443-1-git-send-email-yingjoe.chen@mediatek.com>
 <1431763110-443-5-git-send-email-yingjoe.chen@mediatek.com> <CABuKBeJhdRBBw1v1kj8J0YFVWZ27vzx5W=XU8jiwePVgL_7g_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABuKBeJhdRBBw1v1kj8J0YFVWZ27vzx5W=XU8jiwePVgL_7g_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 20, 2015 at 7:02 PM, Matthias Brugger
<matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 2015-05-16 9:58 GMT+02:00 Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
>> When cpu is in deep idle, arch timer will stop counting. Setup GPT as
>> sched clock source so it can keep counting in idle.
>>
>> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> ---
>>  drivers/clocksource/mtk_timer.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
>> index 91206f9..fe7cf72 100644
>> --- a/drivers/clocksource/mtk_timer.c
>> +++ b/drivers/clocksource/mtk_timer.c
>> @@ -24,6 +24,7 @@
>>  #include <linux/of.h>
>>  #include <linux/of_address.h>
>>  #include <linux/of_irq.h>
>> +#include <linux/sched_clock.h>
>>  #include <linux/slab.h>
>>
>>  #define GPT_IRQ_EN_REG         0x00
>> @@ -59,6 +60,13 @@ struct mtk_clock_event_device {
>>         struct clock_event_device dev;
>>  };
>>
>> +static void __iomem *gpt_base __read_mostly;
>> +
>> +static u64 notrace mtk_read_sched_clock(void)
>> +{
>> +       return readl_relaxed(gpt_base + TIMER_CNT_REG(GPT_CLK_SRC));
>> +}
>> +
>>  static inline struct mtk_clock_event_device *to_mtk_clk(
>>                                 struct clock_event_device *c)
>>  {
>> @@ -243,6 +251,8 @@ static void __init mtk_timer_init(struct device_node *node)
>>         mtk_timer_setup(evt, GPT_CLK_SRC, TIMER_CTRL_OP_FREERUN, 1);
>>         clocksource_mmio_init(evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC),
>>                         node->name, rate, 300, 32, clocksource_mmio_readl_up);
>> +       gpt_base = evt->gpt_base;
>
> This is really hacky. We should clean up the code and provide
> mtk_clock_event_device globally.
> Please add the patch below, which does exactly this.

I don't think this is so hacky.
In light of Stephen's comment about the benefit of using
container_of() to extract gpt_base from the passed in struct
clock_event_device in the other routines, what is the benefit of
making more of mtk_clock_event_device global?
I think what Yingjoe has implemented is short and sweet.

Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
