From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v7 3/6] clocksource: stm32: increase min delta value
Date: Mon, 23 Oct 2017 11:58:39 +0200
Message-ID: <1508752722-4489-4-git-send-email-benjamin.gaignard@linaro.org>
References: <1508752722-4489-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508752722-4489-1-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, julien.thierry-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The CPU is a CortexM4 @ 200MHZ and the clocks driving
the timers are at 90MHZ with a min delta at 1 you could
have an interrupt each 0.01 ms which is really to much.
By increase it to 0x60 it give more time (around 1 ms)
to CPU to handle the interrupt.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clocksource/timer-stm32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/timer-stm32.c
index fc61fd1..dc9fee6 100644
--- a/drivers/clocksource/timer-stm32.c
+++ b/drivers/clocksource/timer-stm32.c
@@ -36,6 +36,8 @@
 
 #define TIM_EGR_UG	BIT(0)
 
+#define MIN_DELTA	0x60
+
 static int stm32_clock_event_shutdown(struct clock_event_device *evt)
 {
 	struct timer_of *to = to_timer_of(evt);
@@ -129,7 +131,8 @@ static int __init stm32_clockevent_init(struct device_node *node)
 	writel_relaxed(0, timer_of_base(to) + TIM_SR);
 
 	clockevents_config_and_register(&to->clkevt,
-					timer_of_period(to), 0x1, max_delta);
+					timer_of_period(to),
+					MIN_DELTA, max_delta);
 
 	pr_info("%pOF: STM32 clockevent driver initialized (%d bits)\n",
 			node, bits);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
