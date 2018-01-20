From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v6 39/41] ARM: davinci: add device tree support to timer
Date: Sat, 20 Jan 2018 11:14:18 -0600
Message-ID: <1516468460-4908-40-git-send-email-david@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516468460-4908-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds device tree support to the davinci timer so that when clocks
are moved to device tree, the timer will still work.

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---

v6 changes:
- none

 arch/arm/mach-davinci/Kconfig |  1 +
 arch/arm/mach-davinci/time.c  | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfig
index ba9912b..da8a039 100644
--- a/arch/arm/mach-davinci/Kconfig
+++ b/arch/arm/mach-davinci/Kconfig
@@ -59,6 +59,7 @@ config MACH_DA8XX_DT
 	default y
 	depends on ARCH_DAVINCI_DA850
 	select PINCTRL
+	select TIMER_OF
 	help
 	  Say y here to include support for TI DaVinci DA850 based using
 	  Flattened Device Tree. More information at Documentation/devicetree
diff --git a/arch/arm/mach-davinci/time.c b/arch/arm/mach-davinci/time.c
index bd0c80e..44470e9 100644
--- a/arch/arm/mach-davinci/time.c
+++ b/arch/arm/mach-davinci/time.c
@@ -333,9 +333,9 @@ static struct clock_event_device clockevent_davinci = {
 };
 
 
-void __init davinci_timer_init(void)
+static int __init of_davinci_timer_init(struct device_node *node)
 {
-	struct clk *timer_clk;
+	struct clk *timer_clk = NULL;
 	struct davinci_soc_info *soc_info = &davinci_soc_info;
 	unsigned int clockevent_id;
 	unsigned int clocksource_id;
@@ -371,7 +371,10 @@ void __init davinci_timer_init(void)
 		}
 	}
 
-	timer_clk = clk_get(NULL, "timer0");
+	if (node)
+		timer_clk = of_clk_get(node, 0);
+	if (IS_ERR_OR_NULL(timer_clk))
+		timer_clk = clk_get(NULL, "timer0");
 	BUG_ON(IS_ERR(timer_clk));
 	clk_prepare_enable(timer_clk);
 
@@ -399,4 +402,12 @@ void __init davinci_timer_init(void)
 
 	for (i=0; i< ARRAY_SIZE(timers); i++)
 		timer32_config(&timers[i]);
+
+	return 0;
+}
+TIMER_OF_DECLARE(davinci_timer, "ti,davinci-timer", of_davinci_timer_init);
+
+void __init davinci_timer_init(void)
+{
+	of_davinci_timer_init(NULL);
 }
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
