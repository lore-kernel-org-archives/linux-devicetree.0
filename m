From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv2 06/11] clocksource/drivers/rockchip_timer: low level routines take rk_timer as parameter
Date: Mon, 28 Nov 2016 17:31:21 +0300
Message-ID: <1480343486-25539-7-git-send-email-al.kochet@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480343486-25539-1-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pass rk_timer instead of clock_event_device to low lever timer routines.
So that code could be reused by clocksource implementation.

This is refactoring step without functional changes.

Signed-off-by: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clocksource/rockchip_timer.c |   47 +++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/clocksource/rockchip_timer.c b/drivers/clocksource/rockchip_timer.c
index 6d68d4c..aa9ccd1 100644
--- a/drivers/clocksource/rockchip_timer.c
+++ b/drivers/clocksource/rockchip_timer.c
@@ -63,60 +63,67 @@ static inline void __iomem *rk_ctrl(struct clock_event_device *ce)
 	return rk_timer(ce)->ctrl;
 }
 
-static inline void rk_timer_disable(struct clock_event_device *ce)
+static inline void rk_timer_disable(struct rk_timer *timer)
 {
-	writel_relaxed(TIMER_DISABLE, rk_ctrl(ce));
+	writel_relaxed(TIMER_DISABLE, timer->ctrl);
 }
 
-static inline void rk_timer_enable(struct clock_event_device *ce, u32 flags)
+static inline void rk_timer_enable(struct rk_timer *timer, u32 flags)
 {
 	writel_relaxed(TIMER_ENABLE | TIMER_INT_UNMASK | flags,
-		       rk_ctrl(ce));
+		       timer->ctrl);
 }
 
 static void rk_timer_update_counter(unsigned long cycles,
-				    struct clock_event_device *ce)
+				    struct rk_timer *timer)
 {
-	writel_relaxed(cycles, rk_base(ce) + TIMER_LOAD_COUNT0);
-	writel_relaxed(0, rk_base(ce) + TIMER_LOAD_COUNT1);
+	writel_relaxed(cycles, timer->base + TIMER_LOAD_COUNT0);
+	writel_relaxed(0, timer->base + TIMER_LOAD_COUNT1);
 }
 
-static void rk_timer_interrupt_clear(struct clock_event_device *ce)
+static void rk_timer_interrupt_clear(struct rk_timer *timer)
 {
-	writel_relaxed(1, rk_base(ce) + TIMER_INT_STATUS);
+	writel_relaxed(1, timer->base + TIMER_INT_STATUS);
 }
 
 static inline int rk_timer_set_next_event(unsigned long cycles,
 					  struct clock_event_device *ce)
 {
-	rk_timer_disable(ce);
-	rk_timer_update_counter(cycles, ce);
-	rk_timer_enable(ce, TIMER_MODE_USER_DEFINED_COUNT);
+	struct rk_timer *timer = rk_timer(ce);
+
+	rk_timer_disable(timer);
+	rk_timer_update_counter(cycles, timer);
+	rk_timer_enable(timer, TIMER_MODE_USER_DEFINED_COUNT);
 	return 0;
 }
 
 static int rk_timer_shutdown(struct clock_event_device *ce)
 {
-	rk_timer_disable(ce);
+	struct rk_timer *timer = rk_timer(ce);
+
+	rk_timer_disable(timer);
 	return 0;
 }
 
 static int rk_timer_set_periodic(struct clock_event_device *ce)
 {
-	rk_timer_disable(ce);
-	rk_timer_update_counter(rk_timer(ce)->freq / HZ - 1, ce);
-	rk_timer_enable(ce, TIMER_MODE_FREE_RUNNING);
+	struct rk_timer *timer = rk_timer(ce);
+
+	rk_timer_disable(timer);
+	rk_timer_update_counter(timer->freq / HZ - 1, timer);
+	rk_timer_enable(timer, TIMER_MODE_FREE_RUNNING);
 	return 0;
 }
 
 static irqreturn_t rk_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *ce = dev_id;
+	struct rk_timer *timer = rk_timer(ce);
 
-	rk_timer_interrupt_clear(ce);
+	rk_timer_interrupt_clear(timer);
 
 	if (clockevent_state_oneshot(ce))
-		rk_timer_disable(ce);
+		rk_timer_disable(timer);
 
 	ce->event_handler(ce);
 
@@ -183,8 +190,8 @@ static int __init rk_timer_init(struct device_node *np, u32 ctrl_reg)
 	ce->cpumask = cpu_possible_mask;
 	ce->rating = 250;
 
-	rk_timer_interrupt_clear(ce);
-	rk_timer_disable(ce);
+	rk_timer_interrupt_clear(timer);
+	rk_timer_disable(timer);
 
 	ret = request_irq(irq, rk_timer_interrupt, IRQF_TIMER, TIMER_NAME, ce);
 	if (ret) {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
