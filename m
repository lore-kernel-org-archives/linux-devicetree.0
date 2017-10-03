From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] usb: renesas_usbhs: add support for R-Car D3
Date: Tue,  3 Oct 2017 20:09:14 +0900
Message-ID: <1507028954-15738-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507028954-15738-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507028954-15738-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for R-Car D3. This SoC needs to release
the PLL reset by the UGCTRL register. So, since this is not the same
as other R-Car Gen3 SoCs, this patch adds a new type as
"USBHS_TYPE_RCAR_GEN3_WITH_PLL".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/usb/renesas_usbhs.txt      |  1 +
 drivers/usb/renesas_usbhs/common.c                 | 10 ++++-
 drivers/usb/renesas_usbhs/rcar3.c                  | 48 ++++++++++++++++++++++
 drivers/usb/renesas_usbhs/rcar3.h                  |  1 +
 include/linux/usb/renesas_usbhs.h                  |  5 ++-
 5 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index 9e18e00..e79f6e4 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -10,6 +10,7 @@ Required properties:
 	- "renesas,usbhs-r8a7794" for r8a7794 (R-Car E2) compatible device
 	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
 	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
+	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
 	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 compatible device
 	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
 
diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 2a860e4..3e92a78 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -486,6 +486,10 @@ static int usbhsc_drvcllbck_notify_hotplug(struct platform_device *pdev)
 		.data = (void *)USBHS_TYPE_RCAR_GEN3,
 	},
 	{
+		.compatible = "renesas,usbhs-r8a77995",
+		.data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
+	},
+	{
 		.compatible = "renesas,rcar-gen2-usbhs",
 		.data = (void *)USBHS_TYPE_RCAR_GEN2,
 	},
@@ -519,7 +523,8 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 		dparam->enable_gpio = gpio;
 
 	if (dparam->type == USBHS_TYPE_RCAR_GEN2 ||
-	    dparam->type == USBHS_TYPE_RCAR_GEN3) {
+	    dparam->type == USBHS_TYPE_RCAR_GEN3 ||
+	    dparam->type == USBHS_TYPE_RCAR_GEN3_WITH_PLL) {
 		dparam->has_usb_dmac = 1;
 		dparam->pipe_configs = usbhsc_new_pipe;
 		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
@@ -584,6 +589,9 @@ static int usbhs_probe(struct platform_device *pdev)
 	case USBHS_TYPE_RCAR_GEN3:
 		priv->pfunc = usbhs_rcar3_ops;
 		break;
+	case USBHS_TYPE_RCAR_GEN3_WITH_PLL:
+		priv->pfunc = usbhs_rcar3_with_pll_ops;
+		break;
 	default:
 		if (!info->platform_callback.get_id) {
 			dev_err(&pdev->dev, "no platform callbacks");
diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index 02b67ab..f436e9d 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -15,24 +15,39 @@
 #include "rcar3.h"
 
 #define LPSTS		0x102
+#define UGCTRL		0x180	/* 32-bit register */
 #define UGCTRL2		0x184	/* 32-bit register */
+#define UGSTS		0x188	/* 32-bit register */
 
 /* Low Power Status register (LPSTS) */
 #define LPSTS_SUSPM	0x4000
 
+/* R-Car D3 only: USB General control register (UGCTRL) */
+#define UGCTRL_PLLRESET		0x00000001
+#define UGCTRL_CONNECT		0x00000004
+
 /*
  * USB General control register 2 (UGCTRL2)
  * Remarks: bit[31:11] and bit[9:6] should be 0
  */
 #define UGCTRL2_RESERVED_3	0x00000001	/* bit[3:0] should be B'0001 */
+#define UGCTRL2_USB0SEL_HSUSB	0x00000020
 #define UGCTRL2_USB0SEL_OTG	0x00000030
 #define UGCTRL2_VBUSSEL		0x00000400
 
+/* R-Car D3 only: USB General status register (UGSTS) */
+#define UGSTS_LOCK		0x00000100
+
 static void usbhs_write32(struct usbhs_priv *priv, u32 reg, u32 data)
 {
 	iowrite32(data, priv->base + reg);
 }
 
+static u32 usbhs_read32(struct usbhs_priv *priv, u32 reg)
+{
+	return ioread32(priv->base + reg);
+}
+
 static int usbhs_rcar3_power_ctrl(struct platform_device *pdev,
 				void __iomem *base, int enable)
 {
@@ -52,6 +67,34 @@ static int usbhs_rcar3_power_ctrl(struct platform_device *pdev,
 	return 0;
 }
 
+/* R-Car D3 needs to release UGCTRL.PLLRESET */
+static int usbhs_rcar3_power_and_pll_ctrl(struct platform_device *pdev,
+					  void __iomem *base, int enable)
+{
+	struct usbhs_priv *priv = usbhs_pdev_to_priv(pdev);
+	u32 val;
+	int timeout = 1000;
+
+	if (enable) {
+		usbhs_write32(priv, UGCTRL, 0);	/* release PLLRESET */
+		usbhs_write32(priv, UGCTRL2, UGCTRL2_RESERVED_3 |
+			      UGCTRL2_USB0SEL_HSUSB);
+
+		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, LPSTS_SUSPM);
+		do {
+			val = usbhs_read32(priv, UGSTS);
+			udelay(1);
+		} while (!(val & UGSTS_LOCK) && timeout--);
+		usbhs_write32(priv, UGCTRL, UGCTRL_CONNECT);
+	} else {
+		usbhs_write32(priv, UGCTRL, 0);
+		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, 0);
+		usbhs_write32(priv, UGCTRL, UGCTRL_PLLRESET);
+	}
+
+	return 0;
+}
+
 static int usbhs_rcar3_get_id(struct platform_device *pdev)
 {
 	return USBHS_GADGET;
@@ -61,3 +104,8 @@ static int usbhs_rcar3_get_id(struct platform_device *pdev)
 	.power_ctrl = usbhs_rcar3_power_ctrl,
 	.get_id = usbhs_rcar3_get_id,
 };
+
+const struct renesas_usbhs_platform_callback usbhs_rcar3_with_pll_ops = {
+	.power_ctrl = usbhs_rcar3_power_and_pll_ctrl,
+	.get_id = usbhs_rcar3_get_id,
+};
diff --git a/drivers/usb/renesas_usbhs/rcar3.h b/drivers/usb/renesas_usbhs/rcar3.h
index 5f850b2..7fe9817 100644
--- a/drivers/usb/renesas_usbhs/rcar3.h
+++ b/drivers/usb/renesas_usbhs/rcar3.h
@@ -1,3 +1,4 @@
 #include "common.h"
 
 extern const struct renesas_usbhs_platform_callback usbhs_rcar3_ops;
+extern const struct renesas_usbhs_platform_callback usbhs_rcar3_with_pll_ops;
diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 00a47d0..d2f41e4 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -183,8 +183,9 @@ struct renesas_usbhs_driver_param {
 #define USBHS_USB_DMAC_XFER_SIZE	32	/* hardcode the xfer size */
 };
 
-#define USBHS_TYPE_RCAR_GEN2	1
-#define USBHS_TYPE_RCAR_GEN3	2
+#define USBHS_TYPE_RCAR_GEN2		1
+#define USBHS_TYPE_RCAR_GEN3		2
+#define USBHS_TYPE_RCAR_GEN3_WITH_PLL	3
 
 /*
  * option:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
