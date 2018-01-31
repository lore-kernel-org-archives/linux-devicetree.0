From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [RFC v4 12/26] watchdog: renesas_wdt: Add R-Car Gen2 support
Date: Wed, 31 Jan 2018 18:24:16 +0000
Message-ID: <1517423070-24236-13-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1517423070-24236-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517423070-24236-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Due to commits:
* "ARM: shmobile: Add watchdog support",
* "ARM: shmobile: rcar-gen2: Add watchdog support", and
* "soc: renesas: rcar-rst: Enable watchdog as reset trigger for Gen2",
we now have everything we needed for the watchdog to work on Gen2 and
RZ/G1.

This commit adds "renesas,rcar-gen2-wdt" as compatible string for R-Car
Gen2 and RZ/G1, and since on those platforms the rwdt clock needs to be
always ON, when suspending to RAM we need to explicitly disable the
counting by clearing TME from RWTCSRA.

Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
v3->4:
* in this new version the changes to the driver have been splitted into
  two commits, this patch takes care of the basic Gen2 support, patch 13/26
  takes care of the restart handler.

 drivers/watchdog/renesas_wdt.c | 42 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 831ef83..0a1a402 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -203,13 +203,42 @@ static int rwdt_remove(struct platform_device *pdev)
 	return 0;
 }
 
-/*
- * This driver does also fit for R-Car Gen2 (r8a779[0-4]) WDT. However, for SMP
- * to work there, one also needs a RESET (RST) driver which does not exist yet
- * due to HW issues. This needs to be solved before adding compatibles here.
- */
+#ifdef CONFIG_PM
+static int rwdt_suspend(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct rwdt_priv *priv;
+
+	pdev = to_platform_device(dev);
+	priv = platform_get_drvdata(pdev);
+	if (watchdog_active(&priv->wdev)) {
+		rwdt_write(priv, priv->cks, RWTCSRA);
+	}
+	return 0;
+}
+
+static int rwdt_resume(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct rwdt_priv *priv;
+
+	pdev = to_platform_device(dev);
+	priv = platform_get_drvdata(pdev);
+	if (watchdog_active(&priv->wdev)) {
+		rwdt_write(priv, priv->cks | RWTCSRA_TME, RWTCSRA);
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops rwdt_pm = {
+	.suspend = rwdt_suspend,
+	.resume = rwdt_resume,
+};
+#endif
+
 static const struct of_device_id rwdt_ids[] = {
 	{ .compatible = "renesas,rcar-gen3-wdt", },
+	{ .compatible = "renesas,rcar-gen2-wdt", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rwdt_ids);
@@ -218,6 +247,9 @@ static struct platform_driver rwdt_driver = {
 	.driver = {
 		.name = "renesas_wdt",
 		.of_match_table = rwdt_ids,
+#ifdef CONFIG_PM
+		.pm = &rwdt_pm,
+#endif
 	},
 	.probe = rwdt_probe,
 	.remove = rwdt_remove,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
