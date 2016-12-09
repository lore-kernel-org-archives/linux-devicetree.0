From: Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH 1/2] dt-bindings: usb: add DT binding for s3c2410 USB device controller
Date: Fri,  9 Dec 2016 17:06:39 -0200
Message-ID: <1481310400-28676-2-git-send-email-sergio.prado@e-labworks.com>
References: <1481310400-28676-1-git-send-email-sergio.prado@e-labworks.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481310400-28676-1-git-send-email-sergio.prado@e-labworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, balbi@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
List-Id: devicetree@vger.kernel.org

Adds the device tree bindings description for Samsung S3C2410 and
compatible USB device controller.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 .../devicetree/bindings/usb/s3c2410-usb.txt        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
index e45b38ce2986..4d3f9894c2d4 100644
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
+		"usb-bus-gadget" for the USB bus clock
+		"usb-device" for the USB device clock
+
+Optional properties:
+ - samsung,vbus-gpio: If present, specifies a gpio that needs to be
+   activated for the bus to be powered.
+ - samsung,pullup-gpio: If present, specifies a gpio to control the
+   USB D+ pullup.
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
