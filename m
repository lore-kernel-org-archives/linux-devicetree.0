From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 4/7] USB chipidea: introduce dual role mode pdata flags
Date: Fri, 31 May 2013 20:38:46 +0200
Message-ID: <1370025529-7414-5-git-send-email-mgr@pengutronix.de>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370025529-7414-1-git-send-email-mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Even if a chipidea core is otg capable the board may not. This allows
to explicitly set the core to host/peripheral mode. Without these
flags the driver falls back to the old behaviour.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/usb/ci13xxx-imx.txt        |  1 +
 drivers/usb/chipidea/core.c                        | 24 ++++++++++++++++------
 include/linux/usb/chipidea.h                       |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
index 184a8e0..b4b5b79 100644
--- a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
+++ b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
@@ -9,6 +9,7 @@ Recommended properies:
 - phy_type: the type of the phy connected to the core. Should be one
   of "utmi", "utmi_wide", "ulpi", "serial" or "hsic". Without this
   property the PORTSC register won't be touched
+- dr_mode: One of "host", "peripheral" or "otg". Defaults to "otg"
 
 Optional properties:
 - fsl,usbphy: phandler of usb phy that connects to the only one port
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index b49b682..dcf2a0b 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -404,6 +404,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 	struct resource	*res;
 	void __iomem	*base;
 	int		ret;
+	enum usb_dr_mode dr_mode;
 
 	if (!dev->platform_data) {
 		dev_err(dev, "platform data missing\n");
@@ -455,14 +456,25 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 	if (!ci->platdata->phy_mode)
 		ci->platdata->phy_mode = of_usb_get_phy_mode(dev->of_node);
 
+	if (!ci->platdata->dr_mode)
+		ci->platdata->dr_mode = of_usb_get_dr_mode(dev->of_node);
+
+	if (ci->platdata->dr_mode == USB_DR_MODE_UNKNOWN)
+		ci->platdata->dr_mode = USB_DR_MODE_OTG;
+
+	dr_mode = ci->platdata->dr_mode;
 	/* initialize role(s) before the interrupt is requested */
-	ret = ci_hdrc_host_init(ci);
-	if (ret)
-		dev_info(dev, "doesn't support host\n");
+	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_HOST) {
+		ret = ci_hdrc_host_init(ci);
+		if (ret)
+			dev_info(dev, "doesn't support host\n");
+	}
 
-	ret = ci_hdrc_gadget_init(ci);
-	if (ret)
-		dev_info(dev, "doesn't support gadget\n");
+	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_PERIPHERAL) {
+		ret = ci_hdrc_gadget_init(ci);
+		if (ret)
+			dev_info(dev, "doesn't support gadget\n");
+	}
 
 	if (!ci->roles[CI_ROLE_HOST] && !ci->roles[CI_ROLE_GADGET]) {
 		dev_err(dev, "no supported roles\n");
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 1a2aa18..b314647 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -20,7 +20,7 @@ struct ci13xxx_platform_data {
 #define CI13XXX_REQUIRE_TRANSCEIVER	BIT(1)
 #define CI13XXX_PULLUP_ON_VBUS		BIT(2)
 #define CI13XXX_DISABLE_STREAMING	BIT(3)
