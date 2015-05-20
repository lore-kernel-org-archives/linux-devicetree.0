From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/9] clocksource: mediatek: Use GPT as sched clock source
Date: Wed, 20 May 2015 13:02:21 +0200
Message-ID: <CABuKBeJhdRBBw1v1kj8J0YFVWZ27vzx5W=XU8jiwePVgL_7g_g@mail.gmail.com>
References: <1431763110-443-1-git-send-email-yingjoe.chen@mediatek.com>
	<1431763110-443-5-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431763110-443-5-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-05-16 9:58 GMT+02:00 Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> When cpu is in deep idle, arch timer will stop counting. Setup GPT as
> sched clock source so it can keep counting in idle.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/clocksource/mtk_timer.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
> index 91206f9..fe7cf72 100644
> --- a/drivers/clocksource/mtk_timer.c
> +++ b/drivers/clocksource/mtk_timer.c
> @@ -24,6 +24,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
> +#include <linux/sched_clock.h>
>  #include <linux/slab.h>
>
>  #define GPT_IRQ_EN_REG         0x00
> @@ -59,6 +60,13 @@ struct mtk_clock_event_device {
>         struct clock_event_device dev;
>  };
>
> +static void __iomem *gpt_base __read_mostly;
> +
> +static u64 notrace mtk_read_sched_clock(void)
> +{
> +       return readl_relaxed(gpt_base + TIMER_CNT_REG(GPT_CLK_SRC));
> +}
> +
>  static inline struct mtk_clock_event_device *to_mtk_clk(
>                                 struct clock_event_device *c)
>  {
> @@ -243,6 +251,8 @@ static void __init mtk_timer_init(struct device_node *node)
>         mtk_timer_setup(evt, GPT_CLK_SRC, TIMER_CTRL_OP_FREERUN, 1);
>         clocksource_mmio_init(evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC),
>                         node->name, rate, 300, 32, clocksource_mmio_readl_up);
> +       gpt_base = evt->gpt_base;

This is really hacky. We should clean up the code and provide
mtk_clock_event_device globally.
Please add the patch below, which does exactly this.
---- 8< ---------------- >8 ------
>From 631e7bf4e5d9456d0bb4a29b2dee4b84e8c052bd Mon Sep 17 00:00:00 2001
From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Wed, 20 May 2015 12:43:16 +0200
Subject: [PATCH] clocksource: mediatek: Define mtk_clock_event_device globally

Sched clock code, especially sched_clock_register does not allow to pass a
pointer to actual_read_sched_clock. So if in the driver the register base
address is not globally defined, we are not able to read the scheduler
clock register. This patch sets the mtk_clock_event_device struct globally
for the driver, to be able to read the register.

Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clocksource/mtk_timer.c | 50 +++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
index 68ab423..c5f5b40 100644
--- a/drivers/clocksource/mtk_timer.c
+++ b/drivers/clocksource/mtk_timer.c
@@ -59,13 +59,9 @@ struct mtk_clock_event_device {
     struct clock_event_device dev;
 };

-static inline struct mtk_clock_event_device *to_mtk_clk(
-                struct clock_event_device *c)
-{
-    return container_of(c, struct mtk_clock_event_device, dev);
-}
+struct mtk_clock_event_device *evt;

-static void mtk_clkevt_time_stop(struct mtk_clock_event_device *evt, u8 timer)
+static void mtk_clkevt_time_stop(u8 timer)
 {
     u32 val;

@@ -74,14 +70,12 @@ static void mtk_clkevt_time_stop(struct
mtk_clock_event_device *evt, u8 timer)
             TIMER_CTRL_REG(timer));
 }

-static void mtk_clkevt_time_setup(struct mtk_clock_event_device *evt,
-                unsigned long delay, u8 timer)
+static void mtk_clkevt_time_setup(unsigned long delay, u8 timer)
 {
     writel(delay, evt->gpt_base + TIMER_CMP_REG(timer));
 }

