Return-Path: <SRS0=xJLh=P5=davidjohnsummers.uk=beagleboard@kernel.org>
From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCH v4 2/2] dt-bindings: Create the file for Realtek Bluetooth serial devices
Date: Mon, 21 Jan 2019 20:39:28 +0000
Message-Id: <20190121203928.32723-2-beagleboard@davidjohnsummers.uk>
In-Reply-To: <20190121203928.32723-1-beagleboard@davidjohnsummers.uk>
References: <20190121203928.32723-1-beagleboard@davidjohnsummers.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: David Summers <beagleboard@davidjohnsummers.uk>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

With the changes requested by Marcel Holtmann and Rob Herring.

Capitalisation as requested.

Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
---
 .../bindings/net/realtek-bluetooth-serial.txt | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt

diff --git a/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
new file mode 100644
index 000000000000..2eddde1a0cf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
@@ -0,0 +1,32 @@
+Realtek Bluetooth devices connected via a UART.
+These devices typically also have a WI-FI connected via SDIO - the
+compatible described here is used just for referencing the Bluetooth.
+
+- compatible: should be "realtek,<name>-bt"
+  except for "realtek,trl8761atv" - which only has a serial Bluetooth connection
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
+		compatible = "realtek,rtl8723bs-bt";
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
+this ensures that the Bluetooth device is tied to the correct uart.
-- 
beagleboard@davidjohnsummers.uk
