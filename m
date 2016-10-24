From: ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Subject: [PATCH/RFT v2 16/17] USB: ohci-da8xx: Allow probing from DT
Date: Mon, 24 Oct 2016 18:46:33 +0200
Message-ID: <20161024164634.4330-17-ahaslam@baylibre.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161024164634.4330-1-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

This adds the compatible string to the ohci driver
to be able to probe from DT

Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/host/ohci-da8xx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index bebc3f0..1a8db25 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -273,6 +273,13 @@ static int ohci_da8xx_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
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
@@ -421,6 +428,7 @@ static int ohci_da8xx_resume(struct platform_device *dev)
 #endif
 	.driver		= {
 		.name	= "ohci",
+		.of_match_table = da8xx_ohci_ids,
 	},
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
