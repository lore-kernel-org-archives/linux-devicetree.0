From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 1/3] usb: renesas_usbhs: Add support for RZ/A1
Date: Fri,  5 Jan 2018 17:46:45 -0500
Message-ID: <20180105224647.42262-2-chris.brandt@renesas.com>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105224647.42262-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the capability to support RZ/A1 SoCs.

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
v2:
 * Removed "renesas,usbhs-r7s72100"
 * Changed license of rza.c
---
 drivers/usb/renesas_usbhs/Makefile |  2 +-
 drivers/usb/renesas_usbhs/common.c | 13 ++++++++++
 drivers/usb/renesas_usbhs/common.h |  6 +++++
 drivers/usb/renesas_usbhs/rza.c    | 52 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/renesas_usbhs/rza.h    |  4 +++
 include/linux/usb/renesas_usbhs.h  |  1 +
 6 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza.c
 create mode 100644 drivers/usb/renesas_usbhs/rza.h

diff --git a/drivers/usb/renesas_usbhs/Makefile b/drivers/usb/renesas_usbhs/Makefile
index fac147a3ad23..5c5b51bb48ef 100644
--- a/drivers/usb/renesas_usbhs/Makefile
+++ b/drivers/usb/renesas_usbhs/Makefile
@@ -5,7 +5,7 @@
 
 obj-$(CONFIG_USB_RENESAS_USBHS)	+= renesas_usbhs.o
 
-renesas_usbhs-y			:= common.o mod.o pipe.o fifo.o rcar2.o rcar3.o
+renesas_usbhs-y			:= common.o mod.o pipe.o fifo.o rcar2.o rcar3.o rza.o
 
 ifneq ($(CONFIG_USB_RENESAS_USBHS_HCD),)
 	renesas_usbhs-y		+= mod_host.o
diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index c5289b3ecf8d..4310df46639d 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -17,6 +17,7 @@
 #include "common.h"
 #include "rcar2.h"
 #include "rcar3.h"
+#include "rza.h"
 
 /*
  *		image of renesas_usbhs
@@ -488,6 +489,10 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,rcar-gen3-usbhs",
 		.data = (void *)USBHS_TYPE_RCAR_GEN3,
 	},
+	{
+		.compatible = "renesas,rza1-usbhs",
+		.data = (void *)USBHS_TYPE_RZA1,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usbhs_of_match);
@@ -520,6 +525,11 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
 	}
 
+	if (dparam->type == USBHS_TYPE_RZA1) {
+		dparam->pipe_configs = usbhsc_new_pipe;
+		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
+	}
+
 	return info;
 }
 
@@ -591,6 +601,9 @@ static int usbhs_probe(struct platform_device *pdev)
 				dev_err(&pdev->dev, "no notifier registered\n");
 		}
 		break;
+	case USBHS_TYPE_RZA1:
+		priv->pfunc = usbhs_rza1_ops;
+		break;
 	default:
 		if (!info->platform_callback.get_id) {
 			dev_err(&pdev->dev, "no platform callbacks");
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index c9747f064601..f619afeae2b8 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -98,6 +98,7 @@ struct usbhs_priv;
 #define D2FIFOCTR	0x00F2	/* for R-Car Gen2 */
 #define D3FIFOSEL	0x00F4	/* for R-Car Gen2 */
 #define D3FIFOCTR	0x00F6	/* for R-Car Gen2 */
+#define SUSPMODE	0x0102	/* for RZ/A */
 
 /* SYSCFG */
 #define SCKE	(1 << 10)	/* USB Module Clock Enable */
@@ -106,6 +107,8 @@ struct usbhs_priv;
 #define DRPD	(1 << 5)	/* D+ Line/D- Line Resistance Control */
 #define DPRPU	(1 << 4)	/* D+ Line Resistance Control */
 #define USBE	(1 << 0)	/* USB Module Operation Enable */
+#define UCKSEL	(1 << 2)	/* Clock Select for RZ/A1 */
+#define UPLLE	(1 << 1)	/* USB PLL Enable for RZ/A1 */
 
 /* DVSTCTR */
 #define EXTLP	(1 << 10)	/* Controls the EXTLP pin output state */
@@ -233,6 +236,9 @@ struct usbhs_priv;
 #define USBSPD_SPEED_FULL	0x2
 #define USBSPD_SPEED_HIGH	0x3
 
+/* SUSPMODE */
+#define SUSPM		(1 << 14)	/* SuspendM Control */
+
 /*
  *		struct
  */
diff --git a/drivers/usb/renesas_usbhs/rza.c b/drivers/usb/renesas_usbhs/rza.c
new file mode 100644
index 000000000000..5b287257ec11
--- /dev/null
+++ b/drivers/usb/renesas_usbhs/rza.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas USB driver RZ/A initialization and power control
+ *
+ * Copyright (C) 2018 Chris Brandt
+ * Copyright (C) 2018 Renesas Electronics Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include "common.h"
+#include "rza.h"
+
+static int usbhs_rza1_hardware_init(struct platform_device *pdev)
+{
+	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
+	struct device_node *usb_x1_clk, *extal_clk;
+	u32 freq_usb = 0, freq_extal = 0;
+
+	/* Input Clock Selection (NOTE: ch0 controls both ch0 and ch1) */
+	usb_x1_clk = of_find_node_by_name(NULL, "usb_x1");
+	extal_clk = of_find_node_by_name(NULL, "extal");
+	of_property_read_u32(usb_x1_clk, "clock-frequency", &freq_usb);
+	of_property_read_u32(extal_clk, "clock-frequency", &freq_extal);
+	if (freq_usb == 0) {
+		if (freq_extal == 12000000) {
+			/* Select 12MHz XTAL */
+			usbhs_bset(priv, SYSCFG, UCKSEL, UCKSEL);
+		} else {
+			dev_err(usbhs_priv_to_dev(priv), "A 48MHz USB clock or 12MHz main clock is required.\n");
+			return -EIO;
+		}
+	}
+
+	/* Enable USB PLL (NOTE: ch0 controls both ch0 and ch1) */
+	usbhs_bset(priv, SYSCFG, UPLLE, UPLLE);
+	udelay(1000);
+	usbhs_bset(priv, SUSPMODE, SUSPM, SUSPM);
+
+	return 0;
+}
+
+static int usbhs_rza_get_id(struct platform_device *pdev)
+{
+	return USBHS_GADGET;
+}
+
+const struct renesas_usbhs_platform_callback usbhs_rza1_ops = {
+	.hardware_init = usbhs_rza1_hardware_init,
+	.get_id = usbhs_rza_get_id,
+};
diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/rza.h
new file mode 100644
index 000000000000..ca917ca54f6d
--- /dev/null
+++ b/drivers/usb/renesas_usbhs/rza.h
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "common.h"
+
+extern const struct renesas_usbhs_platform_callback usbhs_rza1_ops;
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 9482735d4ca5..53924f8e840c 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -195,6 +195,7 @@ struct renesas_usbhs_driver_param {
 #define USBHS_TYPE_RCAR_GEN2		1
 #define USBHS_TYPE_RCAR_GEN3		2
 #define USBHS_TYPE_RCAR_GEN3_WITH_PLL	3
+#define USBHS_TYPE_RZA1			4
 
 /*
  * option:
-- 
2.15.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
