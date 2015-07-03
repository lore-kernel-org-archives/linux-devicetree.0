From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 4/9] clocksource: mediatek: Use GPT as sched clock source
Date: Fri, 03 Jul 2015 17:51:34 +0200
Message-ID: <1551938.VHQvCCENeg@ubix>
References: <1431763110-443-1-git-send-email-yingjoe.chen@mediatek.com> <CABuKBeJhdRBBw1v1kj8J0YFVWZ27vzx5W=XU8jiwePVgL_7g_g@mail.gmail.com> <CAGS+omDa4X7daAYD6SDuEM6bMQwojNUCnGMGiUwnJ6M_yBTRLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGS+omDa4X7daAYD6SDuEM6bMQwojNUCnGMGiUwnJ6M_yBTRLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marc Carino <marc.ceeeee@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, srv_heupstream <srv_heupstream@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday, July 03, 2015 09:48:42 PM Daniel Kurtz wrote:
> On Wed, May 20, 2015 at 7:02 PM, Matthias Brugger
> 
> <matthias.bgg@gmail.com> wrote:
> > 2015-05-16 9:58 GMT+02:00 Yingjoe Chen <yingjoe.chen@mediatek.com>:
> >> When cpu is in deep idle, arch timer will stop counting. Setup GPT as
> >> sched clock source so it can keep counting in idle.
> >> 
> >> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> >> ---
> >> 
> >>  drivers/clocksource/mtk_timer.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >> 
> >> diff --git a/drivers/clocksource/mtk_timer.c
> >> b/drivers/clocksource/mtk_timer.c index 91206f9..fe7cf72 100644
> >> --- a/drivers/clocksource/mtk_timer.c
> >> +++ b/drivers/clocksource/mtk_timer.c
> >> @@ -24,6 +24,7 @@
> >> 
> >>  #include <linux/of.h>
> >>  #include <linux/of_address.h>
> >>  #include <linux/of_irq.h>
> >> 
> >> +#include <linux/sched_clock.h>
> >> 
> >>  #include <linux/slab.h>
> >>  
> >>  #define GPT_IRQ_EN_REG         0x00
> >> 
> >> @@ -59,6 +60,13 @@ struct mtk_clock_event_device {
> >> 
> >>         struct clock_event_device dev;
> >>  
> >>  };
> >> 
> >> +static void __iomem *gpt_base __read_mostly;
> >> +
> >> +static u64 notrace mtk_read_sched_clock(void)
> >> +{
> >> +       return readl_relaxed(gpt_base + TIMER_CNT_REG(GPT_CLK_SRC));
> >> +}
> >> +
> >> 
> >>  static inline struct mtk_clock_event_device *to_mtk_clk(
> >>  
> >>                                 struct clock_event_device *c)
> >>  
> >>  {
> >> 
> >> @@ -243,6 +251,8 @@ static void __init mtk_timer_init(struct device_node
> >> *node)>> 
> >>         mtk_timer_setup(evt, GPT_CLK_SRC, TIMER_CTRL_OP_FREERUN, 1);
> >>         clocksource_mmio_init(evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC),
> >>         
> >>                         node->name, rate, 300, 32,
> >>                         clocksource_mmio_readl_up);
> >> 
> >> +       gpt_base = evt->gpt_base;
> > 
> > This is really hacky. We should clean up the code and provide
> > mtk_clock_event_device globally.
> > Please add the patch below, which does exactly this.
> 
> I don't think this is so hacky.
> In light of Stephen's comment about the benefit of using
> container_of() to extract gpt_base from the passed in struct
> clock_event_device in the other routines, what is the benefit of
> making more of mtk_clock_event_device global?
> I think what Yingjoe has implemented is short and sweet.
> 

Huh, this patch got somehow forgotten.
Ok, just one comment. I would prefer to rename the global gpt_base to 
gpt_sched_base or something similar and set the pointer + offset directly 
mtk_timer_init.

Thanks,
Matthias
