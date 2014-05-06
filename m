From: <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 2/2] Documentation: dt: add an optional dma-desc-enable property for dwc2 usb
Date: Tue, 6 May 2014 18:00:42 -0500
Message-ID: <1399417243-4614-2-git-send-email-dinguyen@altera.com>
References: <1399417243-4614-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399417243-4614-1-git-send-email-dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

The "dma-desc-enable" property can be used to enable descriptor DMA mode
for the DWC2 USB IP.

Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
---
v2: Reword property description to enable instead of disable
---
 Documentation/devicetree/bindings/usb/dwc2.txt |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index b8b6871..9b471b5 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -14,6 +14,13 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
 Optional properties:
 - phys: phy provider specifier
 - phy-names: shall be "device"
+- dma-desc-enable: Should be <1> to enable descriptor dma mode. This
+	property is used to enable descriptor DMA support. The reason why
+	this property is needed is because the HW supports descriptor DMA
+	mode, but descriptor dma mode will not support SPLIT transactions.
+	So this property can be used to optionally enable descriptor DMA
+	support.
+
 Refer to phy/phy-bindings.txt for generic phy consumer properties
 
 Example:
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
