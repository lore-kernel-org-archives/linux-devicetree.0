From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 5/6] usb: chipidea: usbmisc: add mx53 support
Date: Wed, 14 Nov 2012 12:55:36 +0100
Message-ID: <1352894137-2050-6-git-send-email-m.grzeschik@pengutronix.de>
References: <1352894137-2050-1-git-send-email-m.grzeschik@pengutronix.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352894137-2050-1-git-send-email-m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds mx53 as the next user of the usbmisc driver and makes it
possible to disable the overcurrent-detection of the internal phy.

Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/usb/chipidea/usbmisc_imx.c |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 239b752..4ddc872 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -54,6 +54,29 @@ static struct usbmisc_usb_device *get_usbdev(struct device *dev)
 	return &usbmisc->usbdev[i];
 }
 
+static int usbmisc_imx53_init(struct device *dev)
+{
+	struct usbmisc_usb_device *usbdev;
+	void __iomem *reg;
+	unsigned long flags;
+	u32 val;
+
+	usbdev = get_usbdev(dev);
+	if (IS_ERR(usbdev))
+		return PTR_ERR(usbdev);
+
+	reg = usbmisc->base + usbdev->index * 8;
+
+	if (usbdev->disable_oc) {
+		spin_lock_irqsave(&usbmisc->lock, flags);
+		val = readl(reg);
+		writel(val | (1 << 5), reg);
+		spin_unlock_irqrestore(&usbmisc->lock, flags);
+	}
+
+	return 0;
+}
+
 static int usbmisc_imx6q_init(struct device *dev)
 {
 
@@ -76,11 +99,16 @@ static int usbmisc_imx6q_init(struct device *dev)
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
