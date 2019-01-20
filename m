Return-Path: <SRS0=zZyj=P4=davidjohnsummers.uk=beagleboard@kernel.org>
From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCH v3 2/2] Bluetooth: dt-bindings: Realtek serial bluetooth
Date: Sun, 20 Jan 2019 12:40:46 +0000
Message-Id: <20190120124046.6715-2-beagleboard@davidjohnsummers.uk>
In-Reply-To: <20190120124046.6715-1-beagleboard@davidjohnsummers.uk>
References: <20190120124046.6715-1-beagleboard@davidjohnsummers.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: David Summers <beagleboard@davidjohnsummers.uk>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Since v2, the compatible binding names have been changed to end in
-bt, as requested by robh. Also the example has been expanded.

As before, for these Realtek devices, are typicaly joint wifi and
bluetooth devices; with seperate interfaces which will be
independently wired to the cpu. For these devices wifi is sdio, whilst
bluetooth is a uart. This patchset just sets the device tree links for
the bluetooth interface.

The example device tree source code, alas hasn't been tested. It is a
copy of that used on the ASUS Tinker Board:

https://github.com/TinkerBoard/debian_kernel/commit/6a3128ade33f758887048578ada61a4b7ab8e678

If these patches are accepted, my next job will be to mainline the
rest of the Tinker Board patches - so if this element of the device
tree has to change, I will also update the example here.

Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
---
 .../bindings/net/realtek-bluetooth-serial.txt | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt

diff --git a/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
new file mode 100644
index 000000000000..119f9db4f87f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
@@ -0,0 +1,32 @@
+Realtek bluetooth devices connected via a UART.
+These devices typically also have a wi-fi connected via sdio - the
+compatible described here is used just for referencing the bluetooth.
+
+- compatible: should be "realtek,<name>-bt"
+  except for "realtek,trl8761atv" - which only has a serial bluetooth connection
+       "realtek,rtl8723as-bt"
+       "realtek,rtl8723bs-bt"
+       "realtek,rtl8723ds-bt"
+       "realtek,rtl8761atv"
+       "realtek,rtl8821as-bt"
+       "realtek,rtl8821cs-bt"
+       "realtek,rtl8822bs-bt"
+
+Example:
+
+&uart0 {
+	status = "okay";
+	pinctrl-0 = <&uart0_xfer>, <&uart0_cts>;
+	bluetooth {
+		compatible = "realtek,rtl8723bs-bluetooth";
+		uart_rts_gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default","rts_gpio";
+		pinctrl-0 = <&uart0_rts>;
+		pinctrl-1 = <&uart0_gpios>;
+		BT,reset_gpio    = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		BT,wake_gpio     = <&gpio4 26 GPIO_ACTIVE_HIGH>;
+		BT,wake_host_irq = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+this ensures that the bluetooth device is tied to the correct uart
-- 
beagleboard@davidjohnsummers.uk
