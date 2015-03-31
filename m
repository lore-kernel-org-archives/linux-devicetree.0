From: Robert Baldyga <r.baldyga@samsung.com>
Subject: [PATCH 4/4] Documentation: extcon: usb-gpio: update usb-gpio binding
 description
Date: Tue, 31 Mar 2015 09:46:03 +0200
Message-ID: <1427787963-23562-5-git-send-email-r.baldyga@samsung.com>
References: <1427787963-23562-1-git-send-email-r.baldyga@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427787963-23562-1-git-send-email-r.baldyga@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, rogerq@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, Robert Baldyga <r.baldyga@samsung.com>
List-Id: devicetree@vger.kernel.org

Add information about VBUS pin detection support, 'debounce' property
and some other details.

Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
---
 .../devicetree/bindings/extcon/extcon-usb-gpio.txt | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
index af0b903..d3fcf8b 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
@@ -1,16 +1,35 @@
 USB GPIO Extcon device
 
-This is a virtual device used to generate USB cable states from the USB ID pin
-connected to a GPIO pin.
+This is a virtual device used to generate USB cable states from the USB
+ID and VBUS signals connected to a GPIO pins.
+
+Some devices has only one of these GPIO pins, so we support cases when
+only one of them is present. Hence properties 'id-gpio' and 'vbus-gpio'
+are described as optional, but at least one of them has to be present
+in extcon-usb-gpio node.
+
+In general we have three cases:
+ 1. We have both VBUS and ID pin detection - we can detect USB, USB-HOST
+    and cable disconnection.
+ 2. We have only VBUS detection - we can detect USB and cable disconnection.
+ 3. We have ID pin only - we can distinguish between USB and USB-HOST
+    but without ability to detect cable disconnection.
 
 Required properties:
 - compatible: Should be "linux,extcon-usb-gpio"
+
+Optional properties
 - id-gpio: gpio for USB ID pin. See gpio binding.
+- vbus-gpio: gpio for USB VBUS pin. See gpio binding.
+- debounce: gpio debounce time in milliseconds (u32).
+
 
 Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
 	extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
 		id-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
+		vbus-gpio = <&gpio6 2 GPIO_ACTIVE_HIGH>;
+		debounce = <25>;
 	}
 
 	&omap_dwc3_1 {
-- 
1.9.1
