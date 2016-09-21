From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Subject: [PATCH v5 2/2] usb: chipidea: imx: Add binding to disable USB 60Mhz clock
Date: Wed, 21 Sep 2016 11:07:07 +0200
Message-ID: <1474448827-8354-3-git-send-email-fabien.lahoudere@collabora.co.uk>
References: <1474448827-8354-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474448827-8354-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter.Chen@nxp.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

This binding allow to disable the internal 60Mhz clock for USB host2 or
host3.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt |  1 +
 drivers/usb/chipidea/ci_hdrc_imx.c                     |  2 ++
 drivers/usb/chipidea/ci_hdrc_imx.h                     |  1 +
 drivers/usb/chipidea/usbmisc_imx.c                     | 13 +++++++++++++
 4 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 0e03344..f83da66 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -84,6 +84,7 @@ i.mx specific properties
 - over-current-active-high: over current signal polarity is high active,
   typically over current signal polarity is low active.
 - external-vbus-divider: enables off-chip resistor divider for Vbus
+- disable-int60ck: disable internal 60MHz clock for usb host2 or host3 on imx53
 
 Example:
 
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 96c0e33..89a9d98 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -147,6 +147,8 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 	if (of_find_property(np, "external-vbus-divider", NULL))
 		data->evdo = 1;
 
+	if (of_find_property(np, "disable-int60ck", NULL))
+		data->disable_int60ck = 1;
 
 	if (of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI)
 		data->ulpi = 1;
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index d666c9f..43bafae 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -20,6 +20,7 @@ struct imx_usbmisc_data {
 	unsigned int oc_polarity:1; /* over current polarity if oc enabled */
 	unsigned int evdo:1; /* set external vbus divider option */
 	unsigned int ulpi:1; /* connected to an ULPI phy */
+	unsigned int disable_int60ck:1; /* disable 60 MHZ clock */
 };
 
 int imx_usbmisc_init(struct imx_usbmisc_data *);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 11f51bd..a781f87 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -53,6 +53,9 @@
 #define MX53_USB_CTRL_1_H3_XCVR_CLK_SEL_ULPI BIT(6)
 #define MX53_USB_UH2_CTRL_OFFSET	0x14
 #define MX53_USB_UH3_CTRL_OFFSET	0x18
+#define MX53_USB_CLKONOFF_CTRL_OFFSET	0x24
+#define MX53_USB_CLKONOFF_CTRL_H2_INT60CKOFF BIT(21)
+#define MX53_USB_CLKONOFF_CTRL_H3_INT60CKOFF BIT(22)
 #define MX53_BM_OVER_CUR_DIS_H1		BIT(5)
 #define MX53_BM_OVER_CUR_DIS_OTG	BIT(8)
 #define MX53_BM_OVER_CUR_DIS_UHx	BIT(30)
@@ -240,6 +243,11 @@ static int usbmisc_imx53_init(struct imx_usbmisc_data *data)
 				| MX53_USB_UHx_CTRL_ULPI_INT_EN;
 			writel(val, reg);
 		}
+		if (data->disable_int60ck) {
+			reg = usbmisc->base + MX53_USB_CLKONOFF_CTRL_OFFSET;
+			val = readl(reg) | MX53_USB_CLKONOFF_CTRL_H2_INT60CKOFF;
+			writel(val, reg);
+		}
 		if (data->disable_oc) {
 			reg = usbmisc->base + MX53_USB_UH2_CTRL_OFFSET;
 			val = readl(reg) | MX53_BM_OVER_CUR_DIS_UHx;
@@ -261,6 +269,11 @@ static int usbmisc_imx53_init(struct imx_usbmisc_data *data)
 				| MX53_USB_UHx_CTRL_ULPI_INT_EN;
 			writel(val, reg);
 		}
+		if (data->disable_int60ck) {
+			reg = usbmisc->base + MX53_USB_CLKONOFF_CTRL_OFFSET;
+			val = readl(reg) | MX53_USB_CLKONOFF_CTRL_H3_INT60CKOFF;
+			writel(val, reg);
+		}
 		if (data->disable_oc) {
 			reg = usbmisc->base + MX53_USB_UH3_CTRL_OFFSET;
 			val = readl(reg) | MX53_BM_OVER_CUR_DIS_UHx;
-- 
2.1.4
