Return-Path: <SRS0=qLWK=TP=renesas.com=prvs=4038260dfd=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 09/13] usb: renesas_usbhs: Add support for RZ/A2
Date: Wed, 15 May 2019 10:20:44 -0500
Message-ID: <20190515152048.42363-10-chris.brandt@renesas.com>
In-Reply-To: <20190515152048.42363-1-chris.brandt@renesas.com>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

The RZ/A2 is similar to the R-Car Gen3 with some small differences.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v4:
 * Removed extra blank line
 * Removed 'if' from exit function
 * added reviewed-by
v3:
 * Removed check for CONFIG_GENERIC_PHY
 * rebase on top of Shimoda-san (v2) patch
v2:
 * combined RZA1 and RZA2 for fifo setting
 * added braces to make code easier to read
 * fixed and clean up usbhs_rza2_power_ctrl()
---
 drivers/usb/renesas_usbhs/Makefile |  2 +-
 drivers/usb/renesas_usbhs/common.c | 15 ++++++++
 drivers/usb/renesas_usbhs/rza.h    |  1 +
 drivers/usb/renesas_usbhs/rza2.c   | 72 ++++++++++++++++++++++++++++++++++++++
 include/linux/usb/renesas_usbhs.h  |  1 +
 5 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza2.c

diff --git a/drivers/usb/renesas_usbhs/Makefile b/drivers/usb/renesas_usbhs/Makefile
index 5c5b51bb48ef..a1fed56b0957 100644
--- a/drivers/usb/renesas_usbhs/Makefile
+++ b/drivers/usb/renesas_usbhs/Makefile
@@ -5,7 +5,7 @@
 
 obj-$(CONFIG_USB_RENESAS_USBHS)	+= renesas_usbhs.o
 
-renesas_usbhs-y			:= common.o mod.o pipe.o fifo.o rcar2.o rcar3.o rza.o
+renesas_usbhs-y			:= common.o mod.o pipe.o fifo.o rcar2.o rcar3.o rza.o rza2.o
 
 ifneq ($(CONFIG_USB_RENESAS_USBHS_HCD),)
 	renesas_usbhs-y		+= mod_host.o
diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 734fb4e542c5..c7c9c5d75a56 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -571,6 +571,17 @@ static const struct usbhs_of_data rza1_data = {
 	}
 };
 
+static const struct usbhs_of_data rza2_data = {
+	.platform_callback = &usbhs_rza2_ops,
+	.param = {
+		.type = USBHS_TYPE_RZA2,
+		.has_cnen = 1,
+		.cfifo_byte_addr = 1,
+		.pipe_configs = usbhsc_new_pipe,
+		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+	}
+};
+
 /*
  *		platform functions
  */
@@ -619,6 +630,10 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,rza1-usbhs",
 		.data = &rza1_data,
 	},
+	{
+		.compatible = "renesas,rza2-usbhs",
+		.data = &rza2_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usbhs_of_match);
diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/rza.h
index ca917ca54f6d..073a53d1d442 100644
--- a/drivers/usb/renesas_usbhs/rza.h
+++ b/drivers/usb/renesas_usbhs/rza.h
@@ -2,3 +2,4 @@
 #include "common.h"
 
 extern const struct renesas_usbhs_platform_callback usbhs_rza1_ops;
+extern const struct renesas_usbhs_platform_callback usbhs_rza2_ops;
diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs/rza2.c
new file mode 100644
index 000000000000..9d8551f93533
--- /dev/null
+++ b/drivers/usb/renesas_usbhs/rza2.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas USB driver RZ/A2 initialization and power control
+ *
+ * Copyright (C) 2019 Chris Brandt
+ * Copyright (C) 2019 Renesas Electronics Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include "common.h"
+#include "rza.h"
+
+static int usbhs_rza2_hardware_init(struct platform_device *pdev)
+{
+	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
+	struct phy *phy = phy_get(&pdev->dev, "usb");
+
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	priv->phy = phy;
+	return 0;
+}
+
+static int usbhs_rza2_hardware_exit(struct platform_device *pdev)
+{
+	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
+
+	phy_put(priv->phy);
+	priv->phy = NULL;
+
+	return 0;
+}
+
+static int usbhs_rza2_power_ctrl(struct platform_device *pdev,
+				void __iomem *base, int enable)
+{
+	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
+	int retval = 0;
+
+	if (!priv->phy)
+		return -ENODEV;
+
+	if (enable) {
+		retval = phy_init(priv->phy);
+		usbhs_bset(priv, SUSPMODE, SUSPM, SUSPM);
+		udelay(100);	/* Wait for PLL to become stable */
+		if (!retval)
+			retval = phy_power_on(priv->phy);
+	} else {
+		usbhs_bset(priv, SUSPMODE, SUSPM, 0);
+		phy_power_off(priv->phy);
+		phy_exit(priv->phy);
+	}
+
+	return retval;
+}
+
+static int usbhs_rza2_get_id(struct platform_device *pdev)
+{
+	return USBHS_GADGET;
+}
+
+const struct renesas_usbhs_platform_callback usbhs_rza2_ops = {
+	.hardware_init = usbhs_rza2_hardware_init,
+	.hardware_exit = usbhs_rza2_hardware_exit,
+	.power_ctrl = usbhs_rza2_power_ctrl,
+	.get_id = usbhs_rza2_get_id,
+};
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 87043fd21d54..3f53043fb56b 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -199,6 +199,7 @@ struct renesas_usbhs_driver_param {
 #define USBHS_TYPE_RCAR_GEN3		2
 #define USBHS_TYPE_RCAR_GEN3_WITH_PLL	3
 #define USBHS_TYPE_RZA1			4
+#define USBHS_TYPE_RZA2			5
 
 /*
  * option:
-- 
2.16.1
