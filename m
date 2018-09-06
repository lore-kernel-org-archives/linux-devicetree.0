Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 3/3] usb: renesas_usbhs: Add multiple clocks management
Date: Thu,  6 Sep 2018 14:50:14 +0900
Message-Id: <1536213014-1325-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1536213014-1325-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1536213014-1325-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

R-Car Gen3 needs to enable clocks of both host and peripheral.
Since [eo]hci-platform disables the reset(s) when the drivers are
removed, renesas_usbhs driver doesn't work correctly. To fix this
issue, this patch adds multiple clocks management on this
renesas_usbhs driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 25 +++++++++++++++++++++++++
 drivers/usb/renesas_usbhs/common.h |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 1d355d5..d1e37cc 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2011 Renesas Solutions Corp.
  * Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  */
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/gpio.h>
 #include <linux/io.h>
@@ -341,6 +342,11 @@ static void usbhsc_power_ctrl(struct usbhs_priv *priv, int enable)
 		/* enable PM */
 		pm_runtime_get_sync(dev);
 
+		/* enable clks if exist */
+		if (priv->num_clks &&
+		    clk_bulk_prepare_enable(priv->num_clks, priv->clks))
+			return;
+
 		/* enable platform power */
 		usbhs_platform_call(priv, power_ctrl, pdev, priv->base, enable);
 
@@ -353,6 +359,10 @@ static void usbhsc_power_ctrl(struct usbhs_priv *priv, int enable)
 		/* disable platform power */
 		usbhs_platform_call(priv, power_ctrl, pdev, priv->base, enable);
 
+		/* disable clks if exist */
+		if (priv->num_clks)
+			clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
+
 		/* disable PM */
 		pm_runtime_put_sync(dev);
 	}
@@ -620,6 +630,13 @@ static int usbhs_probe(struct platform_device *pdev)
 		break;
 	}
 
+	if (priv->dparam.type == USBHS_TYPE_RCAR_GEN3 ||
+	    priv->dparam.type == USBHS_TYPE_RCAR_GEN3_WITH_PLL) {
+		priv->clks[0].id = "hsusb";
+		priv->clks[1].id = "ehci/ohci";
+		priv->num_clks = ARRAY_SIZE(priv->clks);
+	};
+
 	/* set driver callback functions for platform */
 	dfunc			= &info->driver_callback;
 	dfunc->notify_hotplug	= usbhsc_drvcllbck_notify_hotplug;
@@ -667,6 +684,12 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (ret)
 		goto probe_fail_rst;
 
+	if (priv->num_clks) {
+		ret = clk_bulk_get(&pdev->dev, priv->num_clks, priv->clks);
+		if (ret == -EPROBE_DEFER)
+			goto probe_fail_clks;
+	}
+
 	/*
 	 * deviece reset here because
 	 * USB device might be used in boot loader.
@@ -720,6 +743,8 @@ static int usbhs_probe(struct platform_device *pdev)
 	return ret;
 
 probe_end_mod_exit:
+	clk_bulk_put(priv->num_clks, priv->clks);
+probe_fail_clks:
 	reset_control_assert(priv->rsts);
 probe_fail_rst:
 	usbhs_mod_remove(priv);
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index bce7d35..6e7c5f2 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -8,6 +8,7 @@
 #ifndef RENESAS_USB_DRIVER_H
 #define RENESAS_USB_DRIVER_H
 
+#include <linux/clk.h>
 #include <linux/extcon.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
@@ -279,6 +280,8 @@ struct usbhs_priv {
 
 	struct phy *phy;
 	struct reset_control *rsts;
+	struct clk_bulk_data clks[2];
+	int num_clks;
 };
 
 /*
-- 
1.9.1
