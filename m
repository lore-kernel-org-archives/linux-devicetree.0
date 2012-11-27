From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v4 5/6] usb: chipidea: usbmisc: add mx53 support
Date: Tue, 27 Nov 2012 17:17:00 +0100
Message-ID: <1354033021-10585-6-git-send-email-m.grzeschik@pengutronix.de>
References: <1354033021-10585-1-git-send-email-m.grzeschik@pengutronix.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354033021-10585-1-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds mx53 as the next user of the usbmisc driver and makes it
possible to disable the overcurrent-detection of the internal phy.

Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Changes since v2:
* added defines for register offsets and bitmasks
* fixed disable_oc option for all ports

Changes since v3:
* removed spare semicolons at end of defines

 drivers/usb/chipidea/usbmisc_imx.c |   51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index d0c7a03..69a49e5 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -19,6 +19,13 @@
 
 #define USB_DEV_MAX 4
 
+#define MX53_USB_OTG_PHY_CTRL_0_OFFSET	0x08
+#define MX53_USB_UH2_CTRL_OFFSET	0x14
+#define MX53_USB_UH3_CTRL_OFFSET	0x18
+#define MX53_BM_OVER_CUR_DIS_H1		BIT(5)
+#define MX53_BM_OVER_CUR_DIS_OTG	BIT(8)
+#define MX53_BM_OVER_CUR_DIS_UHx	BIT(30)
+
 #define MX6_BM_OVER_CUR_DIS		BIT(7)
 
 struct imx_usbmisc {
@@ -52,6 +59,45 @@ static struct usbmisc_usb_device *get_usbdev(struct device *dev)
 	return &usbmisc->usbdev[i];
 }
 
+static int usbmisc_imx53_init(struct device *dev)
+{
+	struct usbmisc_usb_device *usbdev;
+	void __iomem *reg = NULL;
+	unsigned long flags;
+	u32 val = 0;
+
+	usbdev = get_usbdev(dev);
+	if (IS_ERR(usbdev))
+		return PTR_ERR(usbdev);
+
+	if (usbdev->disable_oc) {
+		spin_lock_irqsave(&usbmisc->lock, flags);
+		switch (usbdev->index) {
+		case 0:
+			reg = usbmisc->base + MX53_USB_OTG_PHY_CTRL_0_OFFSET;
+			val = readl(reg) | MX53_BM_OVER_CUR_DIS_OTG;
+			break;
+		case 1:
+			reg = usbmisc->base + MX53_USB_OTG_PHY_CTRL_0_OFFSET;
+			val = readl(reg) | MX53_BM_OVER_CUR_DIS_H1;
+			break;
+		case 2:
+			reg = usbmisc->base + MX53_USB_UH2_CTRL_OFFSET;
+			val = readl(reg) | MX53_BM_OVER_CUR_DIS_UHx;
+			break;
+		case 3:
+			reg = usbmisc->base + MX53_USB_UH3_CTRL_OFFSET;
+			val = readl(reg) | MX53_BM_OVER_CUR_DIS_UHx;
+			break;
+		}
+		if (reg && val)
+			writel(val, reg);
+		spin_unlock_irqrestore(&usbmisc->lock, flags);
+	}
+
+	return 0;
+}
+
 static int usbmisc_imx6q_init(struct device *dev)
 {
 
@@ -74,11 +120,16 @@ static int usbmisc_imx6q_init(struct device *dev)
 	return 0;
 }
 
+static const struct usbmisc_ops imx53_usbmisc_ops = {
+	.init = usbmisc_imx53_init,
+};
+
 static const struct usbmisc_ops imx6q_usbmisc_ops = {
 	.init = usbmisc_imx6q_init,
 };
 
 static const struct of_device_id usbmisc_imx_dt_ids[] = {
+	{ .compatible = "fsl,imx53-usbmisc", .data = (void *)&imx53_usbmisc_ops },
 	{ .compatible = "fsl,imx6q-usbmisc", .data = (void *)&imx6q_usbmisc_ops },
 	{ /* sentinel */ }
 };
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
