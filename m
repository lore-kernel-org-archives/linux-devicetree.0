From: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM64: dts: bcm2837-rpi-3-b: Add bcm43438 as serial slave device
Date: Mon, 31 Jul 2017 12:03:33 +0200
Message-ID: <1501495414-17103-1-git-send-email-loic.poulain@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add BCM43438 as a slave device of uart0 (pl011/ttyAMA0).
This allows to automatically insert the bcm43438 to the bluetooth
subsystem instead of relying on userspace helpers (hciattach).

Overwrite bootargs to use aux uart (ttyS0) instead of ttyAMA0.

Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/net/broadcom-bluetooth.txt | 29 ++++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts   | 17 +++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
new file mode 100644
index 0000000..c51ea1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -0,0 +1,29 @@
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
diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
index 972f14d..d0c669a 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
@@ -8,6 +8,11 @@
 	compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
 	model = "Raspberry Pi 3 Model B";
 
+	chosen {
+		/* BCM2835 8250 auxiliar UART instead of pl011 */
+		bootargs = "console=ttyS0,115200 earlycon";
+	};
+
 	memory {
 		reg = <0 0x40000000>;
 	};
@@ -39,3 +44,15 @@
 	status = "okay";
 	bus-width = <4>;
 };
+
+/* UART0 is used to drive bcm43438 bluetooth controller */
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_gpio32 &gpclk2_gpio43>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <921600>;
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
