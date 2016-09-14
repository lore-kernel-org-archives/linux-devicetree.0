From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 11/19] watchdog: st_wdt: Remove support for obsolete platforms
Date: Wed, 14 Sep 2016 14:27:49 +0100
Message-ID: <1473859677-9231-12-git-send-email-peter.griffin@linaro.org>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473859677-9231-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

STiH415/6 SoC support is being removed from the kernel.
This patch updates the watchdog driver to remove references
to these obsolete platforms.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
---
 drivers/watchdog/st_lpc_wdt.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
index 14e9bad..e6100e4 100644
--- a/drivers/watchdog/st_lpc_wdt.c
+++ b/drivers/watchdog/st_lpc_wdt.c
@@ -52,27 +52,6 @@ struct st_wdog {
 	bool warm_reset;
 };
 
-static struct st_wdog_syscfg stid127_syscfg = {
-	.reset_type_reg		= 0x004,
-	.reset_type_mask	= BIT(2),
-	.enable_reg		= 0x000,
-	.enable_mask		= BIT(2),
-};
-
-static struct st_wdog_syscfg stih415_syscfg = {
-	.reset_type_reg		= 0x0B8,
-	.reset_type_mask	= BIT(6),
-	.enable_reg		= 0x0B4,
-	.enable_mask		= BIT(7),
-};
-
-static struct st_wdog_syscfg stih416_syscfg = {
-	.reset_type_reg		= 0x88C,
-	.reset_type_mask	= BIT(6),
-	.enable_reg		= 0x888,
-	.enable_mask		= BIT(7),
-};
-
 static struct st_wdog_syscfg stih407_syscfg = {
 	.enable_reg		= 0x204,
 	.enable_mask		= BIT(19),
@@ -83,18 +62,6 @@ static const struct of_device_id st_wdog_match[] = {
 		.compatible = "st,stih407-lpc",
 		.data = &stih407_syscfg,
 	},
-	{
-		.compatible = "st,stih416-lpc",
-		.data = &stih416_syscfg,
-	},
-	{
-		.compatible = "st,stih415-lpc",
-		.data = &stih415_syscfg,
-	},
-	{
-		.compatible = "st,stid127-lpc",
-		.data = &stid127_syscfg,
-	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, st_wdog_match);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
