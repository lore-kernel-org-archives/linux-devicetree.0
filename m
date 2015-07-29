From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 07/10] usb: chipidea: usbmisc_imx: add unburst setting for imx6
Date: Wed, 29 Jul 2015 10:42:11 +0800
Message-ID: <1438137734-27311-8-git-send-email-peter.chen@freescale.com>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438137734-27311-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With this setting and AHBBRST at SBUSCFG as "Incremental burst of
unspecified length", each unburst size can be taken as one single transfer.
It is benefit for unburst size transfer.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 3cefd49..69d39dc 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -54,6 +54,7 @@
 #define MX53_USB_PHYCTRL1_PLLDIV_MASK	0x3
 #define MX53_USB_PLL_DIV_24_MHZ		0x01
 
+#define MX6_BM_UNBURST_SETTING		BIT(1)
 #define MX6_BM_OVER_CUR_DIS		BIT(7)
 #define MX6_BM_WAKEUP_ENABLE		BIT(10)
 #define MX6_BM_ID_WAKEUP		BIT(16)
@@ -255,14 +256,21 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_data *data)
 	if (data->index > 3)
 		return -EINVAL;
 
+	spin_lock_irqsave(&usbmisc->lock, flags);
+
 	if (data->disable_oc) {
-		spin_lock_irqsave(&usbmisc->lock, flags);
 		reg = readl(usbmisc->base + data->index * 4);
 		writel(reg | MX6_BM_OVER_CUR_DIS,
 			usbmisc->base + data->index * 4);
-		spin_unlock_irqrestore(&usbmisc->lock, flags);
 	}
 
+	/* SoC unburst setting */
+	reg = readl(usbmisc->base + data->index * 4);
+	writel(reg | MX6_BM_UNBURST_SETTING,
+			usbmisc->base + data->index * 4);
+
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
 	usbmisc_imx6q_set_wakeup(data, false);
 
 	return 0;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
