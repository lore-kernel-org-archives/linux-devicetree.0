From: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 1/4] dt-bindings: net: bluetooth: Add broadcom-bluetooth
Date: Thu, 17 Aug 2017 19:59:48 +0200
Message-ID: <1502992791-10265-1-git-send-email-loic.poulain@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding document for serial bluetooth chips using
Broadcom protocol.

Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 v2: dt-bindings as separate patch
     rebase on upcoming pi3 dts changes
 v3: changes in bcm serdev drivers:
     name refactoring and additional comments
     Add generic host_set_baudrate method
     Use agnostic device_property_read
 v4: changes in doc and dts:
     Add additional params to broadcom bt dt-bindings
     Set the max baudrate to 2000000 instead of 921600
     use chosen/stdout-path instead of console=
     remove useless earlyprintk
     same changes in bcm283x.dtsi

 .../devicetree/bindings/net/broadcom-bluetooth.txt | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
new file mode 100644
index 0000000..4194ff7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -0,0 +1,35 @@
+Broadcom Bluetooth Chips
+---------------------
+
+This documents the binding structure and common properties for serial
+attached Broadcom devices.
+
+Serial attached Broadcom devices shall be a child node of the host UART
+device the slave device is attached to.
+
+Required properties:
+
+ - compatible: should contain one of the following:
+   * "brcm,bcm43438-bt"
+
+Optional properties:
+
+ - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
+ - shutdown-gpios: GPIO specifier, used to enable the BT module
+ - device-wakeup-gpios: GPIO specifier, used to wakeup the controller
+ - host-wakeup-gpios: GPIO specifier, used to wakeup the host processor
+ - clocks: clock specifier if external clock provided to the controller
+ - clock-names: should be "extclk"
+
+
+Example:
+
+&uart2 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&uart2_pins>;
+
+       bluetooth {
+               compatible = "brcm,bcm43438-bt";
+               max-speed = <921600>;
+       };
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
