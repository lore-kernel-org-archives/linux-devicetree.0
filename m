From: <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] usb: dwc2: Option to disable dma descriptor mode
Date: Mon, 5 May 2014 17:23:04 -0500
Message-ID: <1399328585-30949-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Even though the IP supports Descriptor DMA mode, it does not support SPLIT
transactions in this mode. Since the driver can get the Descriptor DMA mode
support from hardware, the driver in its currently form cannot fully support
LS/FS devices connected to a HS Hub when Descriptor DMA mode is enabled in the
driver. Thus, we give the option to disable Descriptor DMA from device tree.

Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/dwc2/platform.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index eaba547..cb2133c 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -123,6 +123,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	struct resource *res;
 	int retval;
 	int irq;
+	u32 prop;
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -135,6 +136,8 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		dwc2_set_all_params(&defparams, -1);
 		params = &defparams;
 	}
+	if (!of_property_read_u32(dev->dev.of_node, "dma-desc-enable", &prop))
+		defparams.dma_desc_enable = prop;
 
 	hsotg = devm_kzalloc(&dev->dev, sizeof(*hsotg), GFP_KERNEL);
 	if (!hsotg)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
