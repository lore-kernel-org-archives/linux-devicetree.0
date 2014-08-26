From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/2] usb: phy: mxs: add imx6sx support
Date: Tue, 26 Aug 2014 10:55:17 +0800
Message-ID: <1409021718-5969-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add imx6sx support

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/phy/phy-mxs-usb.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index c42bdf0..00972ec 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -1,5 +1,5 @@
 /*
- * Copyright 2012-2013 Freescale Semiconductor, Inc.
+ * Copyright 2012-2014 Freescale Semiconductor, Inc.
  * Copyright (C) 2012 Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
  * on behalf of DENX Software Engineering GmbH
  *
@@ -125,7 +125,13 @@ static const struct mxs_phy_data imx6sl_phy_data = {
 		MXS_PHY_NEED_IP_FIX,
 };
 
+static const struct mxs_phy_data imx6sx_phy_data = {
+	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
+		MXS_PHY_NEED_IP_FIX,
+};
+
 static const struct of_device_id mxs_phy_dt_ids[] = {
+	{ .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
 	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
 	{ .compatible = "fsl,imx6q-usbphy", .data = &imx6q_phy_data, },
 	{ .compatible = "fsl,imx23-usbphy", .data = &imx23_phy_data, },
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
