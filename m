From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 3/3] usb: chipidea: imx: set over current polarity per dts setting
Date: Wed, 20 Jul 2016 16:02:42 +0800
Message-ID: <1469001762-15015-3-git-send-email-jun.li@nxp.com>
References: <1469001762-15015-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469001762-15015-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peter.chen-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

imx usb over current polarity is low active by default, with
over-current-active-high property added, user can config it to be high
active. Meanwhile keep this setting unchanged for existing platforms
so new platform must set the right value for active low by its usbmisc
init function if over current is enabled.

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  3 +++
 drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
 drivers/usb/chipidea/usbmisc_imx.c | 22 +++++++++++++++++-----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index dedc33e..0991794 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -140,6 +140,9 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 	if (of_find_property(np, "disable-over-current", NULL))
 		data->disable_oc = 1;
 
+	if (of_find_property(np, "over-current-active-high", NULL))
+		data->oc_polarity = 1;
+
 	if (of_find_property(np, "external-vbus-divider", NULL))
 		data->evdo = 1;
 
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 635717e..409aa5ca8 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -17,6 +17,7 @@ struct imx_usbmisc_data {
 	int index;
 
 	unsigned int disable_oc:1; /* over current detect disabled */
+	unsigned int oc_polarity:1; /* over current polarity if oc enabled */
 	unsigned int evdo:1; /* set external vbus divider option */
 };
 
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index ab8b027..20d02a5 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -56,6 +56,7 @@
 
 #define MX6_BM_NON_BURST_SETTING	BIT(1)
 #define MX6_BM_OVER_CUR_DIS		BIT(7)
+#define MX6_BM_OVER_CUR_POLARITY	BIT(8)
 #define MX6_BM_WAKEUP_ENABLE		BIT(10)
 #define MX6_BM_ID_WAKEUP		BIT(16)
 #define MX6_BM_VBUS_WAKEUP		BIT(17)
@@ -266,11 +267,14 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_data *data)
 
 	spin_lock_irqsave(&usbmisc->lock, flags);
 
+	reg = readl(usbmisc->base + data->index * 4);
 	if (data->disable_oc) {
-		reg = readl(usbmisc->base + data->index * 4);
-		writel(reg | MX6_BM_OVER_CUR_DIS,
-			usbmisc->base + data->index * 4);
+		reg |= MX6_BM_OVER_CUR_DIS;
+	} else if (data->oc_polarity == 1) {
+		/* High active */
+		reg &= ~(MX6_BM_OVER_CUR_DIS | MX6_BM_OVER_CUR_POLARITY);
 	}
+	writel(reg, usbmisc->base + data->index * 4);
 
 	/* SoC non-burst setting */
 	reg = readl(usbmisc->base + data->index * 4);
@@ -365,10 +369,14 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 		return -EINVAL;
 
 	spin_lock_irqsave(&usbmisc->lock, flags);
+	reg = readl(usbmisc->base);
 	if (data->disable_oc) {
-		reg = readl(usbmisc->base);
-		writel(reg | MX6_BM_OVER_CUR_DIS, usbmisc->base);
+		reg |= MX6_BM_OVER_CUR_DIS;
+	} else if (data->oc_polarity == 1) {
+		/* High active */
+		reg &= ~(MX6_BM_OVER_CUR_DIS | MX6_BM_OVER_CUR_POLARITY);
 	}
+	writel(reg, usbmisc->base);
 
 	reg = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
 	reg &= ~MX7D_USB_VBUS_WAKEUP_SOURCE_MASK;
@@ -492,6 +500,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx6ul-usbmisc",
 		.data = &imx6sx_usbmisc_ops,
 	},
+	{
+		.compatible = "fsl,imx7d-usbmisc",
+		.data = &imx7d_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
