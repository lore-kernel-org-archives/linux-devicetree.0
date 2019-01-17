From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 1/4] Documentation: dt: Add binding info for jz4740-musb driver
Date: Thu, 17 Jan 2019 19:33:27 -0300
Message-ID: <20190117223330.16631-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This commit adds documentation for the device-tree bindings of the
jz4740-musb driver, which provides support for the USB gadget mode
of the JZ4740 and similar SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v2: No change

v3: No change

 .../bindings/usb/ingenic,jz4740-musb.txt           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt

diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt b/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
new file mode 100644
index 000000000000..620355cee63f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
@@ -0,0 +1,24 @@
+Ingenic JZ4740 MUSB driver
+
+Required properties:
+
+- compatible: Must be "ingenic,jz4740-musb"
+- reg: Address range of the UDC register set
+- interrupts: IRQ number related to the UDC hardware
+- interrupt-names: must be "mc"
+- clocks: phandle to the "udc" clock
+- clock-names: must be "udc"
+
+Example:
+
+udc: usb@13040000 {
+	compatible = "ingenic,jz4740-musb";
+	reg = <0x13040000 0x10000>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <24>;
+	interrupt-names = "mc";
+
+	clocks = <&cgu JZ4740_CLK_UDC>;
+	clock-names = "udc";
+};
-- 
2.11.0
