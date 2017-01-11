From: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: usb: add DT binding for s3c2410 USB device controller
Date: Wed, 11 Jan 2017 20:02:29 -0200
Message-ID: <1484172150-32075-2-git-send-email-sergio.prado@e-labworks.com>
References: <1484172150-32075-1-git-send-email-sergio.prado@e-labworks.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484172150-32075-1-git-send-email-sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds the device tree bindings description for Samsung S3C2410 and
compatible USB device controller.

Signed-off-by: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
---
 .../devicetree/bindings/usb/s3c2410-usb.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
index e45b38ce2986..28353eea31fd 100644
--- a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
+++ b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
@@ -20,3 +20,31 @@ usb0: ohci@49000000 {
 	clocks = <&clocks UCLK>, <&clocks HCLK_USBH>;
 	clock-names = "usb-bus-host", "usb-host";
 };
+
+Samsung S3C2410 and compatible USB device controller
+
+Required properties:
+ - compatible: Should be one of the following
+	       "samsung,s3c2410-udc"
+	       "samsung,s3c2440-udc"
+ - reg: address and length of the controller memory mapped region
+ - interrupts: interrupt number for the USB device controller
+ - clocks: Should reference the bus and host clocks
+ - clock-names: Should contain two strings
+		"uclk" for the USB bus clock
+		"usb-device" for the USB device clock
+
+Optional properties:
+ - samsung,vbus-gpio: specifies a gpio that allows to detect whether
+   vbus is present - USB is connected (active high, input).
+ - samsung,pullup-gpio: If present, specifies a gpio to control the
+   USB D+ pullup (active high, output).
+
+usb1: udc@52000000 {
+	compatible = "samsung,s3c2440-udc";
+	reg = <0x52000000 0x100000>;
+	interrupts = <0 0 25 3>;
+	clocks = <&clocks UCLK>, <&clocks HCLK_USBD>;
+	clock-names = "usb-bus-gadget", "usb-device";
+	samsung,pullup-gpio = <&gpc 5 GPIO_ACTIVE_HIGH>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
