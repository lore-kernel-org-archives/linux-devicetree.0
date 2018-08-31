Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] usb: renesas_usbhs: Add multiple clocks management
Date: Fri, 31 Aug 2018 15:48:39 +0900
Message-Id: <1535698119-10132-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1535698119-10132-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1535698119-10132-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 drivers/usb/renesas_usbhs/common.c | 41 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/renesas_usbhs/common.h |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 1d355d5..00d32d1 100644
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
@@ -336,11 +337,23 @@ static void usbhsc_power_ctrl(struct usbhs_priv *priv, int enable)
 {
 	struct platform_device *pdev = usbhs_priv_to_pdev(priv);
 	struct device *dev = usbhs_priv_to_dev(priv);
+	int ret;
 
 	if (enable) {
 		/* enable PM */
 		pm_runtime_get_sync(dev);
 
+		/* enable clks if exist */
+		if (priv->clks) {
+			ret = clk_bulk_prepare(priv->num_clks, priv->clks);
+			if (!ret) {
+				ret = clk_bulk_enable(priv->num_clks,
+						      priv->clks);
+				if (ret)
+					return;
+			}
+		}
+
 		/* enable platform power */
 		usbhs_platform_call(priv, power_ctrl, pdev, priv->base, enable);
 
@@ -353,6 +366,12 @@ static void usbhsc_power_ctrl(struct usbhs_priv *priv, int enable)
 		/* disable platform power */
 		usbhs_platform_call(priv, power_ctrl, pdev, priv->base, enable);
 
+		/* disable clks if exist */
+		if (priv->clks) {
+			clk_bulk_disable(priv->num_clks, priv->clks);
+			clk_bulk_unprepare(priv->num_clks, priv->clks);
+		}
+
 		/* disable PM */
 		pm_runtime_put_sync(dev);
 	}
@@ -534,6 +553,11 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 	return info;
 }
 
+static const struct clk_bulk_data usbhs_rcar3_clks[] = {
+	{ .id = "hsusb" },
+	{ .id = "ehci/ohci" },
+};
+
 static int usbhs_probe(struct platform_device *pdev)
 {
 	struct renesas_usbhs_platform_info *info = renesas_usbhs_get_info(pdev);
@@ -620,6 +644,15 @@ static int usbhs_probe(struct platform_device *pdev)
 		break;
 	}
 
+	if (priv->dparam.type == USBHS_TYPE_RCAR_GEN3 ||
+	    priv->dparam.type == USBHS_TYPE_RCAR_GEN3_WITH_PLL) {
+		priv->clks = devm_kmemdup(&pdev->dev, usbhs_rcar3_clks,
+					  sizeof(usbhs_rcar3_clks), GFP_KERNEL);
+		if (!priv->clks)
+			return -ENOMEM;
+		priv->num_clks = ARRAY_SIZE(usbhs_rcar3_clks);
+	}
+
 	/* set driver callback functions for platform */
 	dfunc			= &info->driver_callback;
 	dfunc->notify_hotplug	= usbhsc_drvcllbck_notify_hotplug;
@@ -667,6 +700,12 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (ret)
 		goto probe_fail_rst;
 
+	if (priv->clks) {
+		ret = clk_bulk_get(&pdev->dev, priv->num_clks, priv->clks);
+		if (ret == -EPROBE_DEFER)
+			goto probe_fail_clks;
+	}
+
 	/*
 	 * deviece reset here because
 	 * USB device might be used in boot loader.
@@ -720,6 +759,8 @@ static int usbhs_probe(struct platform_device *pdev)
 	return ret;
 
 probe_end_mod_exit:
+	clk_bulk_put(priv->num_clks, priv->clks);
+probe_fail_clks:
 	reset_control_assert(priv->rsts);
 probe_fail_rst:
 	usbhs_mod_remove(priv);
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index bce7d35..9105ee0 100644
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
+	struct clk_bulk_data *clks;
+	int num_clks;
 };
 
 /*
-- 
1.9.1
