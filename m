From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 1/2] dt-bindings: phy: add binding for Freescale i.MX8MQ USB3 PHY
Date: Thu, 15 Nov 2018 15:12:46 +0100
Message-ID: <20181115141247.15221-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

This adds the binding for the USB3 PHY found on the i.MX8M SoC.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../bindings/phy/fsl,imx8mq-usb-phy.txt         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
new file mode 100644
index 000000000000..a22e853d710c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
@@ -0,0 +1,17 @@
+* Freescale i.MX8MQ USB3 PHY binding
+
+Required properties:
+- compatible:	Should be "fsl,imx8mq-usb-phy"
+- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
+- reg:		The base address and length of the registers
+- clocks:	phandles to the clocks for each clock listed in clock-names
+- clock-names:	must contain "phy"
+
+Example:
+	usb3_phy0: phy@381f0040 {
+		compatible = "fsl,imx8mq-usb-phy";
+		reg = <0x381f0040 0x40>;
+		clocks = <&clk IMX8MQ_CLK_USB1_PHY_ROOT>;
+		clock-names = "phy";
+		#phy-cells = <0>;
+	};
-- 
2.19.1
