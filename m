From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/7] clocksource: mips-gic: Split clocksource and clockevent initialization
Date: Thu, 21 May 2015 18:37:36 -0300
Message-ID: <1432244260-14908-4-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432244260-14908-1-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is preparation work for the introduction of clockevent frequency
update with a clock notifier. This is only possible when the device
is passed a clk struct, so let's split the legacy and devicetree
initialization.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 drivers/clocksource/mips-gic-timer.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index c4352f0..22a4daf 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -142,11 +142,6 @@ static void __init __gic_clocksource_init(void)
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
 	if (ret < 0)
 		pr_warn("GIC: Unable to register clocksource\n");
-
-	gic_clockevent_init();
-
-	/* And finally start the counter */
-	gic_start_count();
 }
 
 void __init gic_clocksource_init(unsigned int frequency)
@@ -156,6 +151,10 @@ void __init gic_clocksource_init(unsigned int frequency)
 		GIC_LOCAL_TO_HWIRQ(GIC_LOCAL_INT_COMPARE);
 
 	__gic_clocksource_init();
+	gic_clockevent_init();
+
+	/* And finally start the counter */
+	gic_start_count();
 }
 
 static void __init gic_clocksource_of_init(struct device_node *node)
@@ -187,6 +186,10 @@ static void __init gic_clocksource_of_init(struct device_node *node)
 	}
 
 	__gic_clocksource_init();
+	gic_clockevent_init();
+
+	/* And finally start the counter */
+	gic_start_count();
 }
 CLOCKSOURCE_OF_DECLARE(mips_gic_timer, "mti,gic-timer",
 		       gic_clocksource_of_init);
-- 
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
