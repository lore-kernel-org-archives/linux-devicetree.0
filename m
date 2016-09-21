From: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH v5 1/2] usb: chipidea: imx: configure imx for ULPI phy
Date: Wed, 21 Sep 2016 11:07:06 +0200
Message-ID: <1474448827-8354-2-git-send-email-fabien.lahoudere@collabora.co.uk>
References: <1474448827-8354-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474448827-8354-1-git-send-email-fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter.Chen-3arQi8VN3Tc@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to use ULPI phy with usb host 2 and 3, we need to configure
controller register to enable ULPI features.

Each USB controller have different behaviour, so in order to avoid to have
several "swicth(data->index)" and lock/unlock, we prefer to get the index
switch and then test for features if they exist for this index.
This patch also remove useless test of reg and val. Those two values cannot
be NULL.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  5 +++
 drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
 drivers/usb/chipidea/usbmisc_imx.c | 75 +++++++++++++++++++++++++++++++-------
 3 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 0991794..96c0e33 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -18,6 +18,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 #include <linux/usb/chipidea.h>
+#include <linux/usb/of.h>
 #include <linux/clk.h>
 
 #include "ci.h"
@@ -146,6 +147,10 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 	if (of_find_property(np, "external-vbus-divider", NULL))
 		data->evdo = 1;
 
+
+	if (of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI)
+		data->ulpi = 1;
+
 	return data;
 }
 
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 409aa5ca8..d666c9f 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -19,6 +19,7 @@ struct imx_usbmisc_data {
 	unsigned int disable_oc:1; /* over current detect disabled */
 	unsigned int oc_polarity:1; /* over current polarity if oc enabled */
 	unsigned int evdo:1; /* set external vbus divider option */
+	unsigned int ulpi:1; /* connected to an ULPI phy */
 };
 
 int imx_usbmisc_init(struct imx_usbmisc_data *);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 20d02a5..11f51bd 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -46,11 +46,20 @@
 
 #define MX53_USB_OTG_PHY_CTRL_0_OFFSET	0x08
 #define MX53_USB_OTG_PHY_CTRL_1_OFFSET	0x0c
+#define MX53_USB_CTRL_1_OFFSET	        0x10
+#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_MASK (0x11 << 2)
+#define MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_ULPI BIT(2)
+#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_MASK (0x11 << 6)
+#define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_ULPI BIT(6)
 #define MX53_USB_UH2_CTRL_OFFSET	0x14
 #define MX53_USB_UH3_CTRL_OFFSET	0x18
 #define MX53_BM_OVER_CUR_DIS_H1		BIT(5)
 #define MX53_BM_OVER_CUR_DIS_OTG	BIT(8)
 #define MX53_BM_OVER_CUR_DIS_UHx	BIT(30)
+#define MX53_USB_CTRL_1_UH2_ULPI_EN	BIT(26)
+#define MX53_USB_CTRL_1_UH3_ULPI_EN	BIT(27)
+#define MX53_USB_UHx_CTRL_WAKE_UP_EN	BIT(7)
+#define MX53_USB_UHx_CTRL_ULPI_INT_EN	BIT(8)
 #define MX53_USB_PHYCTRL1_PLLDIV_MASK	0x3
 #define MX53_USB_PLL_DIV_24_MHZ		0x01
 
@@ -199,31 +208,69 @@ static int usbmisc_imx53_init(struct imx_usbmisc_data *data)
 	val |= MX53_USB_PLL_DIV_24_MHZ;
 	writel(val, usbmisc->base + MX53_USB_OTG_PHY_CTRL_1_OFFSET);
 
-	if (data->disable_oc) {
-		spin_lock_irqsave(&usbmisc->lock, flags);
-		switch (data->index) {
-		case 0:
+	spin_lock_irqsave(&usbmisc->lock, flags);
+
+	switch (data->index) {
+	case 0:
+		if (data->disable_oc) {
 			reg = usbmisc->base + MX53_USB_OTG_PHY_CTRL_0_OFFSET;
 			val = readl(reg) | MX53_BM_OVER_CUR_DIS_OTG;
-			break;
-		case 1:
+			writel(val, reg);
+		}
+		break;
+	case 1:
+		if (data->disable_oc) {
 			reg = usbmisc->base + MX53_USB_OTG_PHY_CTRL_0_OFFSET;
 			val = readl(reg) | MX53_BM_OVER_CUR_DIS_H1;
-			break;
-		case 2:
+			writel(val, reg);
+		}
+		break;
+	case 2:
+		if (data->ulpi) {
+			/* set USBH2 into ULPI-mode. */
+			reg = usbmisc->base + MX53_USB_CTRL_1_OFFSET;
+			val = readl(reg) | MX53_USB_CTRL_1_UH2_ULPI_EN;
+			/* select ULPI clock */
+			val &= ~MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_MASK;
+			val |= MX53_USB_CTRL_1_H2_XCVR_CLK_SEL_ULPI;
+			writel(val, reg);
+			/* Set interrupt wake up enable */
+			reg = usbmisc->base + MX53_USB_UH2_CTRL_OFFSET;
+			val = readl(reg) | MX53_USB_UHx_CTRL_WAKE_UP_EN
+				| MX53_USB_UHx_CTRL_ULPI_INT_EN;
+			writel(val, reg);
+		}
+		if (data->disable_oc) {
 			reg = usbmisc->base + MX53_USB_UH2_CTRL_OFFSET;
 			val = readl(reg) | MX53_BM_OVER_CUR_DIS_UHx;
-			break;
-		case 3:
+			writel(val, reg);
+		}
+		break;
+	case 3:
+		if (data->ulpi) {
+			/* set USBH3 into ULPI-mode. */
+			reg = usbmisc->base + MX53_USB_CTRL_1_OFFSET;
+			val = readl(reg) | MX53_USB_CTRL_1_UH3_ULPI_EN;
+			/* select ULPI clock */
+			val &= ~MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_MASK;
+			val |= MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_ULPI;
+			writel(val, reg);
+			/* Set interrupt wake up enable */
 			reg = usbmisc->base + MX53_USB_UH3_CTRL_OFFSET;
-			val = readl(reg) | MX53_BM_OVER_CUR_DIS_UHx;
-			break;
+			val = readl(reg) | MX53_USB_UHx_CTRL_WAKE_UP_EN
+				| MX53_USB_UHx_CTRL_ULPI_INT_EN;
+			writel(val, reg);
 		}
-		if (reg && val)
+		if (data->disable_oc) {
+			reg = usbmisc->base + MX53_USB_UH3_CTRL_OFFSET;
+			val = readl(reg) | MX53_BM_OVER_CUR_DIS_UHx;
 			writel(val, reg);
-		spin_unlock_irqrestore(&usbmisc->lock, flags);
+		}
+		break;
 	}
 
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
 	return 0;
 }
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