-static void mtk_clkevt_time_start(struct mtk_clock_event_device *evt,
-        bool periodic, u8 timer)
+static void mtk_clkevt_time_start(bool periodic, u8 timer)
 {
     u32 val;

@@ -105,14 +99,12 @@ static void mtk_clkevt_time_start(struct
mtk_clock_event_device *evt,
 static void mtk_clkevt_mode(enum clock_event_mode mode,
                 struct clock_event_device *clk)
 {
-    struct mtk_clock_event_device *evt = to_mtk_clk(clk);
-
-    mtk_clkevt_time_stop(evt, GPT_CLK_EVT);
+    mtk_clkevt_time_stop(GPT_CLK_EVT);

     switch (mode) {
     case CLOCK_EVT_MODE_PERIODIC:
-        mtk_clkevt_time_setup(evt, evt->ticks_per_jiffy, GPT_CLK_EVT);
-        mtk_clkevt_time_start(evt, true, GPT_CLK_EVT);
+        mtk_clkevt_time_setup(evt->ticks_per_jiffy, GPT_CLK_EVT);
+        mtk_clkevt_time_start(true, GPT_CLK_EVT);
         break;
     case CLOCK_EVT_MODE_ONESHOT:
         /* Timer is enabled in set_next_event */
@@ -128,19 +120,15 @@ static void mtk_clkevt_mode(enum clock_event_mode mode,
 static int mtk_clkevt_next_event(unsigned long event,
                    struct clock_event_device *clk)
 {
-    struct mtk_clock_event_device *evt = to_mtk_clk(clk);
-
-    mtk_clkevt_time_stop(evt, GPT_CLK_EVT);
-    mtk_clkevt_time_setup(evt, event, GPT_CLK_EVT);
-    mtk_clkevt_time_start(evt, false, GPT_CLK_EVT);
+    mtk_clkevt_time_stop(GPT_CLK_EVT);
+    mtk_clkevt_time_setup(event, GPT_CLK_EVT);
+    mtk_clkevt_time_start(false, GPT_CLK_EVT);

     return 0;
 }

 static irqreturn_t mtk_timer_interrupt(int irq, void *dev_id)
 {
-    struct mtk_clock_event_device *evt = dev_id;
-
     /* Acknowledge timer0 irq */
     writel(GPT_IRQ_ACK(GPT_CLK_EVT), evt->gpt_base + GPT_IRQ_ACK_REG);
     evt->dev.event_handler(&evt->dev);
@@ -148,7 +136,7 @@ static irqreturn_t mtk_timer_interrupt(int irq,
void *dev_id)
     return IRQ_HANDLED;
 }

-static void mtk_timer_global_reset(struct mtk_clock_event_device *evt)
+static inline void mtk_timer_global_reset(void)
 {
     /* Disable all interrupts */
     writel(0x0, evt->gpt_base + GPT_IRQ_EN_REG);
@@ -156,8 +144,7 @@ static void mtk_timer_global_reset(struct
mtk_clock_event_device *evt)
     writel(0x3f, evt->gpt_base + GPT_IRQ_ACK_REG);
 }

-static void
-mtk_timer_setup(struct mtk_clock_event_device *evt, u8 timer, u8 option)
+static void mtk_timer_setup(u8 timer, u8 option)
 {
     writel(TIMER_CTRL_CLEAR | TIMER_CTRL_DISABLE,
         evt->gpt_base + TIMER_CTRL_REG(timer));
@@ -171,7 +158,7 @@ mtk_timer_setup(struct mtk_clock_event_device
*evt, u8 timer, u8 option)
             evt->gpt_base + TIMER_CTRL_REG(timer));
 }

-static void mtk_timer_enable_irq(struct mtk_clock_event_device *evt, u8 timer)
+static void mtk_timer_enable_irq(u8 timer)
 {
     u32 val;

@@ -182,7 +169,6 @@ static void mtk_timer_enable_irq(struct
mtk_clock_event_device *evt, u8 timer)

 static void __init mtk_timer_init(struct device_node *node)
 {
-    struct mtk_clock_event_device *evt;
     struct resource res;
     unsigned long rate = 0;
     struct clk *clk;
@@ -224,10 +210,10 @@ static void __init mtk_timer_init(struct
device_node *node)
     }
     rate = clk_get_rate(clk);

-    mtk_timer_global_reset(evt);
+    mtk_timer_global_reset();

     if (request_irq(evt->dev.irq, mtk_timer_interrupt,
-            IRQF_TIMER | IRQF_IRQPOLL, "mtk_timer", evt)) {
+            IRQF_TIMER | IRQF_IRQPOLL, "mtk_timer", NULL)) {
         pr_warn("failed to setup irq %d\n", evt->dev.irq);
         goto err_clk_disable;
     }
@@ -235,16 +221,16 @@ static void __init mtk_timer_init(struct
device_node *node)
     evt->ticks_per_jiffy = DIV_ROUND_UP(rate, HZ);

     /* Configure clock source */
-    mtk_timer_setup(evt, GPT_CLK_SRC, TIMER_CTRL_OP_FREERUN);
+    mtk_timer_setup(GPT_CLK_SRC, TIMER_CTRL_OP_FREERUN);
     clocksource_mmio_init(evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC),
             node->name, rate, 300, 32, clocksource_mmio_readl_up);

     /* Configure clock event */
-    mtk_timer_setup(evt, GPT_CLK_EVT, TIMER_CTRL_OP_REPEAT);
+    mtk_timer_setup(GPT_CLK_EVT, TIMER_CTRL_OP_REPEAT);
     clockevents_config_and_register(&evt->dev, rate, 0x3,
                     0xffffffff);

-    mtk_timer_enable_irq(evt, GPT_CLK_EVT);
+    mtk_timer_enable_irq(GPT_CLK_EVT);

     return;

-- 
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
