From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 4/9] clocksource: mediatek: Use GPT as sched clock
 source
Date: Wed, 20 May 2015 11:37:03 -0700
Message-ID: <20150520183703.GS31753@codeaurora.org>
References: <1431763110-443-1-git-send-email-yingjoe.chen@mediatek.com>
 <1431763110-443-5-git-send-email-yingjoe.chen@mediatek.com>
 <CABuKBeJhdRBBw1v1kj8J0YFVWZ27vzx5W=XU8jiwePVgL_7g_g@mail.gmail.com>
 <1432130725.20394.24.camel@mtksdaap41>
 <CABuKBe+OP6zMHdhkm1U5sB4NqiKvEH1kVGZbHbx5f1AypcERAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABuKBe+OP6zMHdhkm1U5sB4NqiKvEH1kVGZbHbx5f1AypcERAw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/20, Matthias Brugger wrote:
> 2015-05-20 16:05 GMT+02:00 Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> > On Wed, 2015-05-20 at 13:02 +0200, Matthias Brugger wrote:
> >> 2015-05-16 9:58 GMT+02:00 Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> >> > When cpu is in deep idle, arch timer will stop counting. Setup GPT as
> >> > sched clock source so it can keep counting in idle.
> >> >
> >> > Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >> > ---
> >> >  drivers/clocksource/mtk_timer.c | 10 ++++++++++
> >> >  1 file changed, 10 insertions(+)
> >> >
> >> > diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
> >> > index 91206f9..fe7cf72 100644
> >> > --- a/drivers/clocksource/mtk_timer.c
> >> > +++ b/drivers/clocksource/mtk_timer.c
> >> > @@ -24,6 +24,7 @@
> >> >  #include <linux/of.h>
> >> >  #include <linux/of_address.h>
> >> >  #include <linux/of_irq.h>
> >> > +#include <linux/sched_clock.h>
> >> >  #include <linux/slab.h>
> >> >
> >> >  #define GPT_IRQ_EN_REG         0x00
> >> > @@ -59,6 +60,13 @@ struct mtk_clock_event_device {
> >> >         struct clock_event_device dev;
> >> >  };
> >> >
> >> > +static void __iomem *gpt_base __read_mostly;
> >> > +
> >> > +static u64 notrace mtk_read_sched_clock(void)
> >> > +{
> >> > +       return readl_relaxed(gpt_base + TIMER_CNT_REG(GPT_CLK_SRC));
> >> > +}
> >> > +
> >> >  static inline struct mtk_clock_event_device *to_mtk_clk(
> >> >                                 struct clock_event_device *c)
> >> >  {
> >> > @@ -243,6 +251,8 @@ static void __init mtk_timer_init(struct device_node *node)
> >> >         mtk_timer_setup(evt, GPT_CLK_SRC, TIMER_CTRL_OP_FREERUN, 1);
> >> >         clocksource_mmio_init(evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC),
> >> >                         node->name, rate, 300, 32, clocksource_mmio_readl_up);
> >> > +       gpt_base = evt->gpt_base;
> >>
> >> This is really hacky. We should clean up the code and provide
> >> mtk_clock_event_device globally.
> >> Please add the patch below, which does exactly this.
> >> ---- 8< ---------------- >8 ------
> >> From 631e7bf4e5d9456d0bb4a29b2dee4b84e8c052bd Mon Sep 17 00:00:00 2001
> >> From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Date: Wed, 20 May 2015 12:43:16 +0200
> >> Subject: [PATCH] clocksource: mediatek: Define mtk_clock_event_device globally
> >>
> >> Sched clock code, especially sched_clock_register does not allow to pass a
> >> pointer to actual_read_sched_clock. So if in the driver the register base
> >> address is not globally defined, we are not able to read the scheduler
> >> clock register. This patch sets the mtk_clock_event_device struct globally
> >> for the driver, to be able to read the register.
> >
> > Hi,
> >
> > I'm not sure using a global device pointer is any better.
> 
> Why not?
> 
> >
> > Actually, almost every user of sched_clock_register need to keep a
> > global register base address. Does it make sense to fix this in
> > sched_clock_register?
> >
> 
> Not sure about that. Normally you have just one timer in your system,
> so you don't get any problems to declare driver private structs
> globally on a per driver basis.
> Looking on other drivers I have seen a bit of everything, no struct at
> all, a global pointer to the driver private struct, only iomem
> pointers global and the rest of the driver private struct as is.
> It seems that there is no uniform way so up to you. Just please don't
> use two times the exactly same iomem pointer, one in the driver
> private struct and one for the scheduler clock. :)
> 

Typically the point of doing the container_of design on the
clockevent is to keep cache locality of all the data. This way,
when the clockevent is programmed it's cheap pointer math on a
pointer that's hot in the cache instead of a global pointer
dereference and likely cache miss to find the data necessary.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
