From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/2] clocksource: arm_arch_timer: remove static from arch_timer_init
Date: Fri, 20 Jun 2014 12:44:11 +0200
Message-ID: <3602534.r5eJA8RqrN@diego>
References: <70167479.zcs3JF0luJ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <70167479.zcs3JF0luJ@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There exist SoCs that need some special setup procedure for their architected-timer
to work. Therefore allow arch_timer_init to be called from such specialized
clocksources.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/clocksource/arm_arch_timer.c | 2 +-
 drivers/clocksource/arm_arch_timer.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clocksource/arm_arch_timer.h

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 5163ec1..55116d6 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -635,7 +635,7 @@ static void __init arch_timer_common_init(void)
 	arch_timer_arch_init();
 }
 
-static void __init arch_timer_init(struct device_node *np)
+void __init arch_timer_init(struct device_node *np)
 {
 	int i;
 
diff --git a/drivers/clocksource/arm_arch_timer.h b/drivers/clocksource/arm_arch_timer.h
new file mode 100644
index 0000000..af3974d
--- /dev/null
+++ b/drivers/clocksource/arm_arch_timer.h
@@ -0,0 +1,7 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+void __init arch_timer_init(struct device_node *np);
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
