From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v7 4/6] clocksource: stm32: only use 32 bits timers
Date: Mon, 23 Oct 2017 11:58:40 +0200
Message-ID: <1508752722-4489-5-git-send-email-benjamin.gaignard@linaro.org>
References: <1508752722-4489-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508752722-4489-1-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, julien.thierry-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The clock driving counters is at 90MHz so resolution is 11 ns and wrap
depends of the number of bits of the counter.
For 32 bits counters the wrap time is around 21 seconds while for 16
bits it is around 0.3 ms which is really to short to be used.

If a 16 bits counter become used it could block boot sequence or
later make hang calls to bash functions like sleep.

This patch remove 16 bits counters support and makes sure that
they won't be probed anymore.

The boot log of 32, 16 bits counters and arm system timer (24 bits)
that give more details about wraps, resolution and idle time.
sched_clock: 32 bits at 90MHz, resolution 11ns, wraps every 23860929530ns
clocksource: stm32_timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 21236227187 ns

sched_clock: 16 bits at 90MHz, resolution 11ns, wraps every 364083ns
clocksource: stm32_timer: mask: 0xffff max_cycles: 0xffff, max_idle_ns: 324034 ns

clocksource: arm_system_timer: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 331816030 ns

Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clocksource/timer-stm32.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
index dc9fee6..d8e5636 100644
--- a/drivers/clocksource/timer-stm32.c
+++ b/drivers/clocksource/timer-stm32.c
@@ -83,9 +83,9 @@ static irqreturn_t stm32_clock_event_handler(int irq, void *dev_id)
 static int __init stm32_clockevent_init(struct device_node *node)
 {
 	struct reset_control *rstc;
-	unsigned long max_delta;
-	int ret, bits, prescaler = 1;
+	unsigned long max_arr;
 	struct timer_of *to;
+	int ret;
 
 	to = kzalloc(sizeof(*to), GFP_KERNEL);
 	if (!to)
@@ -115,30 +115,29 @@ static int __init stm32_clockevent_init(struct device_node *node)
 
 	/* Detect whether the timer is 16 or 32 bits */
 	writel_relaxed(~0U, timer_of_base(to) + TIM_ARR);
-	max_delta = readl_relaxed(timer_of_base(to) + TIM_ARR);
-	if (max_delta == ~0U) {
-		prescaler = 1;
-		bits = 32;
-	} else {
-		prescaler = 1024;
-		bits = 16;
+	max_arr = readl_relaxed(timer_of_base(to) + TIM_ARR);
+	if (max_arr != ~0U) {
+		pr_err("32 bits timer is needed\n");
+		ret = -EINVAL;
+		goto deinit;
 	}
+
 	writel_relaxed(0, timer_of_base(to) + TIM_ARR);
 
-	writel_relaxed(prescaler - 1, timer_of_base(to) + TIM_PSC);
+	writel_relaxed(0, timer_of_base(to) + TIM_PSC);
 	writel_relaxed(TIM_EGR_UG, timer_of_base(to) + TIM_EGR);
 	writel_relaxed(TIM_DIER_UIE, timer_of_base(to) + TIM_DIER);
 	writel_relaxed(0, timer_of_base(to) + TIM_SR);
 
 	clockevents_config_and_register(&to->clkevt,
 					timer_of_period(to),
-					MIN_DELTA, max_delta);
-
-	pr_info("%pOF: STM32 clockevent driver initialized (%d bits)\n",
-			node, bits);
+					MIN_DELTA, ~0U);
 
 	return 0;
 
+deinit:
+	timer_of_exit(to);
+
 err:
 	kfree(to);
 	return ret;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
