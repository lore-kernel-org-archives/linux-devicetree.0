From: Roland Stigge <stigge@antcom.de>
Subject: [PATCH 1/2] rtc-imxdi: Support for i.MX53
Date: Tue, 16 Oct 2012 16:51:34 +0200
Message-ID: <1350399095-2955-1-git-send-email-stigge@antcom.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it, grant.likely@secretlab.ca, rob.herring@calxeda.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, s.hauer@pengutronix.de
Cc: Roland Stigge <stigge@antcom.de>
List-Id: devicetree@vger.kernel.org

This patch enables support for i.MX53 in addition to i.MX25

Signed-off-by: Roland Stigge <stigge@antcom.de>
---
 drivers/rtc/Kconfig     |    2 +-
 drivers/rtc/rtc-imxdi.c |   25 ++++++++++++++++---------
 2 files changed, 17 insertions(+), 10 deletions(-)

--- linux-2.6.orig/drivers/rtc/Kconfig
+++ linux-2.6/drivers/rtc/Kconfig
@@ -768,7 +768,7 @@ config RTC_DRV_DAVINCI
 
 config RTC_DRV_IMXDI
 	tristate "Freescale IMX DryIce Real Time Clock"
-	depends on SOC_IMX25
+	depends on SOC_IMX25 || SOC_IMX53
 	help
 	   Support for Freescale IMX DryIce RTC
 
--- linux-2.6.orig/drivers/rtc/rtc-imxdi.c
+++ linux-2.6/drivers/rtc/rtc-imxdi.c
@@ -37,6 +37,7 @@
 #include <linux/rtc.h>
 #include <linux/sched.h>
 #include <linux/workqueue.h>
+#include <mach/hardware.h>
 
 /* DryIce Register Definitions */
 
@@ -402,11 +403,13 @@ static int dryice_rtc_probe(struct platf
 
 	mutex_init(&imxdi->write_mutex);
 
-	imxdi->clk = clk_get(&pdev->dev, NULL);
-	if (IS_ERR(imxdi->clk))
-		return PTR_ERR(imxdi->clk);
-	clk_prepare_enable(imxdi->clk);
-
+	/* For IMX53, RTC is available always */
+	if (cpu_is_mx25()) {
+		imxdi->clk = clk_get(&pdev->dev, NULL);
+		if (IS_ERR(imxdi->clk))
+			return PTR_ERR(imxdi->clk);
+		clk_prepare_enable(imxdi->clk);
+	}
 	/*
 	 * Initialize dryice hardware
 	 */
@@ -470,8 +473,10 @@ static int dryice_rtc_probe(struct platf
 	return 0;
 
 err:
-	clk_disable_unprepare(imxdi->clk);
-	clk_put(imxdi->clk);
+	if (cpu_is_mx25()) {
+		clk_disable_unprepare(imxdi->clk);
+		clk_put(imxdi->clk);
+	}
 
 	return rc;
 }
@@ -487,8 +492,10 @@ static int __devexit dryice_rtc_remove(s
 
 	rtc_device_unregister(imxdi->rtc);
 
-	clk_disable_unprepare(imxdi->clk);
-	clk_put(imxdi->clk);
+	if (cpu_is_mx25()) {
+		clk_disable_unprepare(imxdi->clk);
+		clk_put(imxdi->clk);
+	}
 
 	return 0;
 }
