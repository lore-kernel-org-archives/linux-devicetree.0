From: <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 1/2] usb: dwc2: Disable descriptor dma mode by default
Date: Tue, 6 May 2014 18:00:41 -0500
Message-ID: <1399417243-4614-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Even though the IP supports Descriptor DMA mode, it does not support SPLIT
transactions in this mode. So the driver, in its currently form, will not
support LS/FS devices when connected to a HS Hub if Descriptor DMA mode is
enabled.

So we disable descriptor dma mode by default and a provide device tree property
for users to enable it if they really want to.

Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
---
v2:
- Reworked patch to disable descriptor dma by default
- Removed unneeded helper variable
- Reword patch commit header
---
 drivers/usb/dwc2/platform.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index eaba547..cc50d00 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -134,6 +134,16 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		/* Default all params to autodetect */
 		dwc2_set_all_params(&defparams, -1);
 		params = &defparams;
+
+		/*
+		 * Disable descriptor dma mode by default as the HW can support
+		 * it, but does not support it for SPLIT transactions. One can
+		 * use the device tree property "dma-desc-enable", if one really
+		 * wants to enable descriptor dma mode.
+		 */
+		defparams.dma_desc_enable = 0;
+		of_property_read_u32(dev->dev.of_node, "dma-desc-enable",
+					&defparams.dma_desc_enable);
 	}
 
 	hsotg = devm_kzalloc(&dev->dev, sizeof(*hsotg), GFP_KERNEL);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
