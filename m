From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [RESEND DT 2/2] usb: gadget: pxa27x_udc device-tree documentation
Date: Wed, 11 Jun 2014 23:12:21 +0200
Message-ID: <1402521141-26235-2-git-send-email-robert.jarzmik@free.fr>
References: <1402521141-26235-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402521141-26235-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: balbi-l0cyMroinI0@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation for device-tree binding of arm PXA 27x udc (usb
device) driver.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/pxa-usb.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/pxa-usb.txt b/Documentation/devicetree/bindings/usb/pxa-usb.txt
index 79729a9..460b91d 100644
--- a/Documentation/devicetree/bindings/usb/pxa-usb.txt
+++ b/Documentation/devicetree/bindings/usb/pxa-usb.txt
@@ -29,3 +29,23 @@ Example:
 		marvell,port-mode = <2>; /* PMM_GLOBAL_MODE */
 	};
 
+UDC
+
+Required properties:
+ - compatible: Should be "mrvl,pxa27x_udc" for USB controllers
+   used in device mode.
+
+Optional properties:
+ - "udc-pullup-gpio" - gpio activated to control the USB D+ pullup.
+ - "udc-pullup-gpio-inverted" - boolean inverting gpio pullup logic.
+
+Example:
+
+		pxa27x_udc: udc@40600000 {
+			compatible = "mrvl,pxa27x_udc";
+			reg = <0x40600000 0x10000>;
+			interrupts = <11>;
+			clocks = <&pxa2xx_clks 11>;
+			clock-names = "pxa27x-udc";
+			udc-pullup-gpio = <22>;
+		};
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
