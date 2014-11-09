From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v1] usb: phy: nop: device tree documentation for vbus
Date: Sun,  9 Nov 2014 14:02:18 +0100
Message-ID: <1415538138-24434-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enhance the phy documentation by adding 2 new optional bindings :
 - the vbus gpio, which detects usb insertion
 - the vbus regulator, which provides current drawn from the usb cable

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt
index 1bd37fa..65dfe4b 100644
--- a/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt
+++ b/Documentation/devicetree/bindings/usb/usb-nop-xceiv.txt
@@ -17,6 +17,11 @@ Optional properties:
 
 - reset-gpios: Should specify the GPIO for reset.
 
+- vbus-gpios: should specify the GPIO detecting a VBus insertion
+              (see Documentation/devicetree/bindings/gpio/gpio.txt)
+- vbus-regulator : should specifiy the regulator supplying current drawn from
+  the VBus line (see Documentation/devicetree/bindings/regulator/regulator.txt).
+
 Example:
 
 	hsusb1_phy {
@@ -26,8 +31,11 @@ Example:
 		clock-names = "main_clk";
 		vcc-supply = <&hsusb1_vcc_regulator>;
 		reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+		vbus-gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		vbus-regulator = <&vbus_regulator>;
 	};
 
 hsusb1_phy is a NOP USB PHY device that gets its clock from an oscillator
 and expects that clock to be configured to 19.2MHz by the NOP PHY driver.
 hsusb1_vcc_regulator provides power to the PHY and GPIO 7 controls RESET.
+GPIO 13 detects VBus insertion, and accordingly notifies the vbus-regulator.
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
