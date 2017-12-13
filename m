From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/3] clocksource/drivers: timer-of: parse the chosen node
Date: Wed, 13 Dec 2017 19:53:12 +0100
Message-ID: <20171213185313.20017-3-alexandre.belloni@free-electrons.com>
References: <20171213185313.20017-1-alexandre.belloni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171213185313.20017-1-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a way for drivers to know whether the timer they are currently handling
is a clocksource or a clockevent.

Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/clocksource/timer-of.c | 22 ++++++++++++++++++++++
 drivers/clocksource/timer-of.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index a31990408153..71680eacd390 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -195,3 +195,25 @@ void __init timer_of_cleanup(struct timer_of *to)
 	if (to->flags & TIMER_OF_BASE)
 		timer_base_exit(&to->of_base);
 }
+
+int __init timer_of_is_type(struct device_node *np, char *type)
+{
+	struct device_node *node, *timer;
+
+	if (!of_chosen)
+		return 0;
+
+	node = of_get_child_by_name(of_chosen, type);
+	if (!node)
+		return 0;
+
+	timer = of_parse_phandle(node, "timer", 0);
+	of_node_put(node);
+	if (!timer)
+		return 0;
+
+	if (timer == np)
+		return 1;
+
+	return 0;
+}
diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index 3f708f1be43d..24923cfe748d 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -70,4 +70,7 @@ extern int __init timer_of_init(struct device_node *np,
 
 extern void __init timer_of_cleanup(struct timer_of *to);
 
+extern int __init timer_of_is_type(struct device_node *np, char *type);
+#define timer_of_is_clocksource(np) timer_of_is_type(np, "linux,clocksource")
+#define timer_of_is_clockevent(np) timer_of_is_type(np, "linux,clockevent")
 #endif
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
