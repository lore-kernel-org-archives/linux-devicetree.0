From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 2/3] watchdog: dw_wdt: get reset lines from dt
Date: Thu, 18 May 2017 10:42:37 +0200
Message-ID: <8b116c77d30013b067676fb2f61744840ef51c32.1495096910.git-series.s.trumtrar@pengutronix.de>
References: <cover.9d687e41ad8d91c267143a43d703f656f7d5689c.1495096910.git-series.s.trumtrar@pengutronix.de>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.9d687e41ad8d91c267143a43d703f656f7d5689c.1495096910.git-series.s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
In-Reply-To: <cover.9d687e41ad8d91c267143a43d703f656f7d5689c.1495096910.git-series.s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
References: <cover.9d687e41ad8d91c267143a43d703f656f7d5689c.1495096910.git-series.s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The dw_wdt has an external reset line, that can keep the device in reset
and therefore rendering it useless and also is the only way of stopping
the watchdog once it was started.

Get the reset lines for this core from the devicetree. As these lines are
optional, use devm_reset_control_get_optional_shared. If the reset line
is not specified in the devicetree, the reset framework will just skip
deasserting and continue.
This way all users of the driver will continue to function without
any harm, even if the reset line is not specified in the devicetree.

Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/watchdog/dw_wdt.c |  9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 914da3a4d334..61cbae3a9331 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/watchdog.h>
 
 #define WDOG_CONTROL_REG_OFFSET		    0x00
@@ -54,6 +55,7 @@ struct dw_wdt {
 	struct clk		*clk;
 	unsigned long		rate;
 	struct watchdog_device	wdd;
+	struct reset_control	*rst;
 };
 
 #define to_dw_wdt(wdd)	container_of(wdd, struct dw_wdt, wdd)
@@ -234,6 +236,12 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 		goto out_disable_clk;
 	}
 
+	dw_wdt->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	if (IS_ERR(dw_wdt->rst))
+		return PTR_ERR(dw_wdt->rst);
+
+	reset_control_deassert(dw_wdt->rst);
+
 	wdd = &dw_wdt->wdd;
 	wdd->info = &dw_wdt_ident;
 	wdd->ops = &dw_wdt_ops;
@@ -278,6 +286,7 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
 {
 	struct dw_wdt *dw_wdt = platform_get_drvdata(pdev);
 
+	reset_control_assert(dw_wdt->rst);
 	watchdog_unregister_device(&dw_wdt->wdd);
 	clk_disable_unprepare(dw_wdt->clk);
 
-- 
git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
