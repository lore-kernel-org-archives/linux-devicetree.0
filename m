Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 3/3] usb: renesas_usbhs: Add multiple clocks management
Date: Mon, 10 Sep 2018 18:52:20 +0900
Message-Id: <1536573140-24123-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1536573140-24123-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1536573140-24123-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 drivers/usb/renesas_usbhs/common.c | 88 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/renesas_usbhs/common.h |  2 +
 2 files changed, 90 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 1d355d5..d6c39ba 100644
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
@@ -291,6 +292,79 @@ static void usbhsc_set_buswait(struct usbhs_priv *priv)
 		usbhs_bset(priv, BUSWAIT, 0x000F, wait);
 }
 
+static bool usbhsc_is_multi_clks(struct usbhs_priv *priv)
+{
+	if (priv->dparam.type == USBHS_TYPE_RCAR_GEN3 ||
+	    priv->dparam.type == USBHS_TYPE_RCAR_GEN3_WITH_PLL)
+		return true;
+
+	return false;
+}
+
+static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
+{
+	if (!usbhsc_is_multi_clks(priv))
+		return 0;
+
+	/* The first clock should exist */
+	priv->clks[0] = of_clk_get(dev->of_node, 0);
+	if (IS_ERR(priv->clks[0]))
+		return PTR_ERR(priv->clks[0]);
+
+	/*
+	 * To backward compatibility with old DT, this driver checks the return
+	 * value if it's -ENOENT or not.
+	 */
+	priv->clks[1] = of_clk_get(dev->of_node, 1);
+	if (PTR_ERR(priv->clks[1]) == -ENOENT)
+		priv->clks[1] = NULL;
+	else if (IS_ERR(priv->clks[1]))
+		return PTR_ERR(priv->clks[1]);
+
+	return 0;
+}
+
+static void usbhsc_clk_put(struct usbhs_priv *priv)
+{
+	int i;
+
+	if (!usbhsc_is_multi_clks(priv))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(priv->clks); i++)
+		clk_put(priv->clks[i]);
+}
+
+static int usbhsc_clk_prepare_enable(struct usbhs_priv *priv)
+{
+	int i, ret;
+
+	if (!usbhsc_is_multi_clks(priv))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(priv->clks); i++) {
+		ret = clk_prepare_enable(priv->clks[i]);
+		if (ret) {
+			while (--i >= 0)
+				clk_disable_unprepare(priv->clks[i]);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static void usbhsc_clk_disable_unprepare(struct usbhs_priv *priv)
+{
+	int i;
+
+	if (!usbhsc_is_multi_clks(priv))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(priv->clks); i++)
+		clk_disable_unprepare(priv->clks[i]);
+}
+
 /*
  *		platform default param
  */
@@ -341,6 +415,10 @@ static void usbhsc_power_ctrl(struct usbhs_priv *priv, int enable)
 		/* enable PM */
 		pm_runtime_get_sync(dev);
 
+		/* enable clks */
+		if (usbhsc_clk_prepare_enable(priv))
+			return;
+
 		/* enable platform power */
 		usbhs_platform_call(priv, power_ctrl, pdev, priv->base, enable);
 
@@ -353,6 +431,9 @@ static void usbhsc_power_ctrl(struct usbhs_priv *priv, int enable)
 		/* disable platform power */
 		usbhs_platform_call(priv, power_ctrl, pdev, priv->base, enable);
 
+		/* disable clks */
+		usbhsc_clk_disable_unprepare(priv);
+
 		/* disable PM */
 		pm_runtime_put_sync(dev);
 	}
@@ -667,6 +748,10 @@ static int usbhs_probe(struct platform_device *pdev)
 	if (ret)
 		goto probe_fail_rst;
 
+	ret = usbhsc_clk_get(&pdev->dev, priv);
+	if (ret)
+		goto probe_fail_clks;
+
 	/*
 	 * deviece reset here because
 	 * USB device might be used in boot loader.
@@ -720,6 +805,8 @@ static int usbhs_probe(struct platform_device *pdev)
 	return ret;
 
 probe_end_mod_exit:
+	usbhsc_clk_put(priv);
+probe_fail_clks:
 	reset_control_assert(priv->rsts);
 probe_fail_rst:
 	usbhs_mod_remove(priv);
@@ -750,6 +837,7 @@ static int usbhs_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	usbhs_platform_call(priv, hardware_exit, pdev);
+	usbhsc_clk_put(priv);
 	reset_control_assert(priv->rsts);
 	usbhs_mod_remove(priv);
 	usbhs_fifo_remove(priv);
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index bce7d35..555b3e7 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -8,6 +8,7 @@
 #ifndef RENESAS_USB_DRIVER_H
 #define RENESAS_USB_DRIVER_H
 
+#include <linux/clk.h>
 #include <linux/extcon.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
@@ -279,6 +280,7 @@ struct usbhs_priv {
 
 	struct phy *phy;
 	struct reset_control *rsts;
+	struct clk *clks[2];
 };
 
 /*
-- 
1.9.1
