From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH_V3 2/2] watchdog: jz4740: Add DT support
Date: Tue, 3 Feb 2015 10:25:48 +0000
Message-ID: <1422959148-38075-3-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1422959148-38075-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422959148-38075-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DT support to the jz4740 driver. Simple of_match_ptr. No other
modification for probe needed

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

---
V3 Typo in Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

V2 changes
Add module device table. Even though we are moving to non-dt for jz4740.
Lets try and not break things while at it.

Renamed jz4740_of_match to jz4740_wdt_of_match
---
 drivers/watchdog/jz4740_wdt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index 18e41af..4c2cc09 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -24,6 +24,7 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/err.h>
+#include <linux/of.h>
 
 #include <asm/mach-jz4740/timer.h>
 
@@ -142,6 +143,14 @@ static const struct watchdog_ops jz4740_wdt_ops = {
 	.set_timeout = jz4740_wdt_set_timeout,
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id jz4740_wdt_of_matches[] = {
+	{ .compatible = "ingenic,jz4740-watchdog", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jz4740_wdt_of_matches)
+#endif
+
 static int jz4740_wdt_probe(struct platform_device *pdev)
 {
 	struct jz4740_wdt_drvdata *drvdata;
@@ -211,6 +220,7 @@ static struct platform_driver jz4740_wdt_driver = {
 	.remove = jz4740_wdt_remove,
 	.driver = {
 		.name = "jz4740-wdt",
+		.of_match_table = of_match_ptr(jz4740_wdt_of_matches),
 	},
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
