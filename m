From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v8 1/6] clocksource: timer_of: rename timer_of_exit to timer_of_cleanup
Date: Tue, 14 Nov 2017 09:52:38 +0100
Message-ID: <1510649563-22975-2-git-send-email-benjamin.gaignard@linaro.org>
References: <1510649563-22975-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510649563-22975-1-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, julien.thierry-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Change function name to something more explicit since it is only
used in init error cases.
Add __init annotation and description about the function usage.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clocksource/timer-of.c | 9 ++++++++-
 drivers/clocksource/timer-of.h | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index 7c64a5c1..a319904 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -177,7 +177,14 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
 	return ret;
 }
 
-void timer_of_exit(struct timer_of *to)
+/**
+ * timer_of_cleanup - release timer_of ressources
+ * @to: timer_of structure
+ *
+ * Release the ressources that has been used in timer_of_init().
+ * This function should be called in init error cases
+ */
+void __init timer_of_cleanup(struct timer_of *to)
 {
 	if (to->flags & TIMER_OF_IRQ)
 		timer_irq_exit(&to->of_irq);
diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index 44f57e0..f521477 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -67,6 +67,6 @@ static inline unsigned long timer_of_period(struct timer_of *to)
 extern int __init timer_of_init(struct device_node *np,
 				struct timer_of *to);
 
-extern void timer_of_exit(struct timer_of *to);
+extern void __init timer_of_cleanup(struct timer_of *to);
 
 #endif
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
