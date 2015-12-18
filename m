From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [RFC PATCH 2/5] doc: dt-binding: generic onboard USB device
Date: Fri, 18 Dec 2015 17:33:56 +0800
Message-ID: <1450431239-16439-3-git-send-email-peter.chen@freescale.com>
References: <1450431239-16439-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450431239-16439-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add dt-binding documentation for generic onboard USB device.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 .../bindings/usb/generic-onboard-device.txt        | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/generic-onboard-device.txt

diff --git a/Documentation/devicetree/bindings/usb/generic-onboard-device.txt b/Documentation/devicetree/bindings/usb/generic-onboard-device.txt
new file mode 100644
index 0000000..cdb3014
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/generic-onboard-device.txt
@@ -0,0 +1,31 @@
+Generic Onboard USB Device 
+
+The node should be located at USB host controller's node or
+any USB HUB's node.
+
+Required properties:
+- compatible: should be "generic-onboard-device"
+
+Optional properties:
+- clocks: the input clock for USB device.
+- clock-frequency: the frequency for device's clock.
+- reset-gpios: Should specify the GPIO for reset.
+- reset-duration-us: the duration for assert reset signal, the time unit
+  is microsecond.
+
+Example:
+
+&usbh1 {
+	vbus-supply = <&reg_usb_h1_vbus>;
+        status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	hub: usb2415@01 {
+	       compatible = "generic-onboard-device";
+	       reg = <0x01>;
+	       clocks = <&clks IMX6QDL_CLK_CKO>;
+	       reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	       reset-duration-us = <10>;
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
