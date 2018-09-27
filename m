From: Lukasz Majewski <lukma@denx.de>
Subject: [PATCH] dt-bindings: misc: bk4: Add device tree binding for Liebherr's BK4 SPI bus
Date: Fri, 28 Sep 2018 00:26:55 +0200
Message-ID: <20180927222655.24482-1-lukma@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
List-Id: devicetree@vger.kernel.org

Add Device Tree binding document for Liebherr's BK4 external SPI bus.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 Documentation/devicetree/bindings/misc/lwn-bk4.txt | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/lwn-bk4.txt

diff --git a/Documentation/devicetree/bindings/misc/lwn-bk4.txt b/Documentation/devicetree/bindings/misc/lwn-bk4.txt
new file mode 100644
index 000000000000..d6a8c188c087
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/lwn-bk4.txt
@@ -0,0 +1,26 @@
+* Liebherr's BK4 controller external SPI
+
+A device which handles data acquisition from compatible industrial
+peripherals.
+The SPI is used for data and management purposes in both master and
+slave modes.
+
+Required properties:
+
+- compatible : Should be "lwn,bk4"
+
+Required SPI properties:
+
+- reg : Should be address of the device chip select within
+  the controller.
+
+- spi-max-frequency : Maximum SPI clocking speed of device in Hz, should be
+  30MHz at most for the Liebherr's BK4 external bus.
+
+Example:
+
+spidev0: spi@0 {
+	compatible = "lwn,bk4";
+	spi-max-frequency = <30000000>;
+	reg = <0>;
+};
-- 
2.11.0
