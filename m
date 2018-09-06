Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 1/3] usb: renesas_usbhs: Add reset_control
Date: Thu,  6 Sep 2018 14:50:12 +0900
Message-Id: <1536213014-1325-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1536213014-1325-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1536213014-1325-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

R-Car Gen3 needs to deassert resets of both host and peripheral.
Since [eo]hci-platform is possible to assert the reset(s) when
the probing failed, renesas_usbhs driver doesn't work correctly
regardless of finished probing. To fix this issue, this patch adds
reset_control on this renesas_usbhs driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 12 ++++++++++++
 drivers/usb/renesas_usbhs/common.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 4310df4..1d355d5 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -12,6 +12,7 @@
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include "common.h"
@@ -574,6 +575,10 @@ static int usbhs_probe(struct platform_device *pdev)
 			return PTR_ERR(priv->edev);
 	}
 
+	priv->rsts = devm_reset_control_array_get_optional_shared(&pdev->dev);
+	if (IS_ERR(priv->rsts))
+		return PTR_ERR(priv->rsts);
+
 	/*
 	 * care platform info
 	 */
@@ -658,6 +663,10 @@ static int usbhs_probe(struct platform_device *pdev)
 	/* dev_set_drvdata should be called after usbhs_mod_init */
 	platform_set_drvdata(pdev, priv);
 
+	ret = reset_control_deassert(priv->rsts);
+	if (ret)
+		goto probe_fail_rst;
+
 	/*
 	 * deviece reset here because
 	 * USB device might be used in boot loader.
@@ -711,6 +720,8 @@ static int usbhs_probe(struct platform_device *pdev)
 	return ret;
 
 probe_end_mod_exit:
+	reset_control_assert(priv->rsts);
+probe_fail_rst:
 	usbhs_mod_remove(priv);
 probe_end_fifo_exit:
 	usbhs_fifo_remove(priv);
@@ -739,6 +750,7 @@ static int usbhs_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	usbhs_platform_call(priv, hardware_exit, pdev);
+	reset_control_assert(priv->rsts);
 	usbhs_mod_remove(priv);
 	usbhs_fifo_remove(priv);
 	usbhs_pipe_remove(priv);
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 6137f79..bce7d35 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -10,6 +10,7 @@
 
 #include <linux/extcon.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/usb/renesas_usbhs.h>
 
 struct usbhs_priv;
@@ -277,6 +278,7 @@ struct usbhs_priv {
 	struct usbhs_fifo_info fifo_info;
 
 	struct phy *phy;
+	struct reset_control *rsts;
 };
 
 /*
-- 
1.9.1
