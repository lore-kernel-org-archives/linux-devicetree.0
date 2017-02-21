From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] doc: dt-bindings: usb251xb: mark reg as required
Date: Tue, 21 Feb 2017 09:56:19 +0100
Message-ID: <1487667379-2075-4-git-send-email-richard.leitner@skidata.com>
References: <1487667379-2075-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487667379-2075-1-git-send-email-richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mark the reg property as required and furthermore fix some typos and
spellings in the documentation.

Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 4d6bd73..0408d9e 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -7,18 +7,18 @@ Required properties :
  - compatible : Should be "microchip,usb251xb" or one of the specific types:
 	"microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
 	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi"
- - hub-reset-gpios : Should specify the gpio for hub reset
+ - reset-gpios : Should specify the gpio for hub reset
+ - reg : I2C address on the selected bus (default is <0x2C>)
 
 Optional properties :
- - reg : I2C address on the selected bus (default is <0x2C>)
  - skip-config : Skip Hub configuration, but only send the USB-Attach command
- - vendor-id : USB Vendor ID of the hub (16 bit, default is 0x0424)
- - product-id : USB Product ID of the hub (16 bit, default depends on type)
- - device-id : USB Device ID of the hub (16 bit, default is 0x0bb3)
- - language-id : USB Language ID (16 bit, default is 0x0000)
- - manufacturer : USB Manufacturer string (max 31 characters long)
- - product : USB Product string (max 31 characters long)
- - serial : USB Serial string (max 31 characters long)
+ - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
+ - product-id : Set USB Product ID of the hub (16 bit, default depends on type)
+ - device-id : Set USB Device ID of the hub (16 bit, default is 0x0bb3)
+ - language-id : Set USB Language ID (16 bit, default is 0x0000)
+ - manufacturer : Set USB Manufacturer string (max 31 characters long)
+ - product : Set USB Product string (max 31 characters long)
+ - serial : Set USB Serial string (max 31 characters long)
  - {bus,self}-powered : selects between self- and bus-powered operation (default
 	is self-powered)
  - disable-hi-speed : disable USB Hi-Speed support
@@ -33,7 +33,7 @@ Optional properties :
 	operation if the local power source is removed or unavailable
  - oc-delay-us : microseconds over current timer delay, valid values are 100,
 	4000, 8000 (default) and 16000. All other values are rounded up.
- - compound-device : indicated the hub is part of a compound device
+ - compound-device : indicate the hub is part of a compound device
  - port-mapping-mode : enable port mapping mode
  - string-support : enable string descriptor support (required for manufacturer,
 	product and serial string configuration)
@@ -48,7 +48,8 @@ Optional properties :
 Examples:
 	usb2512b@2c {
 		compatible = "microchip,usb2512b";
-		hub-reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+		reg = <0x2c>;
+		reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	};
 
 	usb2514b@2c {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
