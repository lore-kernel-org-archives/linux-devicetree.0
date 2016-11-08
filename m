From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/3] USB: ohci: da8xx: Allow probing from DT
Date: Tue,  8 Nov 2016 19:58:30 +0100
Message-ID: <20161108185831.17683-3-ahaslam@baylibre.com>
References: <20161108185831.17683-1-ahaslam@baylibre.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161108185831.17683-1-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the compatible string to the ohci driver
to be able to probe from DT

Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/host/ohci-da8xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index 83b182e..bbfe342 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -321,6 +321,13 @@ static int ohci_da8xx_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 }
 
 /*-------------------------------------------------------------------------*/
+#ifdef CONFIG_OF
+static const struct of_device_id da8xx_ohci_ids[] = {
+	{ .compatible = "ti,da830-ohci" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, da8xx_ohci_ids);
+#endif
 
 static int ohci_da8xx_probe(struct platform_device *pdev)
 {
@@ -472,6 +479,7 @@ static struct platform_driver ohci_hcd_da8xx_driver = {
 #endif
 	.driver		= {
 		.name	= DRV_NAME,
+		.of_match_table = of_match_ptr(da8xx_ohci_ids),
 	},
 };
 
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
